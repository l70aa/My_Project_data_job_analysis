/*
Question what are the most demand skills for data analysis
- Join job positions to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
-focsing on all job postings .
- why ? Retrieves the top 5 skills with the highest demand in the job market.
- providing insights into the most valuable skills for job seekers

*/



select 
        skills,
        count(skills) as demand_count
from job_postings_fact
        inner JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        inner JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
        where job_title_short = 'Data Analyst' and job_work_from_home = true 
      

group by skills
order by demand_count desc
limit 6 