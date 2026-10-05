package com.github.caguilar92.oracledb26aibackend.vector_search.dao.mappers;

import com.github.caguilar92.oracledb26aibackend.vector_search.model.Asset;
import com.github.caguilar92.oracledb26aibackend.vector_search.model.AssetType;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class AssetRowMapper implements RowMapper<Asset> {
    @Override
    public Asset mapRow(ResultSet rs, int rowNum) throws SQLException {
        return new Asset(
                rs.getString("ASSET_ID"),
                rs.getString("ASSET_NAME"),
                AssetType.valueOf(rs.getString("ASSET_TYPE")),
                rs.getString("LOCATION"),
                rs.getString("MODEL")
        );
    }
}
