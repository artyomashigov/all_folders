-- What are optimal skills for remote data analyst jobs?
-- We will identify based on top demanded on top paying skills.

WITH skills_demand AS(
    SELECT 
    sjd.skill_id,
    COUNT(sjd.job_id) AS job_count
FROM job_postings_fact jpf
INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
WHERE job_title_short = 'Data Analyst'
AND salary_year_avg IS NOT NULL
AND job_work_from_home = True
GROUP BY sjd.skill_id
),
average_salary AS(
   SELECT 
    sjd.skill_id,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact jpf
INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY sjd.skill_id
),
result AS(
SELECT 
    sd.skill_id,
    job_count,
    avg_salary
FROM skills_demand sd
INNER JOIN average_salary avs ON sd.skill_id = avs.skill_id)

SELECT result.skill_id,
    skills_dim.skills,
    job_count,
    avg_salary
FROM result
INNER JOIN skills_dim ON result.skill_id = skills_dim.skill_id
WHERE job_count > 10
ORDER BY 
    avg_salary DESC
LIMIT 25




