/* 
Problem: what are the most in-demand skills for data analysts?
    -Join job postings to inner join table similar to query #2
    -Identify the top 5 indemand skills for a data analyst
    -fucus on all job postings
    -why? retrieves the top 5 skills wiht the highest demand in the job market,
        providing insights into the most valuable skills for job seekers.
*/ 
WITH remote_job_skills as (
SELECT
    skill_id,
    count(*) as skill_count
FROM
    skills_job_dim as skills_to_job
INNER join job_postings_fact as job_postings on job_postings.job_id = skills_to_job.job_id
WHERE 
    job_postings.job_work_from_home = true and 
    job_postings.job_title_short = 'Data Analyst'
GROUP BY
    skill_id
)

select 
    skills.skill_id,
    skills as skill_name,
    skill_count
from remote_job_skills
INNER join skills_dim as skills on skills.skill_id = remote_job_skills.skill_id
ORDER BY
    skill_count desc
limit 5;