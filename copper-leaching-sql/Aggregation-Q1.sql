-- Q1: GROUPING SETS - خلاصه استخراج بر اساس سایت، ماه، و کل
SELECT
    s.minename AS site,
    DATE_TRUNC('month', m.recorded_at) AS month,
    SUM(m.cu_extracted_kg) AS total_cu
FROM measurements m
JOIN leach_batches b USING (batch_id)
JOIN sites s USING (site_id)
GROUP BY GROUPING SETS ((s.minename, DATE_TRUNC('month', m.recorded_at)), (s.minename), ());
