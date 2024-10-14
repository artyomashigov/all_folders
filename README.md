# SQL project

## Introduction

Here we are analyzing top paying jobs and skills using SQL.

## Background

The questions I wanted to answer are:

1. What are the top paying jobs in the tech industry?
2. Which skills are most in demand for these top paying jobs?
3. What are the optimal skills for data analyst jobs?

## Tools I Used


- **SQL**: Used for querying and managing data in relational databases, essential for analyzing job and skill data.
- **PostgreSQL**: A powerful, open-source relational database system used to store and retrieve the data efficiently.
- **VSCode**: A versatile code editor that provides an environment for writing and debugging SQL queries if you use extensions.
- **Git**: Used to track chagnes in our queries

## Analysis

In this analysis, we examined the salary data for various tech jobs and identified the skills that are most in demand. 
Code example
```sql
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
```

## Conclusions

For me, this project serves as an excellent way to revise both basic and advanced SQL skills. By working through real-world data and queries, I can ensure that I don't forget the essential concepts and techniques required for effective data analysis.







