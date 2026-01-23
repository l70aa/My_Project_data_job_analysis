--Question: What are the top-paying Data Analyst jobs?
-- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
-- Focus on job postings with specified salaries (remove nulls).
-- Why? To highlight the top paying opportunities for Data Analysts






select 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date ,
    name as company_name
from 
    job_postings_fact
    INNER JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
where job_title_short = 'Data Analyst'
    and job_location = 'Anywhere'
    and salary_year_avg is not null
order by 
    salary_year_avg desc
;
