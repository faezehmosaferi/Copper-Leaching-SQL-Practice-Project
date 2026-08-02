CREATE TABLE sites (
    site_id   SERIAL PRIMARY KEY,
    minename  VARCHAR(100),
    region    VARCHAR(50),
    opened_at DATE
);

CREATE TABLE leach_batches (
    batch_id    SERIAL PRIMARY KEY,
    site_id     INT REFERENCES sites(site_id),
    started_at  TIMESTAMP,
    ended_at    TIMESTAMP,
    ore_kg      NUMERIC(12,2),
    acid_conc   NUMERIC(5,2),  -- g/L
    temp_c      NUMERIC(5,2)
);

CREATE TABLE measurements (
    meas_id     SERIAL PRIMARY KEY,
    batch_id    INT REFERENCES leach_batches(batch_id),
    recorded_at TIMESTAMP,
    cu_extracted_kg NUMERIC(10,2),
    ph          NUMERIC(4,2)
);
