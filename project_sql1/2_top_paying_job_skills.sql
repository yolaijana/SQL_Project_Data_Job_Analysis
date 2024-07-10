/*
Question: what are the top-paying data analyst jobs?
-Identify the top 10 higest-paying Data Analyst roles that are available remotly.
-Focuses od job postings eith specified salaries (remove nulls).
-Why? Highligt the top_paying opportunities for Data Analyst, offering insights into employment optimal skills
*/

With top_paying_jobs AS (

    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact jpf
        LEFT JOIN company_dim cd ON cd.company_id = jpf.company_id
    WHERE
        job_title_short ='Data Analyst' AND
        job_location = 'London, UK' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10

)

SELECT 
    tpj.*,
    sd.skills AS skills_name
FROM
    top_paying_jobs tpj
INNER JOIN skills_job_dim sjd ON tpj.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
ORDER BY
    salary_year_avg DESC

/*
Here's the break down of the most demanded skills for data analysts in 2023. based on job posting:
- SQL is leading with bold count of 8.
- Python follows closely with a bold count of 7.
- Tableau is also highly sought after, with a bold count of 6.
- Other skills like R, Snowflake, Pandas, and Excel show varying degrees of demand. 
*/

/*
[
  {
    "job_id": 159866,
    "job_title": "Research Engineer, Science",
    "salary_year_avg": "177283.0",
    "company_name": "DeepMind",
    "skills_name": "python"
  },
  {
    "job_id": 159866,
    "job_title": "Research Engineer, Science",
    "salary_year_avg": "177283.0",
    "company_name": "DeepMind",
    "skills_name": "c++"
  },
  {
    "job_id": 159866,
    "job_title": "Research Engineer, Science",
    "salary_year_avg": "177283.0",
    "company_name": "DeepMind",
    "skills_name": "pandas"
  },
  {
    "job_id": 159866,
    "job_title": "Research Engineer, Science",
    "salary_year_avg": "177283.0",
    "company_name": "DeepMind",
    "skills_name": "numpy"
  },
  {
    "job_id": 159866,
    "job_title": "Research Engineer, Science",
    "salary_year_avg": "177283.0",
    "company_name": "DeepMind",
    "skills_name": "tensorflow"
  },
  {
    "job_id": 159866,
    "job_title": "Research Engineer, Science",
    "salary_year_avg": "177283.0",
    "company_name": "DeepMind",
    "skills_name": "pytorch"
  },
  {
    "job_id": 478395,
    "job_title": "Data Architect",
    "salary_year_avg": "163782.0",
    "company_name": "Logispin",
    "skills_name": "nosql"
  },
  {
    "job_id": 478395,
    "job_title": "Data Architect",
    "salary_year_avg": "163782.0",
    "company_name": "Logispin",
    "skills_name": "azure"
  },
  {
    "job_id": 478395,
    "job_title": "Data Architect",
    "salary_year_avg": "163782.0",
    "company_name": "Logispin",
    "skills_name": "looker"
  },
  {
    "job_id": 217504,
    "job_title": "Analytics Engineer - ENA London, Warsaw- (F/M)",
    "salary_year_avg": "139216.0",
    "company_name": "AccorCorpo",
    "skills_name": "sql"
  },
  {
    "job_id": 217504,
    "job_title": "Analytics Engineer - ENA London, Warsaw- (F/M)",
    "salary_year_avg": "139216.0",
    "company_name": "AccorCorpo",
    "skills_name": "python"
  },
  {
    "job_id": 178006,
    "job_title": "Data Analyst - (Ratings Ops)",
    "salary_year_avg": "111175.0",
    "company_name": "Sylvera",
    "skills_name": "sql"
  },
  {
    "job_id": 178006,
    "job_title": "Data Analyst - (Ratings Ops)",
    "salary_year_avg": "111175.0",
    "company_name": "Sylvera",
    "skills_name": "python"
  },
  {
    "job_id": 178006,
    "job_title": "Data Analyst - (Ratings Ops)",
    "salary_year_avg": "111175.0",
    "company_name": "Sylvera",
    "skills_name": "javascript"
  },
  {
    "job_id": 178006,
    "job_title": "Data Analyst - (Ratings Ops)",
    "salary_year_avg": "111175.0",
    "company_name": "Sylvera",
    "skills_name": "vba"
  },
  {
    "job_id": 178006,
    "job_title": "Data Analyst - (Ratings Ops)",
    "salary_year_avg": "111175.0",
    "company_name": "Sylvera",
    "skills_name": "excel"
  },
  {
    "job_id": 178006,
    "job_title": "Data Analyst - (Ratings Ops)",
    "salary_year_avg": "111175.0",
    "company_name": "Sylvera",
    "skills_name": "tableau"
  },
  {
    "job_id": 178006,
    "job_title": "Data Analyst - (Ratings Ops)",
    "salary_year_avg": "111175.0",
    "company_name": "Sylvera",
    "skills_name": "looker"
  },
  {
    "job_id": 178006,
    "job_title": "Data Analyst - (Ratings Ops)",
    "salary_year_avg": "111175.0",
    "company_name": "Sylvera",
    "skills_name": "sheets"
  },
  {
    "job_id": 4851,
    "job_title": "Business Intelligence Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Ocorian",
    "skills_name": "excel"
  },
  {
    "job_id": 4851,
    "job_title": "Business Intelligence Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Ocorian",
    "skills_name": "tableau"
  },
  {
    "job_id": 4851,
    "job_title": "Business Intelligence Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Ocorian",
    "skills_name": "powerpoint"
  },
  {
    "job_id": 1751909,
    "job_title": "Data Analyst",
    "salary_year_avg": "105000.0",
    "company_name": "Informa Group Plc.",
    "skills_name": "go"
  },
  {
    "job_id": 1751909,
    "job_title": "Data Analyst",
    "salary_year_avg": "105000.0",
    "company_name": "Informa Group Plc.",
    "skills_name": "gdpr"
  },
  {
    "job_id": 1751909,
    "job_title": "Data Analyst",
    "salary_year_avg": "105000.0",
    "company_name": "Informa Group Plc.",
    "skills_name": "dax"
  },
  {
    "job_id": 522268,
    "job_title": "Data Analyst",
    "salary_year_avg": "102500.0",
    "company_name": "Verisk",
    "skills_name": "excel"
  },
  {
    "job_id": 1390876,
    "job_title": "Data Analyst",
    "salary_year_avg": "100500.0",
    "company_name": "The Telegraph",
    "skills_name": "sql"
  },
  {
    "job_id": 202872,
    "job_title": "Data Analyst",
    "salary_year_avg": "100500.0",
    "company_name": "NBCUniversal",
    "skills_name": "sql"
  },
  {
    "job_id": 202872,
    "job_title": "Data Analyst",
    "salary_year_avg": "100500.0",
    "company_name": "NBCUniversal",
    "skills_name": "excel"
  },
  {
    "job_id": 202872,
    "job_title": "Data Analyst",
    "salary_year_avg": "100500.0",
    "company_name": "NBCUniversal",
    "skills_name": "tableau"
  },
  {
    "job_id": 202872,
    "job_title": "Data Analyst",
    "salary_year_avg": "100500.0",
    "company_name": "NBCUniversal",
    "skills_name": "word"
  },
  {
    "job_id": 202872,
    "job_title": "Data Analyst",
    "salary_year_avg": "100500.0",
    "company_name": "NBCUniversal",
    "skills_name": "sharepoint"
  },
  {
    "job_id": 202872,
    "job_title": "Data Analyst",
    "salary_year_avg": "100500.0",
    "company_name": "NBCUniversal",
    "skills_name": "powerpoint"
  },
  {
    "job_id": 202872,
    "job_title": "Data Analyst",
    "salary_year_avg": "100500.0",
    "company_name": "NBCUniversal",
    "skills_name": "outlook"
  }
]
*/