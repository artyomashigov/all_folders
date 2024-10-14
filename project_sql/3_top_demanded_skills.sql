-- Identify top-5 most demanded skills for data analyts.

SELECT 
    skills,
    COUNT(sjd.job_id) AS job_count
FROM job_postings_fact jpf
INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
WHERE job_title_short = 'Data Analyst'
GROUP BY skills
ORDER BY job_count DESC
LIMIT 5