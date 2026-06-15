/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills,
helping job seekers understand which skills to develop that align with top salaries
*/
WITH top_paying_jobs AS (
    SELECT 
        job_id,
        name,
        job_title,
        salary_year_avg
    FROM job_postings_fact
    Left JOIN company_dim ON job_postings_fact.company_id=company_dim.company_id
    WHERE 
        job_title_short = 'Data Analyst' 
        and salary_year_avg IS NOT NULL
        and job_country = 'India'
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)
SELECT 
    top_paying_jobs.job_id,
    top_paying_jobs.name,
    top_paying_jobs.job_title,
    top_paying_jobs.salary_year_avg,
    STRING_AGG(DISTINCT skills_dim.skills, ', ') AS skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON skills_job_dim.job_id=top_paying_jobs.job_id
INNER JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id
GROUP BY
    top_paying_jobs.job_id,
    top_paying_jobs.name,
    top_paying_jobs.job_title,
    top_paying_jobs.salary_year_avg
ORDER BY
    salary_year_avg DESC

/*
Here are some insights:

-SQL dominates the highest-paying roles, appearing in most job postings.
-Python is the second most demanded skill, highlighting the importance of programming.
-Power BI is a leading BI tool, showing strong demand for visualization skills.
-AWS and Azure are frequently required, reflecting the shift to cloud analytics.
-Spark and Databricks appear in many high-paying roles, linking Big Data skills to higher salaries.
-Oracle remains widely used, demonstrating the continued value of traditional database expertise.

[
  {
    "job_id": 283661,
    "name": "Srijan Technologies",
    "job_title": "Technical Data Architect - Healthcare",
    "salary_year_avg": "165000.0",
    "skills": "airflow, aws, databricks, flow, gitlab, jenkins, kafka, linux, nosql, oracle, pandas, power bi, pyspark, python, scala, shell, snowflake, spark, sql, unix"
  },
  {
    "job_id": 954793,
    "name": "Bosch Group",
    "job_title": "Data Architect 2023",
    "salary_year_avg": "165000.0",
    "skills": "aws, azure, hadoop, mongo, mongodb, mysql, oracle, postgresql, power bi, python, redshift, spark, sql, sql server"
  },
  {
    "job_id": 1041666,
    "name": "Bosch Group",
    "job_title": "Data Architect - Data Migration",
    "salary_year_avg": "165000.0",
    "skills": "oracle, sap"
  },
  {
    "job_id": 406320,
    "name": "Eagle Genomics Ltd",
    "job_title": "Data Architect",
    "salary_year_avg": "163782.0",
    "skills": "aws, azure, databricks, gdpr, go, hadoop, mongodb, neo4j, no-sql, oracle, power bi, python, scala, spark, sql"
  },
  {
    "job_id": 781346,
    "name": "Eagle Genomics Ltd",
    "job_title": "Data Architect",
    "salary_year_avg": "163782.0",
    "skills": "gdpr"
  },
  {
    "job_id": 325402,
    "name": "Deutsche Bank",
    "job_title": "Senior Business & Data Analyst",
    "salary_year_avg": "119250.0",
    "skills": "confluence, excel, jira, sql, visio"
  },
  {
    "job_id": 908967,
    "name": "ACA Group",
    "job_title": "Sr. Enterprise Data Analyst",
    "salary_year_avg": "118140.0",
    "skills": "azure, excel, flow, power bi, sql"
  },
  {
    "job_id": 601909,
    "name": "Bosch Group",
    "job_title": "Process and Data Analyst",
    "salary_year_avg": "111175.0",
    "skills": "python, sap, sql"
  },
  {
    "job_id": 1781493,
    "name": "Freshworks",
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "skills": "excel, power bi, powerpoint, tableau"
  }
]
*/
