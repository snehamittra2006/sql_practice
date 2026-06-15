/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market,
providing insights into the most valuable skills for job seekers.
*/

SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id=job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id
WHERE
    job_title_short='Data Analyst'
    AND job_country='India'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5

/*
**The most in-demand skills for Data Analysts in India reveal a strong focus on both technical and business intelligence capabilities.**

* **SQL leads by a wide margin**, making it the most essential skill for Data Analyst roles.
* **Python and Excel remain core requirements**, combining technical analysis with business reporting.
* **Tableau and Power BI rank among the top skills**, highlighting the importance of data visualization.
* **Demand spans the full analytics workflow**—from data extraction (SQL) to analysis (Python) and reporting (BI tools).
* **SQL + Python + a BI tool** forms the most valuable skill combination for aspiring Data Analysts in India.

[
  {
    "skills": "sql",
    "demand_count": "3167"
  },
  {
    "skills": "python",
    "demand_count": "2207"
  },
  {
    "skills": "excel",
    "demand_count": "2118"
  },
  {
    "skills": "tableau",
    "demand_count": "1673"
  },
  {
    "skills": "power bi",
    "demand_count": "1285"
  }
]
*/