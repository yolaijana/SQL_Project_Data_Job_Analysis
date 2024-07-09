/*
 Question: what are the top paying skills based on salary ?
- Look at the average salary associated with each skill for Data Analyst positions.
- Focuses on roles with specified salaries, regard the location is New York.
- Why? it reveals how different skills impact salary levels for Data Analysts and 
helps idenify the most financially rewarding skills to acquire or improve.
*/

SELECT
    skills,
    ROUND(AVG(jpf.salary_year_avg), 0) AS salary_avg
FROM
    job_postings_fact jpf
INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_location = 'London, UK' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills 
ORDER BY
    salary_avg DESC
LIMIT 25


/*
Here are the top paying skills for data analysts in London, formatted as a list:

- pandas, TensorFlow, PyTorch, numpy, and C++ skills command top salaries of £177,283, 
Highlighting their importance in data science and advanced programming.
- NoSQL expertise earns an average salary of £163,782, 
Reflecting the need for managing unstructured data.
- Azure skills are valued at £105,211, indicating the necessity of cloud computing knowledge.
- Python (£110,353) and JavaScript (£111,175) are highly paid, 
Showcasing their versatility in data analysis and application development.
- Power BI, Tableau, and Looker are in demand for data visualization, 
With salaries ranging from £84,975 to £97,534.
- Traditional business tools like Excel (£89,402) 
And PowerPoint (£105,838) remain essential.
- GDPR, DAX, and Snowflake skills are also in demand, 
Reflecting the importance of regulatory compliance, 
Data modeling, and modern data warehousing solutions.
- Matlab and SQL offer solid salaries, indicating the value of these tools in analytical tasks.
- Skills in SharePoint, Outlook, Word, and Sheets show the continued importance of office tools in data roles.
- Go programming language skills are valued at £89,338, 
Indicating demand for modern programming languages in data roles.

[
  {
    "skills": "pandas",
    "salary_avg": "177283"
  },
  {
    "skills": "tensorflow",
    "salary_avg": "177283"
  },
  {
    "skills": "c++",
    "salary_avg": "177283"
  },
  {
    "skills": "pytorch",
    "salary_avg": "177283"
  },
  {
    "skills": "numpy",
    "salary_avg": "177283"
  },
  {
    "skills": "nosql",
    "salary_avg": "163782"
  },
  {
    "skills": "javascript",
    "salary_avg": "111175"
  },
  {
    "skills": "python",
    "salary_avg": "110353"
  },
  {
    "skills": "powerpoint",
    "salary_avg": "105838"
  },
  {
    "skills": "azure",
    "salary_avg": "105211"
  },
  {
    "skills": "dax",
    "salary_avg": "105000"
  },
  {
    "skills": "gdpr",
    "salary_avg": "105000"
  },
  {
    "skills": "sharepoint",
    "salary_avg": "100500"
  },
  {
    "skills": "outlook",
    "salary_avg": "100500"
  },
  {
    "skills": "matlab",
    "salary_avg": "98500"
  },
  {
    "skills": "looker",
    "salary_avg": "97534"
  },
  {
    "skills": "sheets",
    "salary_avg": "96013"
  },
  {
    "skills": "tableau",
    "salary_avg": "93466"
  },
  {
    "skills": "sql",
    "salary_avg": "92307"
  },
  {
    "skills": "excel",
    "salary_avg": "89402"
  },
  {
    "skills": "go",
    "salary_avg": "89338"
  },
  {
    "skills": "word",
    "salary_avg": "85750"
  },
  {
    "skills": "power bi",
    "salary_avg": "84975"
  },
  {
    "skills": "vba",
    "salary_avg": "84338"
  },
  {
    "skills": "snowflake",
    "salary_avg": "80850"
  }
]

*/