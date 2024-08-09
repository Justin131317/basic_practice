SELECT 
    count(job_id) as number_of_jobs,
    CASE
        WHEN job_location ='Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        else 'Onsite'
    END AS location_category
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location_category;

SELECT
    job_title_short,
    CASE
        WHEN salary_hour_avg BETWEEN 0 AND 60000 then 'Low'
        WHEN salary_hour_avg BETWEEN 60001 and 100000 then 'standard'
        ELSE 'high'
END AS Salary_Bucket
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
order BY
    salary_hour_avg DESC;
