package com.github.caguilar92.oracledb26aibackend.vector_search.dao;

import com.github.caguilar92.oracledb26aibackend.vector_search.dao.mappers.AssetRowMapper;
import com.github.caguilar92.oracledb26aibackend.vector_search.model.Asset;
import org.springframework.boot.context.config.ConfigDataNotFoundException;
import org.springframework.dao.support.DataAccessUtils;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcOperations;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Component
public class AssetDAO {

    private final AssetRowMapper rowMapper;

    private final JdbcClient jdbcClient;

    public AssetDAO(JdbcClient jdbcClient, AssetRowMapper rowMapper) {
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
