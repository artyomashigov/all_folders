/*
Question: What skills are required for the top paying data analyst jobs?
- Use the top 10 highest paying remote jobs from the previous query
- Identify the skills required for these jobs
*/

WITH top_paying_jobs AS(
SELECT job_id,
    job_title,
    salary_year_avg,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10)
SELECT tpj.*,
    skills
FROM top_paying_jobs tpj
INNER JOIN skills_job_dim sjd on tpj.job_id = sjd.job_id
INNER JOIN skills_dim sd on sjd.skill_id = sd.skill_id
ORDER BY tpj.salary_year_avg DESC
;