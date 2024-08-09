SELECT
    job_title_short,
    company_id,
    job_location
FROM
    jan_jobs

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    feb_jobs

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs;


SELECT 
    quarter1_job_postings.job_title_short,
    quarter1_job_postings.job_location,
    quarter1_job_postings.job_via,
    quarter1_job_postings.job_posted_date::date
    FROM (
    SELECT *
    FROM jan_jobs
    UNION ALL
    SELECT *
    FROM feb_jobs
    UNION ALL
    SELECT *
    FROM march_jobs
) as quarter1_job_postings
WHERE 
    quarter1_job_postings.salary_year_avg > 70000 AND
    quarter1_job_postings.job_title_short = 'Data Analyst'
ORDER BY
    salary_hour_avg DESC;