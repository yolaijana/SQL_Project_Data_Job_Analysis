/*
Question: what are the top-paying data analyst jobs?
-Identify the top 10 higest-paying Data Analyst roles that are available remotly.
-Focuses od job postings eith specified salaries (remove nulls).
-Why? Highligt the top_paying opportunities for Data Analyst, offering insights into employment optimal skills
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact jpf
    LEFT JOIN company_dim cd ON cd.company_id = jpf.company_id
WHERE
    job_title_short ='Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10