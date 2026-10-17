package com.github.caguilar92.oracledb26aibackend.vector_search.model;

import java.time.LocalDate;

/**
 * A maintenance request belonging to the asset identified by assetId.
 * resolvedDate is null until the request is resolved.
 */
public class MaintenanceRequest {
    private String id;
    private String assetId;
    private String title;
    private MaintenanceStatus status;
    private LocalDate reportedDate;
    private LocalDate resolvedDate;
    private String problem;
    private String findings;
    private String solutionRemarks;
    private String outcome;

    public MaintenanceRequest() {
    }

    public MaintenanceRequest(
            String id,
            String assetId,
            String title,
            MaintenanceStatus status,
            LocalDate reportedDate,
            LocalDate resolvedDate,
            String problem,
            String findings,
            String solutionRemarks,
            String outcome
    ) {
        this.id = id;
        this.assetId = assetId;
        this.title = title;
        this.status = status;
        this.reportedDate = reportedDate;
        this.resolvedDate = resolvedDate;
        this.problem = problem;
        this.findings = findings;
        this.solutionRemarks = solutionRemarks;
        this.outcome = outcome;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAssetId() {
        return assetId;
    }

    public void setAssetId(String assetId) {
        this.assetId = assetId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public MaintenanceStatus getStatus() {
        return status;
    }

    public void setStatus(MaintenanceStatus status) {
        this.status = status;
    }

    public LocalDate getReportedDate() {
        return reportedDate;
    }

    public void setReportedDate(LocalDate reportedDate) {
        this.reportedDate = reportedDate;
    }

    public LocalDate getResolvedDate() {
        return resolvedDate;
    }

    public void setResolvedDate(LocalDate resolvedDate) {
        this.resolvedDate = resolvedDate;
    }

    public String getProblem() {
        return problem;
    }

    public void setProblem(String problem) {
        this.problem = problem;
    }

    public String getFindings() {
        return findings;
    }

    public void setFindings(String findings) {
        this.findings = findings;
    }

    public String getSolutionRemarks() {
        return solutionRemarks;
    }

    public void setSolutionRemarks(String solutionRemarks) {
        this.solutionRemarks = solutionRemarks;
    }

    public String getOutcome() {
        return outcome;
    }

    public void setOutcome(String outcome) {
        this.outcome = outcome;
    }
}
