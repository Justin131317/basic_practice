select '2023-02-19'::date,
    '123'::integer,
    'true'::boolean,
    '3.14'::real;

SELECT  
    job_title_short as title,
    job_location as locaction,
    job_posted_date at time zone 'utc' at time zone 'est' as date_time,
    EXTRACT(MONTH from job_posted_date) as date_month,
    EXTRACT(year from job_posted_date) as date_year
FROM
    job_postings_fact
limit 5;

SELECT
   count(job_id) as job_posted_count,
   EXTRACT(MONTH from job_posted_date) as month
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    month 
ORDER BY
    job_posted_count DESC;


