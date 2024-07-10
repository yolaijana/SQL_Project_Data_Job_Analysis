/*
Question: What are the most optimal skills to learn (aka it's in high demand and a high-paying skills) ?
- Identify skills in high demand and associated with high avarage salaries for Data Analyst roles.
- Concerntrates on remote positions with specified salaries.
Why? Targets skills that after job security (high demand) and financial benefits (high salaries).
- Offering stratigic insights for career development in Data Analysts.
*/


-- First way


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
    demand_count > 3
ORDER BY
    average_salary DESC,
    demand_count DESC




-- Second way for same result (Different in the salary average)

SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_location = 'London, UK'
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 3
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;


/*     Resuls in JSON foe the first way

[
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "5",
    "average_salary": "(185,97534)"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "4",
    "average_salary": "(182,93466)"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "8",
    "average_salary": "(181,89402)"
  },
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "4",
    "average_salary": "(8,89338)"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "7",
    "average_salary": "(1,110353)"
  },
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "8",
    "average_salary": "(0,92307)"
  }
]

*/