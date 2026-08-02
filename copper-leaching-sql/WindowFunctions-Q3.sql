-- Q3: درصد تجمعی استخراج در طول هر بچ
SELECT
    batch_id,
    recorded_at,
    cu_extracted_kg,
    SUM(cu_extracted_kg) OVER (PARTITION BY batch_id ORDER BY recorded_at) AS cumulative_cu,
    ROUND(
        100.0 * SUM(cu_extracted_kg) OVER (PARTITION BY batch_id ORDER BY recorded_at)
        / SUM(cu_extracted_kg) OVER (PARTITION BY batch_id), 2
    ) AS pct_complete
FROM measurements;