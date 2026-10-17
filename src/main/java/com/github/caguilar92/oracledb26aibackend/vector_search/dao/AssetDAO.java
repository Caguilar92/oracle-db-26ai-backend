package com.github.caguilar92.oracledb26aibackend.vector_search.dao;

import com.github.caguilar92.oracledb26aibackend.vector_search.model.Asset;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.stereotype.Component;
import java.util.List;
import java.util.Optional;

@Component
public class AssetDAO {

    private final RowMapper<Asset> rowMapper;

    private final JdbcClient jdbcClient;

    public AssetDAO(JdbcClient jdbcClient, RowMapper<Asset> rowMapper) {
        this.jdbcClient = jdbcClient;
        this.rowMapper = rowMapper;
    }

    public List<Asset> findAll() {
        String sql ="""
                SELECT ASSET_ID, ASSET_NAME, ASSET_TYPE, LOCATION, MODEL
                FROM ASSET
                ORDER BY ASSET_TYPE, ASSET_NAME
                """;
        return jdbcClient
                .sql(sql)
                .query(rowMapper)
                .list();
    }

    public Optional<Asset> findById(String id) {
        String sql ="""
                SELECT ASSET_ID, ASSET_NAME, ASSET_TYPE, LOCATION, MODEL
                FROM ASSET
                WHERE ASSET_ID = :id
                ORDER BY ASSET_TYPE, ASSET_NAME
                """;

        return jdbcClient
                .sql(sql)
                .param("id", id)
                .query(rowMapper)
                .optional();
    }
}
