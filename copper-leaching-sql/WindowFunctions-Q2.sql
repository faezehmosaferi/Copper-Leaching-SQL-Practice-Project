-- Q2: میانگین متحرک ۳ نقطه‌ای استخراج مس برای هر بچ
SELECT
    batch_id,
    recorded_at,
    cu_extracted_kg,
    AVG(cu_extracted_kg) OVER (
        PARTITION BY batch_id
        ORDER BY recorded_at
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_avg_3
FROM measurements;
