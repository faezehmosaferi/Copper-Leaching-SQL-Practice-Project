-- seed.sql  (values grounded in published Cu-oxide leaching kinetics)
TRUNCATE measurements, leach_batches, sites RESTART IDENTITY CASCADE;

INSERT INTO sites (site_id, minename, region, opened_at) VALUES
  (1, 'Sarcheshmeh', 'Kerman',           '2000-01-01'),
  (2, 'Sungun',      'East Azerbaijan',  '2008-06-15');

-- Batch parameters reflect realistic H2SO4 / temp combinations from literature
INSERT INTO leach_batches (site_id, started_at, ended_at, ore_kg, acid_conc, temp_c) VALUES
  (1, '2024-01-01', '2024-01-10', 50000, 15.0, 25.0),  -- low acid, ambient temp  → ~55% recovery
  (1, '2024-01-11', '2024-01-20', 48000, 30.0, 40.0),  -- mid acid, elevated temp → ~75% recovery
  (2, '2024-01-05', '2024-01-15', 60000, 50.0, 50.0);  -- high acid, high temp    → ~82% recovery

-- Cu grade assumed ~0.8% (typical oxide ore); ore_kg × 0.008 = total Cu available
-- Extraction follows shrinking-core kinetics: slow start, accelerating mid, plateau near end
-- batch 1: target ~55% of (50000×0.008=400 kg) ≈ 220 kg final
INSERT INTO measurements (batch_id, recorded_at, cu_extracted_kg, ph) VALUES
  (1, '2024-01-02', 18.0,  1.9),
  (1, '2024-01-04', 62.0,  1.7),
  (1, '2024-01-06', 118.0, 1.6),
  (1, '2024-01-08', 172.0, 1.55),
  (1, '2024-01-10', 214.0, 1.5),

-- batch 2: target ~75% of (48000×0.008=384 kg) ≈ 288 kg final
  (2, '2024-01-12', 28.0,  1.8),
  (2, '2024-01-14', 95.0,  1.6),
  (2, '2024-01-16', 178.0, 1.45),
  (2, '2024-01-18', 248.0, 1.35),
  (2, '2024-01-20', 285.0, 1.3),

-- batch 3: target ~82% of (60000×0.008=480 kg) ≈ 394 kg final
  (3, '2024-01-06', 42.0,  1.85),
  (3, '2024-01-08', 130.0, 1.6),
  (3, '2024-01-10', 228.0, 1.45),
  (3, '2024-01-12', 330.0, 1.35),
  (3, '2024-01-15', 391.0, 1.28);

