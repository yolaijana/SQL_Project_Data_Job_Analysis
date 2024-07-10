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
    job_location = 'London, UK' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10

/*    JSON


[
  {
    "job_id": 159866,
    "job_title": "Research Engineer, Science",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "177283.0",
    "job_posted_date": "2023-06-28 21:00:41",
    "company_name": "DeepMind"
  },
  {
    "job_id": 478395,
    "job_title": "Data Architect",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-03-01 22:26:19",
    "company_name": "Logispin"
  },
  {
    "job_id": 585859,
    "job_title": "Research Scientist, Science",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "149653.0",
    "job_posted_date": "2023-06-29 19:18:22",
    "company_name": "DeepMind"
  },
  {
    "job_id": 217504,
    "job_title": "Analytics Engineer - ENA London, Warsaw- (F/M)",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "139216.0",
    "job_posted_date": "2023-04-21 10:38:48",
    "company_name": "AccorCorpo"
  },
  {
    "job_id": 178006,
    "job_title": "Data Analyst - (Ratings Ops)",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-05-17 01:21:58",
    "company_name": "Sylvera"
  },
  {
    "job_id": 4851,
    "job_title": "Business Intelligence Data Analyst",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-03-24 10:22:34",
    "company_name": "Ocorian"
  },
  {
    "job_id": 1751909,
    "job_title": "Data Analyst",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "105000.0",
    "job_posted_date": "2023-07-04 13:16:42",
    "company_name": "Informa Group Plc."
  },
  {
    "job_id": 522268,
    "job_title": "Data Analyst",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "102500.0",
    "job_posted_date": "2023-01-25 09:50:48",
    "company_name": "Verisk"
  },
  {
    "job_id": 1390876,
    "job_title": "Data Analyst",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "100500.0",
    "job_posted_date": "2023-08-17 18:17:54",
    "company_name": "The Telegraph"
  },
  {
    "job_id": 450176,
    "job_title": "Data Analyst- Gas & Power",
    "job_location": "London, UK",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "100500.0",
    "job_posted_date": "2023-07-14 20:16:23",
    "company_name": "Energy Aspects Ltd"
  }
]

*/