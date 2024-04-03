
/*
Q&A: What are the most-in demand skills for data analyst?
-Focus on all job postings in any platform.
-Retrieve the top 5 skills with the highest demand in the job market,
providing insights into the most valuable skill for job seekers.
*/

WITH in_demand_skill AS (
SELECT 
        job_via,
        job_title,
        COUNT(*) AS counted_job,
        skill_id
FROM 
        job_postings_fact 
INNER JOIN 
        skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
WHERE 
        job_title_short = 'Data Analyst'
GROUP BY        
        job_title,
        job_via,
        skill_id      
ORDER BY
        counted_job DESC
LIMIT 5
)
SELECT 
        job_via,
        job_title,
        counted_job,
        skills
FROM 
        in_demand_skill
INNER JOIN     
        skills_dim ON in_demand_skill.skill_id = skills_dim.skill_id
ORDER BY
        counted_job DESC
LIMIT 5;


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