-- Q2: نرخ استخراج (kg/kg ore) به تفکیک دما
SELECT
    CASE
        WHEN temp_c < 28 THEN 'low'
        WHEN temp_c < 33 THEN 'medium'
        ELSE 'high'
    END AS temp_range,
    ROUND(SUM(m.cu_extracted_kg) / SUM(b.ore_kg), 4) AS extraction_rate
FROM leach_batches b
JOIN measurements m USING (batch_id)
GROUP BY temp_range;