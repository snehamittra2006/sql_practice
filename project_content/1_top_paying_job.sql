/*
QUESTION : What are the top-paying data analyst jobs?
-Identify the top 10 highest-paying Data Analyst roles that are available in India.
-Focuses on job postings with specified salaries(remove nulls).
-Why? Highlight the top-paying opportunities for data analytsts, offering insights into employment in your domain
*/
SELECT 
    job_id,
    name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date::DATE
FROM job_postings_fact
Left JOIN company_dim ON job_postings_fact.company_id=company_dim.company_id
WHERE 
    job_title_short = 'Data Analyst' 
    and salary_year_avg IS NOT NULL
    and job_country = 'India'
ORDER BY
    salary_year_avg DESC
LIMIT 10

