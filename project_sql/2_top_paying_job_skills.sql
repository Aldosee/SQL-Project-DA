--PROJECT 2
--Why the salary is so high, probably because of the in demand skill requisite?
--Top paying job skill.
--What are the skills required for these top-paying roles.

WITH top_10_job AS (
    SELECT 
        job_postings_fact.job_id,
        job_title,
        name AS company_names,
        job_schedule_type,
        job_work_from_home,
        salary_year_avg
    FROM
        job_postings_fact
    LEFT JOIN
        company_dim ON job_postings_fact.company_id=company_dim.company_id 
    WHERE
        salary_year_avg IS NOT NULL AND
        job_work_from_home = 'TRUE' AND
        job_title_short LIKE 'Data Analyst'
    ORDER BY 
        salary_year_avg DESC
    LIMIT 10
)

    SELECT  
        top_10_job.*,
        skills
    FROM 
        top_10_job
    INNER JOIN 
        skills_job_dim ON top_10_job.job_id = skills_job_dim.job_id
    INNER JOIN 
        skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    ORDER BY
        salary_year_avg DESC;

/*The result of this query showed a breakdown of the most demand skill for data analyst in 2023, based on the job posting: (Use MS excel to PIVOT the analysis)
Being at top is SQL with a count of 8
Followed by Pyhton with a count of 7
Next is Tableau with a count of 6
Then followed by other skills such as R, Snowflake, Pandas, and Excel. 

[
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_names": "AT&T",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "255829.5",
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_names": "AT&T",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "255829.5",
    "skills": "python"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_names": "AT&T",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "255829.5",
    "skills": "r"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_names": "AT&T",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "255829.5",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_names": "AT&T",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "255829.5",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_names": "AT&T",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "255829.5",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_names": "AT&T",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "255829.5",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_names": "AT&T",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "255829.5",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_names": "AT&T",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "255829.5",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_names": "AT&T",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "255829.5",
    "skills": "excel"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_names": "AT&T",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "255829.5",
    "skills": "tableau"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_names": "AT&T",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "255829.5",
    "skills": "power bi"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_names": "AT&T",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "255829.5",
    "skills": "powerpoint"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_names": "Pinterest Job Advertisements",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "232423.0",
    "skills": "sql"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_names": "Pinterest Job Advertisements",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "232423.0",
    "skills": "python"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_names": "Pinterest Job Advertisements",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "232423.0",
    "skills": "r"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_names": "Pinterest Job Advertisements",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "232423.0",
    "skills": "hadoop"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_names": "Pinterest Job Advertisements",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "232423.0",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_names": "Uclahealthcareers",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "217000.0",
    "skills": "sql"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_names": "Uclahealthcareers",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "217000.0",
    "skills": "crystal"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_names": "Uclahealthcareers",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "217000.0",
    "skills": "oracle"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_names": "Uclahealthcareers",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "217000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_names": "Uclahealthcareers",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "217000.0",
    "skills": "flow"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_names": "SmartAsset",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "205000.0",
    "skills": "sql"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_names": "SmartAsset",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "205000.0",
    "skills": "python"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_names": "SmartAsset",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "205000.0",
    "skills": "go"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_names": "SmartAsset",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "205000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_names": "SmartAsset",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "205000.0",
    "skills": "pandas"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_names": "SmartAsset",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "205000.0",
    "skills": "numpy"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_names": "SmartAsset",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "205000.0",
    "skills": "excel"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_names": "SmartAsset",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "205000.0",
    "skills": "tableau"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_names": "SmartAsset",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "205000.0",
    "skills": "gitlab"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_names": "Inclusively",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "189309.0",
    "skills": "sql"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_names": "Inclusively",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "189309.0",
    "skills": "python"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_names": "Inclusively",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "189309.0",
    "skills": "azure"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_names": "Inclusively",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "189309.0",
    "skills": "aws"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_names": "Inclusively",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "189309.0",
    "skills": "oracle"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_names": "Inclusively",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "189309.0",
    "skills": "snowflake"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_names": "Inclusively",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "189309.0",
    "skills": "tableau"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_names": "Inclusively",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "189309.0",
    "skills": "power bi"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_names": "Inclusively",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "189309.0",
    "skills": "sap"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_names": "Inclusively",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "189309.0",
    "skills": "jenkins"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_names": "Inclusively",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "189309.0",
    "skills": "bitbucket"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_names": "Inclusively",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "189309.0",
    "skills": "atlassian"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_names": "Inclusively",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "189309.0",
    "skills": "jira"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_names": "Inclusively",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "189309.0",
    "skills": "confluence"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_names": "Motional",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "189000.0",
    "skills": "sql"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_names": "Motional",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "189000.0",
    "skills": "python"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_names": "Motional",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "189000.0",
    "skills": "r"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_names": "Motional",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "189000.0",
    "skills": "git"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_names": "Motional",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "189000.0",
    "skills": "bitbucket"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_names": "Motional",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "189000.0",
    "skills": "atlassian"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_names": "Motional",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "189000.0",
    "skills": "jira"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_names": "Motional",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "189000.0",
    "skills": "confluence"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_names": "SmartAsset",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "186000.0",
    "skills": "sql"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_names": "SmartAsset",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "186000.0",
    "skills": "python"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_names": "SmartAsset",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "186000.0",
    "skills": "go"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_names": "SmartAsset",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "186000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_names": "SmartAsset",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "186000.0",
    "skills": "pandas"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_names": "SmartAsset",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "186000.0",
    "skills": "numpy"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_names": "SmartAsset",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "186000.0",
    "skills": "excel"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_names": "SmartAsset",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "186000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_names": "SmartAsset",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "186000.0",
    "skills": "gitlab"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "company_names": "Get It Recruit - Information Technology",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "184000.0",
    "skills": "sql"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "company_names": "Get It Recruit - Information Technology",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "184000.0",
    "skills": "python"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "company_names": "Get It Recruit - Information Technology",
    "job_schedule_type": "Full-time",
    "job_work_from_home": true,
    "salary_year_avg": "184000.0",
    "skills": "r"
  }
]

*/