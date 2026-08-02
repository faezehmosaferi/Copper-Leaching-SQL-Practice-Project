-- Q2: بازگشتی - تولید سری زمانی روزانه برای یک بازه و شمارش تعداد اندازه گیری ها
WITH RECURSIVE date_series AS (
    SELECT '2024-01-01'::DATE AS d
    UNION ALL
    SELECT d + 1 FROM date_series WHERE d < '2024-01-20'
)
SELECT d, COUNT(m.meas_id) AS measurements_that_day
FROM date_series
LEFT JOIN measurements m ON m.recorded_at::DATE = d
GROUP BY d ORDER BY d;
