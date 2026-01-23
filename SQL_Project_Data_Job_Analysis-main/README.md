📊 Data Analyst Market Analysis🚀 IntroductionThis project explores the Data Analyst job market to identify 💰 top-paying roles, 🔥 in-demand skills, and 📈 where high demand meets high salary.🔍 SQL Queries: Explore Scripts Here💡 BackgroundBorn from a desire to pinpoint high-value skills and streamline the job search for optimal roles. Data is sourced from Luke Barousse's SQL Course.Key Questions:What are the top-paying jobs?What skills do these jobs require?Which skills are most in demand?Which skills command higher salaries?What are the Optimal Skills to learn?🛠️ ToolsSQL & PostgreSQL: For database querying and management.VS Code: For script execution.Git & GitHub: For version control.📈 The Analysis1. Top Paying Data Analyst JobsFocused on remote (Anywhere) roles with specified salaries.SQLSELECT	
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
Salary Range: $184,000 to $650,000.Companies: Meta, AT&T, and SmartAsset are top payers.2. Skills for Top Paying JobsReveals what high-compensation roles value most.SQLWITH top_paying_jobs AS (
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
Top Skills: SQL (8), Python (7), and Tableau (6).3. Most In-Demand SkillsSkillsDemand CountSQL7,291Excel4,611Python4,330Tableau3,745Power BI2,6094. Top Paying Skills (Average Salary)SkillsAvg. Salary ($)PySpark208,172Bitbucket189,155Pandas151,821Databricks141,9075. Optimal Skills (High Demand + High Pay)SQLSELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL AND job_work_from_home = True 
GROUP BY skills_dim.skill_id
HAVING COUNT(skills_job_dim.job_id) > 10
ORDER BY avg_salary DESC, demand_count DESC
LIMIT 10;
🧠 What I LearnedComplex SQL: Mastered CTEs and advanced Joins.Data Strategy: Learned to align technical skills with market value.🏆 ConclusionsSQL is King: Essential for both job security and high pay.Specialization Pays: Niche skills like PySpark and Cloud Tools command the highest premiums.
