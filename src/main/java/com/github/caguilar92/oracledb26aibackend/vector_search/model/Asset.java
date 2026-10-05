package com.github.caguilar92.oracledb26aibackend.vector_search.model;

import java.util.Objects;

/** An electric utility asset with independently stored maintenance requests. */
public class Asset {
    private String id;
    private String name;
    private AssetType type;
    private String location;
    private String model;

    public Asset() {
    }

    public Asset(
            String id,
            String name,
            AssetType type,
            String location,
            String model
    ) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.location = location;
        this.model = model;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public AssetType getType() {
        return type;
    }

    public void setType(AssetType type) {
        this.type = type;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        Asset asset = (Asset) o;
        return Objects.equals(id, asset.id);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }
}
