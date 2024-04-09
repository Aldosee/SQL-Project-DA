## 👋 Introduction

Hello!  This project aims to analyze factors such as industry demand, skill requirements, and job location for Data Analyst. 


## 📖 Background
Driven by a passion for continuous skill improvement and a desire to test  abilities in data analysis, this project aims to delve deep into the job market within the field. By leveraging cutting-edge analytical tools and methodologies, this seek not only to identify trends but also to enhance my own proficiency in data analysis. 

### 🤔💭 Questions for this analysis using SQL queries:

1. What are the top-paying data analyst jobs?
2. What skills required for top-paying jobs?
3. What skills needed for in-demand data analyst roles?
4. Which skills with high salaries?
5. What are the most optimal skills to learn?

## 🛠️ Tools
- SQL: For analysis and query database to answer the questions.
 - PostgreSQL: Database management system.
 - Visual Studio Code: Database managemnt and executing SQL queries.
 - Git & GitHub: SQL scripts and analysis. Project tracking of updates.
 - Canva: Visualization and to give a comprehensive insight of the data analysis.

 ## 🔎 Analysis


### 1. Top Paying Data Analyst Jobs

In this query, identify highest-paying data analyst job by filtering with the "WHERE" clause. Include remote positions and order them by salary to recognize the high paying salary. Then, return only the top 10 values using "LIMIT". 

```SELECT *
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

```
#### The result:
The top-paying data analyst jobs based on the provided dataset, include a Data Analyst position at Mantys with a average salary of $650,000 per year, followed by a Director of Analytics role at Meta with a average salary of $336,500 per year, and an Associate Director-Data Insights position at AT&T with a average salary of $255,829.5 per year.

![Top Paying DA roles](<assets/Top Paying Data.png>)


### 2. Skills required for Top Paying jobs
To identify the skills needed for top paying job in the market. I joined job postings tables, company table, and skill job table. The query showed the companies high salary with corresponding skills needed.

```
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
 ```
 #### The result:
The table summarizes data analyst job positions from multiple companies offering full-time schedules with remote work and salaries ranging from $184,000 to $255,829.5 annually and the common  skills required such as SQL, Python, R, Tableau, and Excel. AT&T the topped highest salary varying different skills for Data Analyst.



| Job Title                                    | Company Name                               | Schedule Type | Work from Home | Average Salary | Skills Required                       |
|----------------------------------------------|--------------------------------------------|---------------|----------------|----------------|----------------------------------------|
| Associate Director- Data Insights             | AT&T                                       | Full-time     | Yes            | $255,829.5     | SQL, Python, R, Azure, Databricks, AWS, Pandas, PySpark, Jupyter, Excel, Tableau, Power BI, PowerPoint |
| Data Analyst, Marketing                       | Pinterest Job Advertisements                | Full-time     | Yes            | $232,423.0     | SQL, Python, R, Hadoop, Tableau        |
| Data Analyst (Hybrid/Remote)                  | Uclahealthcareers                           | Full-time     | Yes            | $217,000.0     | SQL, Crystal, Oracle, Tableau, Flow    |
| Principal Data Analyst (Remote)               | SmartAsset                                  | Full-time     | Yes            | $205,000.0     | SQL, Python, Go, Snowflake, Pandas, NumPy, Excel, Tableau, GitLab |
| Director, Data Analyst - HYBRID               | Inclusively                                 | Full-time     | Yes            | $189,309.0     | SQL, Python, Azure, AWS, Oracle, Snowflake, Tableau, Power BI, SAP, Jenkins, Bitbucket, Atlassian, Jira, Confluence |
| Principal Data Analyst, AV Performance Analysis | Motional                                   | Full-time     | Yes            | $189,000.0     | SQL, Python, R, Git, Bitbucket, Atlassian, Jira, Confluence |
| Principal Data Analyst                        | SmartAsset                                  | Full-time     | Yes            | $186,000.0     | SQL, Python, Go, Snowflake, Pandas, NumPy, Excel, Tableau, GitLab |
| ERM Data Analyst                             | Get It Recruit - Information Technology      | Full-time     | Yes            | $184,000.0     | SQL, Python, R                          |



### 3. In demand skills for Data Analyst
To identify the skills in demand for the role as a Data Analyst. I joined the table job posting, skill job, and skill to arrive the top 5 skills in demand.
```
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
```

 #### The result:
The vizualisation showed the demand skills for Data Analyst with SQL being the most in-demand skill, followed by Excel, Python, Tableau, and Power BI. These findings indicate a strong reliance on database querying and management skills (SQL), data analysis and visualization capabilities (Excel, Python, Tableau), and business intelligence tools (Power BI) in various industries.


![In Demand Skill DA](<assets/In Demand Skill.png>)

### 4. Skills based on Salary
Average Salary associated with different skills showed what skills are highest paying.

```
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
```

 #### The result:
Programming & Frameworks:

- PySpark: Python-based framework for big data processing.
- Jupyter: Interactive computing environment for data analysis and visualization.
- Scala: Versatile programming language for general software development and data processing tasks.

Analysis & Visualization:

- Pandas: Python library for data manipulation and analysis.
- Databricks: Unified analytics platform for big data and machine learning.
- Scikit-learn: Simple and efficient tools for data mining and analysis.

Collaboration & Cloud:

- Bitbucket: Version control repository hosting service.
- Jenkins: Automation server for building, testing, and deploying software.
- GCP: Google Cloud Platform, a suite of cloud computing services offered by Google.

| Skill          | Average Salary |
|----------------|----------------|
| PySpark        | $208,172       |
| Bitbucket      | $189,155       |
| Couchbase      | $160,515       |
| Watson         | $160,515       |
| DataRobot      | $155,486       |
| GitLab         | $154,500       |
| Swift          | $153,750       |
| Jupyter        | $152,777       |
| Pandas         | $151,821       |
| Elasticsearch  | $145,000       |
| Golang         | $145,000       |
| NumPy          | $143,513       |
| Databricks     | $141,907       |
| Linux          | $136,508       |
| Kubernetes     | $132,500       |
| Atlassian      | $131,162       |
| Twilio         | $127,000       |
| Airflow        | $126,103       |
| Scikit-learn   | $125,781       |
| Jenkins        | $125,436       |
| Notion         | $125,000       |
| Scala          | $124,903       |
| PostgreSQL     | $123,879       |
| GCP            | $122,500       |
| Microstrategy  | $121,619       |


### 5. Optimal skill to learn 
From the demand skill and salary, this query aimed to identify what skills are high demand at the same time high salary. This will highlight what skills need to have or improve.

```
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
    INNER JOIN 
        average_salary ON skills_demand.skill_id = average_salary.skill_id
    WHERE 
        demand_skill_count > '10'
    ORDER BY
        demand_skill_count DESC,
        avg_salary DESC
    LIMIT 25;
```
 #### The result:
- #### High-Demand Programming Languages:
Python and R are high demand counts of 236 and 148. Average salaries of these are around $101,397 for Python and $100,499 for R. The proficiency of these languages is highly valued and widely used.

- #### Database:
Databases like Oracle, SQL Server, NoSQL with average salaries ranging from $97,786 to $104,534. These tools store, manage, and retrieve structured and unstructured data. These databases serve as repositories for various types of data, ranging from traditional relational data to semi-structured and unstructured data formats. 

- #### Cloud Tools:
Snowflake, Azure, AWS, and BigQuery are in demand with high average salary. These cloud platform and cloud tools are crucial for data analysts as they provide scalable infrastructure, storage, and computational resources, enabling efficient data processing, analysis, and collaboration. 

- #### Business Intelligence and Visualizaiton:
Tableau, Looker and PowerBI with a demand count of 230, 49, and 110 with a average salary around $99,288 to $103,795 These visualization tools can provide insights and add value to decision makers.


| Skill ID | Skills       | Demand Skill Count | Average Salary |
|----------|--------------|--------------------|----------------|
| 0        | sql          | 398                | $97,237        |
| 181      | excel        | 256                | $87,288        |
| 1        | python       | 236                | $101,397       |
| 182      | tableau      | 230                | $99,288        |
| 5        | r            | 148                | $100,499       |
| 183      | power bi     | 110                | $97,431        |
| 7        | sas          | 63                 | $98,902        |
| 186      | sas          | 63                 | $98,902        |
| 196      | powerpoint   | 58                 | $88,701        |
| 185      | looker       | 49                 | $103,795       |
| 188      | word         | 48                 | $82,576        |
| 80       | snowflake    | 37                 | $112,948       |
| 79       | oracle       | 37                 | $104,534       |
| 61       | sql server   | 35                 | $97,786        |
| 74       | azure        | 34                 | $111,225       |
| 76       | aws          | 32                 | $108,317       |
| 192      | sheets       | 32                 | $86,088        |
| 215      | flow         | 28                 | $97,200        |
| 8        | go           | 27                 | $115,320       |
| 199      | spss         | 24                 | $92,170        |
| 22       | vba          | 24                 | $88,783        |
| 97       | hadoop       | 22                 | $113,193       |
| 233      | jira         | 20                 | $104,918       |
| 9        | javascript   | 20                 | $97,587        |
| 195      | sharepoint   | 18                 | $81,634        |


 ## ⚡  Conclusion
### Insights

1. Top-paying data analyst jobs

    - Based on the query, the highest paying job is $650,000 
2. Skills required for top-paying jobs

    - For high-paying positions, the data indicates that SQL proficiency is a key requirement. However, it's essential to note that candidates are expected to possess advanced and proficient skills in SQL along with substantial experience in utilizing the language effectively.

3. skills needed for in-demand data analyst roles

    - SQL topped most demanded skill.

4. Skills with high salaries

    - Proficiency in statistical analysis and programming languages like Python and R. Highly skilled and niche expertise with proven track record. Data visualization skills using tools and familiarity with machine learning and big data technologies is important. 

5. Most optimal skills to learn

    - SQL leads in demand and offers high average salary which is considered as the most optimal skill for data analyst. However,  learning more programming language and tools will be an edge for your career development. 

 ## ✅  Takeaways
This project has upskill my foundation in SQL and uncover tools that will help my journey as a data analyst. 

-   SQL Queries: Understand the use of Common Table Expression and utilize its importance for complex data queries.
-   Aggregate Function: A powerful tool for query and allow me to perform calculation and analysis.
- SQL JOINS: Another powerful to combine data or rows from two or more tables based on a common field. For me this is also a good combo for CTE.
- Analysis: Answer the questions by using proper syntax and arrive to the desired query. With the query, it unravel a big picture to make informed decisions and actionable insights.

📍 I am still a novice and trying my best to grasp the knowledge in becoming a data analyst. I continue to grow by learning tools and venture more in this field. Thank you for taking the time to read my work and I would like to dedicate this to Mr. Luke for his expertise. I really learned a lot from him. 

💻 You can check him here: https://www.youtube.com/@LukeBarousse
