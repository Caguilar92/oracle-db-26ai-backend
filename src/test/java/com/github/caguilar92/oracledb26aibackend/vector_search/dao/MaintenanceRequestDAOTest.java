package com.github.caguilar92.oracledb26aibackend.vector_search.dao;

import com.github.caguilar92.oracledb26aibackend.vector_search.dao.mappers.MaintenanceRequestRowMapper;
import com.github.caguilar92.oracledb26aibackend.vector_search.model.MaintenanceRequest;
import com.github.caguilar92.oracledb26aibackend.vector_search.model.MaintenanceSearchCriteria;
import com.github.caguilar92.oracledb26aibackend.vector_search.model.MaintenanceStatus;
import com.github.caguilar92.oracledb26aibackend.vector_search.model.SearchScope;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jdbc.test.autoconfigure.AutoConfigureTestDatabase;
import org.springframework.boot.jdbc.test.autoconfigure.JdbcTest;
import org.springframework.context.annotation.Import;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

@JdbcTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
@Import({MaintenanceRequestDAO.class, MaintenanceRequestRowMapper.class})
class MaintenanceRequestDAOTest {

    @Autowired
    MaintenanceRequestDAO maintenanceRequestDAO;

    MaintenanceRequest maintenanceRequest = new MaintenanceRequest(
            "WR-2084",
            "SS-02",
            "Rainwater inside east control building",
            MaintenanceStatus.RESOLVED,
            LocalDate.now(),
            LocalDate.now(),
            "Water was found near the control-building entry after heavy rain.",
            "Inspection traced the ingress to a damaged weather seal.",
            "Repaired the seal and inspected the affected interior area.",
            "Next follow-up inspection found no fresh water ingress."



    );

    @Test
    void findByIdSuccess() {
        String seededMaintenanceRequestId = "WR-2084";
       Optional<MaintenanceRequest> optionalMaintenanceRequest = maintenanceRequestDAO.findById(seededMaintenanceRequestId);
       assertTrue(optionalMaintenanceRequest.isPresent());
       assertEquals(seededMaintenanceRequestId, optionalMaintenanceRequest.get().getId());
    }

    @Test
    void findByIdFailDoesNotExist() {
        assertTrue(maintenanceRequestDAO.findById("non-existing-request-id").isEmpty());
    }

    @Test
    void findByAssetIdSuccess() {
        List<MaintenanceRequest> requests = maintenanceRequestDAO.findByAssetId("SS-02");

        assertEquals(10, requests.size());
        assertTrue(requests.stream().allMatch(request -> "SS-02".equals(request.getAssetId())));
        assertEquals(List.of("WR-2090", "WR-2089", "WR-2088", "WR-2087", "WR-2086",
                        "WR-2085", "WR-2084", "WR-2083", "WR-2082", "WR-2081"),
                requests.stream().map(MaintenanceRequest::getId).toList());
    }

    @Test
    void findByAssetIdFailDoesNotExist() {
        assertTrue(maintenanceRequestDAO.findByAssetId("non-existing-asset-id").isEmpty());
    }


    @Test
    void countByAssetIdSuccess() {
        assertEquals(10L, maintenanceRequestDAO.countByAssetId("SS-02"));
    }

    @Test
    void searchSuccess() {
        MaintenanceSearchCriteria criteria = new MaintenanceSearchCriteria(
                "SS-02", SearchScope.ASSET, MaintenanceStatus.RESOLVED, "rainwater ingress");

        List<MaintenanceRequest> requests = maintenanceRequestDAO.search(criteria);

        assertFalse(requests.isEmpty());
        assertTrue(requests.size() <= 20);
        assertTrue(requests.stream().allMatch(request -> "SS-02".equals(request.getAssetId())));
        assertTrue(requests.stream().allMatch(request -> request.getStatus() == MaintenanceStatus.RESOLVED));
        assertTrue(requests.stream().anyMatch(request -> "WR-2084".equals(request.getId())));
    }

    @Test
    void searchFailCriteriaIsNull() {
        NullPointerException exception = assertThrows(NullPointerException.class,
                () -> maintenanceRequestDAO.search(null));
        assertEquals("Search criteria are required", exception.getMessage());
    }

    @Test
    void searchFailScopeIsNull() {
        MaintenanceSearchCriteria criteria = new MaintenanceSearchCriteria("SS-02", null, null, null);

        NullPointerException exception = assertThrows(NullPointerException.class,
                () -> maintenanceRequestDAO.search(criteria));
        assertEquals("Search scope is required", exception.getMessage());
    }

    @Test
    void searchFailScopeNotAllAndAssetIdisNull() {
        for (SearchScope scope : List.of(SearchScope.ASSET, SearchScope.SIMILAR)) {
            MaintenanceSearchCriteria criteria = new MaintenanceSearchCriteria(null, scope, null, null);

            IllegalArgumentException exception = assertThrows(IllegalArgumentException.class,
                    () -> maintenanceRequestDAO.search(criteria));
            assertEquals("assetId is required for ASSET and SIMILAR scopes", exception.getMessage());
        }
    }

    @Test
    void searchFailScopeNotAllAndAssetIdIsBlank() {
        for (SearchScope scope : List.of(SearchScope.ASSET, SearchScope.SIMILAR)) {
            for (String assetId : List.of("", "   ")) {
                MaintenanceSearchCriteria criteria = new MaintenanceSearchCriteria(assetId, scope, null, null);

                IllegalArgumentException exception = assertThrows(IllegalArgumentException.class,
                        () -> maintenanceRequestDAO.search(criteria));
                assertEquals("assetId is required for ASSET and SIMILAR scopes", exception.getMessage());
            }
        }
    }


}
