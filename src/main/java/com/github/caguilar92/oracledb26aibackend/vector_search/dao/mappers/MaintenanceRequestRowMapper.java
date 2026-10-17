package com.github.caguilar92.oracledb26aibackend.vector_search.dao.mappers;

import com.github.caguilar92.oracledb26aibackend.vector_search.model.MaintenanceRequest;
import com.github.caguilar92.oracledb26aibackend.vector_search.model.MaintenanceStatus;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class MaintenanceRequestRowMapper implements RowMapper<MaintenanceRequest> {
    @Override
    public MaintenanceRequest mapRow(ResultSet rs, int rowNum) throws SQLException {
        Date reportedDate = rs.getDate("REPORTED_DATE");
        Date resolvedDate = rs.getDate("RESOLVED_DATE");
        return new MaintenanceRequest(
                rs.getString("REQUEST_ID"),
                rs.getString("ASSET_ID"),
                rs.getString("TITLE"),
                MaintenanceStatus.valueOf(rs.getString("STATUS")),
                reportedDate == null ? null : reportedDate.toLocalDate(),
                resolvedDate == null ? null : resolvedDate.toLocalDate(),
                rs.getString("PROBLEM"),
                rs.getString("FINDINGS"),
                rs.getString("SOLUTION_REMARKS"),
                rs.getString("OUTCOME")
        );
    }
}
