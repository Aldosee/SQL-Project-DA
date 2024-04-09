--PROJECT 1
/*
Q&A. Highest top-paying data analyst jobs?
--Identify the top 10 highest-paying data analyst job and roles that are remote.
--Focus on job postings with specififed salaries (exclude nulls).
--Why? Highlight the top-paying opportunities for data analyst, offering insights into employment
*/

SELECT *
FROM job_postings_fact
LIMIT 10;

SELECT 
    job_id,
    job_title,
    job_location,
    job_via,
    job_schedule_type,
    job_work_from_home,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
WHERE 
    salary_year_avg IS NOT NULL AND
    job_work_from_home = 'TRUE' AND
    job_title_short LIKE 'Data Analyst'
ORDER BY 
    salary_year_avg DESC
LIMIT 10;



--What company with the high paying jobs.

SELECT 
    job_id,
    job_title,
    name AS company_names,
    job_location,
    job_via,
    job_schedule_type,
    job_work_from_home,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN
    company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE
    salary_year_avg IS NOT NULL AND
    job_work_from_home = 'TRUE' AND
    job_title_short LIKE 'Data Analyst'
ORDER BY 
    salary_year_avg DESC
LIMIT 10


