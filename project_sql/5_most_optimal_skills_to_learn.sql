/* WHat are the most optimal skill to learn (high demand and high-paying)
-What skills in high demand with high average salary for DA
-Focus in remote positions with salaries
--Why? It target skills that offer job security (high demand) and financial benefits (high salary)
offering strategic insights for career development in data analysis.

*/

WITH skills_demand AS (
    SELECT 
            skills_dim.skill_id,
            skills_dim.skills,
            COUNT(skills_job_dim.job_id) AS demand_skill_count
    FROM 
            job_postings_fact
    INNER JOIN  
            skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN 
            skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
            job_title_short = 'Data Analyst' AND
            job_work_from_home = 'True' AND
            salary_year_avg IS NOT NULL
    GROUP BY
            skills_dim.skill_id

),
 average_salary AS (
    SELECT 
            skills_job_dim.skill_id,
            ROUND(AVG(salary_year_avg), 0) AS avg_salary
    FROM 
            job_postings_fact
    INNER JOIN  
            skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN 
            skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
            job_title_short = 'Data Analyst' AND
            job_work_from_home = 'True' AND
            salary_year_avg IS NOT NULL
    GROUP BY
            skills_job_dim.skill_id

)

    SELECT 
        skills_demand.skill_id,
        skills_demand.skills,
        demand_skill_count,
        avg_salary
    FROM
        skills_demand
    INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
    WHERE 
        demand_skill_count > '10'
    ORDER BY
        demand_skill_count DESC,
        avg_salary DESC
    LIMIT 25;


