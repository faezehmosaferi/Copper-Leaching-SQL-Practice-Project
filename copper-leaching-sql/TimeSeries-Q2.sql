-- Q2: شناسایی بچ‌هایی که در آن‌ها افزایش ناگهانی داشته (> 0.3 واحد)
WITH ph_diff AS (
    SELECT
        batch_id,
        recorded_at,
        ph,
        ph - LAG(ph) OVER (PARTITION BY batch_id ORDER BY recorded_at) AS ph_change
    FROM measurements
)
SELECT * FROM ph_diff WHERE ABS(ph_change) > 0.3;