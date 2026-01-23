# 📊 Data Analyst Market Analysis

## 🚀 Introduction
This project explores the **Data Analyst** job market to identify 💰 top-paying roles, 🔥 in-demand skills, and 📈 where high demand meets high salary.

🔍 **SQL Queries:** [Explore Scripts Here](./project_sql/)

## 💡 Background
Born from a desire to pinpoint high-value skills and streamline the job search for optimal roles. Data is sourced from [Luke Barousse's SQL Course](https://lukebarousse.com/sql).

### **Key Questions:**
1. What are the top-paying jobs?
2. What skills do these jobs require?
3. Which skills are most in demand?
4. Which skills command higher salaries?
5. What are the **Optimal Skills** to learn?

## 🛠️ Tools
* **SQL & PostgreSQL:** For database querying and management.
* **VS Code:** For script execution.
* **Git & GitHub:** For version control.

## 📈 The Analysis

### 1. Top Paying Data Analyst Jobs
Focused on remote (**Anywhere**) roles with specified salaries.

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
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL

ORDER BY
    salary_year_avg DESC
LIMIT 10;



Salary Range: $184,000 to $650,000.

Companies: Meta, AT&T, and SmartAsset are top payers.

2. Skills for Top Paying Jobs
Reveals what high-compensation roles value most.


WITH top_paying_jobs AS (
    SELECT job_id, job_title, salary_year_avg, name AS company_name
    FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE job_title_short = 'Data Analyst' AND job_location = 'Anywhere' AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)
SELECT top_paying_jobs.*, skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC;

Top Skills: SQL (8), Python (7), and Tableau (6).
3. Most In-Demand SkillsSkillsDemand CountSQL7,291Excel4,611Python4,330Tableau3,745Power BI2,609
