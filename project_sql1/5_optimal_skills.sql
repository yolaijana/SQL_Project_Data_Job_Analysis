/*
Question: What are the most optimal skills to learn (aka it's in high demand and a high-paying skills) ?
- Identify skills in high demand and associated with high avarage salaries for Data Analyst roles.
- Concerntrates on remote positions with specified salaries.
Why? Targets skills that after job security (high demand) and financial benefits (high salaries).
- Offering stratigic insights for career development in Data Analysts.
*/

WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_location = 'London, UK' AND
        salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skill_id
), average_salary AS (
    SELECT
        skills_job_dim.skill_id,
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS salary_avg
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_location = 'London, UK' AND
        salary_year_avg IS NOT NULL
    GROUP BY
        skills_job_dim.skill_id 
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    average_salary
FROM
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count < 10
ORDER BY
    average_salary DESC,
    demand_count DESC
LIMIT
    25
