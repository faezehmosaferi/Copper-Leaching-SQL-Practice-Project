-- Q1: رتبه‌بندی بچ‌ها بر اساس بازیابی مس در هر سایت
SELECT
    s.minename AS site,
    b.batch_id,
    SUM(m.cu_extracted_kg) AS total_cu,
    RANK() OVER (PARTITION BY b.site_id ORDER BY SUM(m.cu_extracted_kg) DESC) AS rank_in_site
FROM leach_batches b
JOIN measurements m USING (batch_id)
JOIN sites s USING (site_id)
GROUP BY b.batch_id, b.site_id, s.minename;
