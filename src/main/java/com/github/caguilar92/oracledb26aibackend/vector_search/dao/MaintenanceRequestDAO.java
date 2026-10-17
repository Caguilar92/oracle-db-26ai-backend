package com.github.caguilar92.oracledb26aibackend.vector_search.dao;

import com.github.caguilar92.oracledb26aibackend.vector_search.dao.mappers.MaintenanceRequestRowMapper;
import com.github.caguilar92.oracledb26aibackend.vector_search.model.MaintenanceRequest;
import com.github.caguilar92.oracledb26aibackend.vector_search.model.MaintenanceSearchCriteria;
import com.github.caguilar92.oracledb26aibackend.vector_search.model.SearchScope;
import org.springframework.dao.support.DataAccessUtils;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcOperations;
import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.sql.Types;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;

@Component
public class MaintenanceRequestDAO {
    private final MaintenanceRequestRowMapper rowMapper;
    private final JdbcClient jdbcClient;

    public MaintenanceRequestDAO(JdbcClient jdbcClient, MaintenanceRequestRowMapper rowMapper) {
        this.jdbcClient = jdbcClient;
        this.rowMapper = rowMapper;
    }

    public Optional<MaintenanceRequest> findById(String id) {
        String sql = """
                SELECT REQUEST_ID, ASSET_ID, TITLE, STATUS,
                       REPORTED_DATE, RESOLVED_DATE, PROBLEM,
                       FINDINGS, SOLUTION_REMARKS, OUTCOME
                FROM MAINTENANCE_REQUEST
                WHERE REQUEST_ID = :id
                """;
        return jdbcClient
                .sql(sql)
                .param("id", id)
                .query(rowMapper)
                .optional();
    }

    public List<MaintenanceRequest> findByAssetId(String assetId) {
        String sql = """
                SELECT REQUEST_ID, ASSET_ID, TITLE, STATUS,
                       REPORTED_DATE, RESOLVED_DATE, PROBLEM,
                       FINDINGS, SOLUTION_REMARKS, OUTCOME
                FROM MAINTENANCE_REQUEST
                WHERE ASSET_ID = :assetId
                ORDER BY REPORTED_DATE DESC, REQUEST_ID
                """;
        return jdbcClient
                .sql(sql)
                .param("assetId",assetId)
                .query(rowMapper)
                .list();
    }

    public long countByAssetId(String assetId) {
        String sql = """
                SELECT COUNT(*)
                FROM MAINTENANCE_REQUEST
                WHERE ASSET_ID = :assetId
                """;

        return jdbcClient
                .sql(sql)
                .param("assetId", assetId)
                .query(Integer.class)
                .single();
    }

    /** Rank filtered requests by exact cosine distance to the full query embedding. */
    public List<MaintenanceRequest> search(MaintenanceSearchCriteria criteria) {
        validateCriteria(criteria);
        String query = criteria.getQuery() == null ? "" : criteria.getQuery().trim();
        MapSqlParameterSource params = filterParameters(criteria).addValue("query",query, Types.VARCHAR);

        if (query.isBlank()) return browse(params);

        String sql = """
                WITH query_embedding AS (
                    SELECT VECTOR_EMBEDDING(
                        PDB1_ADMIN.ALL_MINILM_L12_V2 USING :query AS DATA
                    ) AS embedding
                )
                SELECT r.REQUEST_ID, r.ASSET_ID, r.TITLE, r.STATUS,
                       r.REPORTED_DATE, r.RESOLVED_DATE, r.PROBLEM,
                       r.FINDINGS, r.SOLUTION_REMARKS, r.OUTCOME
                FROM MAINTENANCE_REQUEST r
                JOIN ASSET a ON a.ASSET_ID = r.ASSET_ID
                CROSS JOIN query_embedding q
                WHERE (
                    :scope = 'ALL'
                    OR (:scope = 'ASSET' AND r.ASSET_ID = :assetId)
                    OR (:scope = 'SIMILAR' AND a.ASSET_TYPE = (
                        SELECT ASSET_TYPE FROM ASSET WHERE ASSET_ID = :assetId
                    ))
                )
                AND (:status IS NULL OR r.STATUS = :status)
                AND r.SEARCH_EMBEDDING IS NOT NULL
                ORDER BY VECTOR_DISTANCE(r.SEARCH_EMBEDDING, q.embedding, COSINE),
                         r.REPORTED_DATE DESC, r.REQUEST_ID
                FETCH FIRST 20 ROWS ONLY
                """;
        return jdbcClient
                .sql(sql)
                .paramSource(params)
                .query(rowMapper)
                .list();
    }

    private List<MaintenanceRequest> browse(MapSqlParameterSource params) {
        String sql = """
                SELECT r.REQUEST_ID, r.ASSET_ID, r.TITLE, r.STATUS,
                       r.REPORTED_DATE, r.RESOLVED_DATE, r.PROBLEM,
                       r.FINDINGS, r.SOLUTION_REMARKS, r.OUTCOME
                FROM MAINTENANCE_REQUEST r
                JOIN ASSET a ON a.ASSET_ID = r.ASSET_ID
                WHERE (
                    :scope = 'ALL'
                    OR (:scope = 'ASSET' AND r.ASSET_ID = :assetId)
                    OR (:scope = 'SIMILAR' AND a.ASSET_TYPE = (
                        SELECT ASSET_TYPE FROM ASSET WHERE ASSET_ID = :assetId
                    ))
                )
                AND (:status IS NULL OR r.STATUS = :status)
                ORDER BY r.REPORTED_DATE DESC, r.REQUEST_ID
                """;
        return jdbcClient
                .sql(sql)
                .paramSource(params)
                .query(rowMapper)
                .list();
    }

    private MapSqlParameterSource filterParameters(MaintenanceSearchCriteria criteria) {
        return new MapSqlParameterSource()
                .addValue("scope", criteria.getScope().name(), Types.VARCHAR)
                .addValue("assetId", criteria.getAssetId(), Types.VARCHAR)
                .addValue("status", criteria.getStatus() == null ? null : criteria.getStatus().name(), Types.VARCHAR);
    }

    private void validateCriteria(MaintenanceSearchCriteria criteria) {
        Objects.requireNonNull(criteria, "Search criteria are required");
        SearchScope scope = Objects.requireNonNull(criteria.getScope(), "Search scope is required");
        if (scope != SearchScope.ALL && (criteria.getAssetId() == null || criteria.getAssetId().isBlank())) {
            throw new IllegalArgumentException("assetId is required for ASSET and SIMILAR scopes");
        }
    }

}
