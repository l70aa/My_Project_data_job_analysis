/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
  helps identify the most financially rewarding skills to acquire or improve
*/



select 
        skills,
        round(avg(salary_year_avg),0) as avg_salary
from job_postings_fact
        inner JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        inner JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

        where 
              job_title_short = 'Data Analyst' 
              and salary_year_avg is not null
             and job_work_from_home = true 
        
group by skills
order by avg_salary desc
limit 25     