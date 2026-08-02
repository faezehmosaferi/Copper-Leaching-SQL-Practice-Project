-- Q1: ایندکس‌های پیشنهادی
CREATE INDEX idx_meas_batch_time ON measurements(batch_id, recorded_at);
CREATE INDEX idx_batch_site ON leach_batches(site_id);

-- Q2: EXPLAIN ANALYZE روی کوئری سنگین
EXPLAIN ANALYZE
SELECT s.name, SUM(m.cu_extracted_kg)
FROM sites s
JOIN leach_batches b USING (site_id)
JOIN measurements m USING (batch_id)
GROUP BY s.name;