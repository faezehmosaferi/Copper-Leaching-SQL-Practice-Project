-- Q1: شماره اندازه گیری هایی که بازیابی‌شان بالاتر از میانگین سایت است
WITH site_avg AS (
    SELECT b.site_id, AVG(m.cu_extracted_kg) AS avg_cu
    FROM leach_batches b
    JOIN measurements m USING (batch_id)
    GROUP BY b.site_id
)
SELECT m.meas_id, m.batch_id, b.site_id, m.cu_extracted_kg, sa.avg_cu
FROM measurements m
JOIN leach_batches b USING (batch_id)
JOIN site_avg sa USING (site_id)
WHERE m.cu_extracted_kg > sa.avg_cu
ORDER BY b.site_id, m.meas_id;
