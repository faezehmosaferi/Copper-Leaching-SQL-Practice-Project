-- Q3: بازنویسی با materialized CTE برای بهبود performance
WITH batch_summary AS MATERIALIZED (
    SELECT batch_id, SUM(cu_extracted_kg) AS total_cu
    FROM measurements
    GROUP BY batch_id
)
SELECT b.site_id, SUM(bs.total_cu)
FROM leach_batches b
JOIN batch_summary bs USING (batch_id)
GROUP BY b.site_id;
