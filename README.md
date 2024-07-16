# Introduction
Dive into the data job market! foucing on Data Analyst roles, this project explores top_paying jobs, in-demand skills, and where high demand meet high salary in Data Analytics.
SQL queries? Check them out here [project_sql folder](/project_sql1/).

# Background
Driven by a quest to navigate the data analyst job market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, streamlining others work to find optimal jobs.

Data hails from my **SQL Course**. It's packed with insights on job titles, salaries, locations, and essential skills.

The questions I wanted to answer through my SQL queries were:
What are the top-paying data analyst jobs?
What skills are required for these top-paying jobs?
What skills are most in demand for data analysts?
Which skills are associated with higher salaries?
What are the most optimal skills to learn?

# Tools I Used
For my deep dive into the data analyst job market, I harnessed the power of several key tools:

**SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.
PostgreSQL: The chosen database management system, ideal for handling the job posting data.

**Visual Studio Code:** My go-to for database management and executing SQL queries.

**Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

**Excel:** I used Excel as visualization tool to create charts showcase the results in more understandable way.

# The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market. Here’s how I approached each question:

### 1. Top Paying Data Analyst Jobs
To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.

```sql
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
```
![Top Paying Roles](assets\top_paying_roles.png)
![Top Paying Roles](assets\top_paying_roles.gif)

Here are some key conclusions about the top data analyst jobs in London:

**Wide Salary Range:** Salaries range from £100,500 to £177,283 per year.

**Diverse Employers:** Companies like DeepMind, Logispin, and AccorCorpo are offering high salaries.

**Varied Job Titles**: Roles include "Research Engineer," "Data Architect," and "Analytics Engineer."

**London Focus:** All positions are based in London, UK.

**Full-time Roles:** All positions are full-time.

**Recent Postings:** Job postings are from January to August 2023.

### 2. Skills for Top Paying Jobs
To understand what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high-compensation roles.

```sql
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
```

![Top Paying Job Skills](assets\top_paying_job_skills.png) 
![Top Paying Job Skills](assets\top_paying_job_skills.gif) 
    
Here's the breakdown of the most demanded skills for the top 10 highest paying data analyst jobs in London:


**Python Dominates:** Python is a highly sought-after skill, appearing in multiple top-paying job listings.

**Technical Skills Pay Well:** Skills like C++, Pandas, Numpy, TensorFlow, and PyTorch are associated with higher salaries.
**Database and Cloud Expertise:** NoSQL, SQL, and Azure are critical for high-paying data roles.

**Data Visualization Tools:** Proficiency in Tableau and Looker is valuable and well-compensated.
Broad Skill Set: Diverse skills, including Excel, VBA, and GDPR, are important across different job roles and companies.

### 3. In-Demand Skills for Data Analysts
This query helped identify the skills most frequently requested in job postings, directing focus to areas with high demand.

```sql
SELECT
    skills,
    COUNT(sjd.job_id) AS demand_count
FROM
    job_postings_fact jpf
INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_location = 'London, UK'
GROUP BY
    skills 
ORDER BY
    demand_count DESC
LIMIT 5
```

Here's the breakdown of the most demanded skills for data analysts in London

**SQL** and **Python** are fundamental, emphasizing the need for strong foundational skills in database management and programming.

**Excel** and Visualization Tools like **Tableau** and **Power BI** are essential, highlighting the importance of spreadsheet manipulation and data visualization skills in data analysis roles.

|Skills	  |Demand Count |
|---------|-------------|
|SQL	  |182          |
|Python	  |152          |
|Excel	  |98           |
|Tableau  |72           |
|Power BI |67           |

![Top Demand Skills](assets\top_demanded_skills.png) 
![Top Demand Skills](assets\top_demanded_skills.gif) 

Table of the demand for the top 5 skills in data analyst job postings




### 4. Skills Based on Salary
Exploring the average salaries associated with different skills revealed which skills are the highest paying.

```sql
SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 10;
```

Here's a breakdown of the results for top paying skills for Data Analysts:

High Demand for Data Science Libraries & Big Data Skills: Top salaries are commanded by analysts skilled in **Python** libraries **(Pandas, NumPy, PyTorch, TensorFlow)** and big data technologies (NoSQL, Azure), reflecting the industry's high valuation of data processing, machine learning, and cloud computing capabilities.

Software Development & Programming Proficiency: Knowledge in programming languages and development tools **(C++, JavaScript, Python)** indicates a lucrative crossover between data analysis and software development, with a premium on skills that enhance data manipulation and application development.


|Skills	       |Average Salary ($)|
|--------------|------------------|
|pandas	       |177,283           |
|tensorflow	   |177,283           |
|c++	       |177,283           |
|pytorch	   |177,283           |
|numpy	       |177,283           |
|nosql	       |163,782           |
|javascript	   |111,175           |
|python	       |110,353           |
|powerpoint	   |105,838           |
|azure	       |105,211           |

Table of the average salary for the top 10 paying skills for data analysts


### 5. Most Optimal Skills to Learn
Combining insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and have high salaries, offering a strategic focus for skill development.

```sql

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
```

|skill_id |skills	  |demand_count| average_salary|
|---------|-----------|------------|---------------|
|185	  |looker	  |5	       |18,597,534     |
|182	  |tableau	  |4	       |18,293,466     |
|181	  |excel	  |8	       |18,189,402     |
|8	      |go	      |4	       |889,338        |
|1	      |python	  |7	       |1,110,353      |
|0  	  |sql	      |8	       |0,92307        |

Table of the most optimal skills for data analyst sorted by salary

Here's a concise breakdown of the top skills for Data Analysts in London:

**Python and R:** Highly demanded for data analysis, Python (demand count: 236, avg. salary: $110,353) and R (demand count: 148, avg. salary: $100,499) are crucial for statistical computing and data manipulation.

**Cloud Platforms:** Skills in Snowflake, Azure, AWS, and BigQuery are in high demand, reflecting the shift towards cloud-based data solutions. They offer competitive salaries, highlighting their importance in modern data analytics.

**Business Intelligence Tools:** Tableau (demand count: 230, avg. salary: $99,288) and Looker (demand count: 49, avg. salary: $103,795) are essential for data visualization and deriving actionable insights, with Looker commanding a higher average salary.

**Database Technologies:** Expertise in Oracle, SQL Server, and NoSQL databases remains critical, with salaries ranging from $97,786 to $104,534. These skills are vital for effective data storage and management.

These insights highlight the diverse skill set required for data analysts in 2023, emphasizing proficiency in programming languages, cloud technologies, business intelligence tools, and database management systems.

# What I Learned
Throughout this adventure, I've turbocharged my SQL toolkit with some serious firepower:

🧩 Complex Query Crafting: Mastered the art of advanced SQL, merging tables like a pro and wielding WITH clauses for ninja-level temp table maneuvers.
📊 Data Aggregation: Got cozy with GROUP BY and turned aggregate functions like COUNT() and AVG() into my data-summarizing sidekicks.
💡 Analytical Wizardry: Leveled up my real-world puzzle-solving skills, turning questions into actionable, insightful SQL queries.
# Conclusions

## Insights
Key Insights from the London Data Analyst Job Market:

Salary Range Diversity: London offers a range of salaries for data analysts, with the highest at $177,283!

Essential Skills for Top Salaries: Proficiency in SQL emerges as crucial for securing high-paying data analyst roles in London.

**High Demand for SQL:** SQL stands out as the most sought-after skill among London data analyst job postings, underscoring its importance in job readiness.

**Specialized Skills Command Premium Salaries:** Niche skills like Looker and Python correlate with the highest average salaries, highlighting the value of specialized expertise.

**Strategic Skills for Market Value:** SQL not only leads in demand but also offers substantial average salaries, positioning it as a strategic skill for maximizing market value in London's data analyst sector.

## Closing Reflections
This project has enriched my understanding of London's data analyst job landscape, emphasizing the significance of skill development tailored to market demands. By focusing on high-demand skills and adapting to evolving industry trends, aspiring data analysts can enhance their competitive edge and navigate a dynamic job market effectively.
