/*
Question: what are the most in-demand skills for data analysts ?
- Join job postings to inner jointable similer to query 2.
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrievers the top 5 skills with the highest demand in the job market.
- Providing insights into the most valuable skills for job seekers.
*/


SELECT
    skills,
    COUNT(sjd.job_id) AS demand_count
FROM
    job_postings_fact jpf
INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_location = 'New York, NY'
GROUP BY
    skills 
ORDER BY
    demand_count DESC
LIMIT 5