/*
Answer: What are the most optimal skills to learn (aka it's in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
  offering strategic insights for career development in data analysis
*/




with jobs_demand as (
    

select 
        skills_dim.skill_id,
        skills_dim.skills,
        count(skills_dim.skills) as demand_count
from job_postings_fact
        inner JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        inner JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
        where job_title_short = 'Data Analyst' 
        and salary_year_avg is not null
        and job_work_from_home = true 
      group by skills_dim.skill_id
 ), average_salaries as 
(
    
    select 
    skills_dim.skill_id,
        skills_dim.skills,
        round(avg(salary_year_avg),0) as avg_salary
from job_postings_fact
        inner JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        inner JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

        where 
              job_title_short = 'Data Analyst' 
              and salary_year_avg is not null
             and job_work_from_home = true 
        group by skills_dim.skill_id
    )



    select 
    jobs_demand.skill_id,
    jobs_demand.skills,
    demand_count,
    avg_salary
from jobs_demand
inner join average_salaries
on jobs_demand.skill_id = average_salaries.skill_id
where jobs_demand.demand_count >= 10
ORDER BY demand_count DESC 
, avg_salary DESC
LIMIT 25;