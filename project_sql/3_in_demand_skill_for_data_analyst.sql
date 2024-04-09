/*
Q&A: What are the most-in demand skills for data analyst?
-Focus on all job postings.
-WFH set up
-Retrieve the top 5 skills with the highest demand in the job market.
*/

SELECT 
        skills,
        COUNT(skills_job_dim.job_id) AS demand_skill_count
FROM 
        job_postings_fact
INNER JOIN  
        skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN 
        skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
        job_title_short = 'Data Analyst' AND
        job_work_from_home = 'True'
GROUP BY
        skills
ORDER BY
        demand_skill_count DESC
LIMIT 
        5;