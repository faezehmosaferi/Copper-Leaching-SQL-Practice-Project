-- Q1: فاصله زمانی بین اندازه‌گیری‌های متوالی هر بچ
SELECT
    batch_id,
    recorded_at,
    LAG(recorded_at) OVER (PARTITION BY batch_id ORDER BY recorded_at) AS prev_time,
    recorded_at - LAG(recorded_at) OVER (PARTITION BY batch_id ORDER BY recorded_at) AS gap
FROM measurements;