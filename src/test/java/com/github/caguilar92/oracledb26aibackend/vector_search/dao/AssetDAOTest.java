package com.github.caguilar92.oracledb26aibackend.vector_search.dao;

import com.github.caguilar92.oracledb26aibackend.vector_search.dao.mappers.AssetRowMapper;
import com.github.caguilar92.oracledb26aibackend.vector_search.model.Asset;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jdbc.test.autoconfigure.AutoConfigureTestDatabase;
import org.springframework.boot.jdbc.test.autoconfigure.JdbcTest;
import org.springframework.context.annotation.Import;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;


@JdbcTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
@Import({AssetDAO.class, AssetRowMapper.class})
class AssetDAOTest {

    @Autowired
    AssetDAO assetDAO;

    @Test
    void findAll() {
    List<Asset> assets = assetDAO.findAll();
    assertEquals(10, assets.size());

    }

    //Asset already inserted during sql initialization
    @Test
    void findByIdSuccess() {
        String seededAssetId = "TX-207";
        Optional<Asset> assetOptional = assetDAO.findById(seededAssetId);
        assertTrue(assetOptional.isPresent());
        assetOptional.ifPresent(asset -> assertEquals(seededAssetId, asset.getId()));
    }

    @Test
    void findByIdFailReturnsEmptyOptional() {
        String nonExistingAssetId = "non-existing-asset-id";
        Optional<Asset> assetOptional = assetDAO.findById(nonExistingAssetId);
        assertTrue(assetOptional.isEmpty());
    }


}