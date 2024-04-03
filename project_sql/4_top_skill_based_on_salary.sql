/*Q&A 
What are the top skills based on salary?
--Look at the average salary associated with each skill for Data Analyst positions
--Focus on roles with specified salaries.
--Exclude NULL values.
-Remote jobs
--Why? it shows how different skill match salary level as a data analyst and helps 
identify the most finacially rewarding skills to acquire or improve.
*/

SELECT 
        skills,
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
        skills
ORDER BY
        avg_salary DESC
LIMIT 
        25;

/*
-Based on average salary for data analyst. The high demand and rewarding skill to acquire and
improve is Pyspark and couchbase. Followed my machine learning tools such as Datarobot and Python
libraries (Pandas and Numphy), thus encompassing high valuation of data processing and predictive
modeling capabilites.
-Next is software development and deployment proficiency like Gitlab, Kubernetes, and Airflow.
This is for data analysis and engineering with skills for automation and data pipleline.
-Followed by cloud computing. Engineering tools for cloud and data engineering like Elasticsearch and
DataBricks, GCP). With the in demand of cloud-base analytics environments, this skill
will be an additional boost in career advancement and upskill current skill set.

[
  {
    "skills": "pyspark",
    "avg_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189155"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "watson",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500"
  },
  {
    "skills": "swift",
    "avg_salary": "153750"
  },
  {
    "skills": "jupyter",
    "avg_salary": "152777"
  },
  {
    "skills": "pandas",
    "avg_salary": "151821"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "145000"
  },
  {
    "skills": "golang",
    "avg_salary": "145000"
  },
  {
    "skills": "numpy",
    "avg_salary": "143513"
  },
  {
    "skills": "databricks",
    "avg_salary": "141907"
  },
  {
    "skills": "linux",
    "avg_salary": "136508"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "132500"
  },
  {
    "skills": "atlassian",
    "avg_salary": "131162"
  },
  {
    "skills": "twilio",
    "avg_salary": "127000"
  },
  {
    "skills": "airflow",
    "avg_salary": "126103"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "125781"
  },
  {
    "skills": "jenkins",
    "avg_salary": "125436"
  },
  {
    "skills": "notion",
    "avg_salary": "125000"
  },
  {
    "skills": "scala",
    "avg_salary": "124903"
  },
  {
    "skills": "postgresql",
    "avg_salary": "123879"
  },
  {
    "skills": "gcp",
    "avg_salary": "122500"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "121619"
  }
]

*/    

