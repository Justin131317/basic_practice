/* 
Problem: What skills are required for the top-paying data analyst jobs?
    -use the top 10 highest-paying data analyst jobs from first query
    -add the specific skills requried for these roles
    -why? This provides a detailed look at which high-paying jobs demand certain skills, 
        helping job seekers understand which skills to develop that aligns with top salaries 
*/

WITH top_paying_jobs AS(

    SELECT
        job_id,
        job_title,
        job_schedule_type,
        salary_year_avg,
        name as company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_title_short = 'Data Analyst' and 
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT
        10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim on top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
salary_year_avg DESC;

/* Skills Frequency Analysis
SQL and Python are the most demanded skills, highlighting their importance across various data analyst roles.
Tableau is also highly requested, making it essential for data visualization.
    -SQL - Mentioned 9 times
    -Python - Mentioned 8 times
    -Tableau - Mentioned 6 times



[
"job_id","job_title","job_schedule_type","salary_year_avg","company_name","skills"
552322,"Associate Director- Data Insights","Full-time","255829.5","AT&T","sql"
552322,"Associate Director- Data Insights","Full-time","255829.5","AT&T","python"
552322,"Associate Director- Data Insights","Full-time","255829.5","AT&T","r"
552322,"Associate Director- Data Insights","Full-time","255829.5","AT&T","azure"
552322,"Associate Director- Data Insights","Full-time","255829.5","AT&T","databricks"
552322,"Associate Director- Data Insights","Full-time","255829.5","AT&T","aws"
552322,"Associate Director- Data Insights","Full-time","255829.5","AT&T","pandas"
552322,"Associate Director- Data Insights","Full-time","255829.5","AT&T","pyspark"
552322,"Associate Director- Data Insights","Full-time","255829.5","AT&T","jupyter"
552322,"Associate Director- Data Insights","Full-time","255829.5","AT&T","excel"
552322,"Associate Director- Data Insights","Full-time","255829.5","AT&T","tableau"
552322,"Associate Director- Data Insights","Full-time","255829.5","AT&T","power bi"
552322,"Associate Director- Data Insights","Full-time","255829.5","AT&T","powerpoint"
99305,"Data Analyst, Marketing","Full-time","232423.0","Pinterest Job Advertisements","sql"
99305,"Data Analyst, Marketing","Full-time","232423.0","Pinterest Job Advertisements","python"
99305,"Data Analyst, Marketing","Full-time","232423.0","Pinterest Job Advertisements","r"
99305,"Data Analyst, Marketing","Full-time","232423.0","Pinterest Job Advertisements","hadoop"
99305,"Data Analyst, Marketing","Full-time","232423.0","Pinterest Job Advertisements","tableau"
1021647,"Data Analyst (Hybrid/Remote)","Full-time","217000.0","Uclahealthcareers","sql"
1021647,"Data Analyst (Hybrid/Remote)","Full-time","217000.0","Uclahealthcareers","crystal"
1021647,"Data Analyst (Hybrid/Remote)","Full-time","217000.0","Uclahealthcareers","oracle"
1021647,"Data Analyst (Hybrid/Remote)","Full-time","217000.0","Uclahealthcareers","tableau"
1021647,"Data Analyst (Hybrid/Remote)","Full-time","217000.0","Uclahealthcareers","flow"
168310,"Principal Data Analyst (Remote)","Full-time","205000.0","SmartAsset","sql"
168310,"Principal Data Analyst (Remote)","Full-time","205000.0","SmartAsset","python"
168310,"Principal Data Analyst (Remote)","Full-time","205000.0","SmartAsset","go"
168310,"Principal Data Analyst (Remote)","Full-time","205000.0","SmartAsset","snowflake"
168310,"Principal Data Analyst (Remote)","Full-time","205000.0","SmartAsset","pandas"
168310,"Principal Data Analyst (Remote)","Full-time","205000.0","SmartAsset","numpy"
168310,"Principal Data Analyst (Remote)","Full-time","205000.0","SmartAsset","excel"
168310,"Principal Data Analyst (Remote)","Full-time","205000.0","SmartAsset","tableau"
168310,"Principal Data Analyst (Remote)","Full-time","205000.0","SmartAsset","gitlab"
731368,"Director, Data Analyst - HYBRID","Full-time","189309.0","Inclusively","sql"
731368,"Director, Data Analyst - HYBRID","Full-time","189309.0","Inclusively","python"
731368,"Director, Data Analyst - HYBRID","Full-time","189309.0","Inclusively","azure"
731368,"Director, Data Analyst - HYBRID","Full-time","189309.0","Inclusively","aws"
731368,"Director, Data Analyst - HYBRID","Full-time","189309.0","Inclusively","oracle"
731368,"Director, Data Analyst - HYBRID","Full-time","189309.0","Inclusively","snowflake"
731368,"Director, Data Analyst - HYBRID","Full-time","189309.0","Inclusively","tableau"
731368,"Director, Data Analyst - HYBRID","Full-time","189309.0","Inclusively","power bi"
731368,"Director, Data Analyst - HYBRID","Full-time","189309.0","Inclusively","sap"
731368,"Director, Data Analyst - HYBRID","Full-time","189309.0","Inclusively","jenkins"
731368,"Director, Data Analyst - HYBRID","Full-time","189309.0","Inclusively","bitbucket"
731368,"Director, Data Analyst - HYBRID","Full-time","189309.0","Inclusively","atlassian"
731368,"Director, Data Analyst - HYBRID","Full-time","189309.0","Inclusively","jira"
731368,"Director, Data Analyst - HYBRID","Full-time","189309.0","Inclusively","confluence"
310660,"Principal Data Analyst, AV Performance Analysis","Full-time","189000.0","Motional","sql"
310660,"Principal Data Analyst, AV Performance Analysis","Full-time","189000.0","Motional","python"
310660,"Principal Data Analyst, AV Performance Analysis","Full-time","189000.0","Motional","r"
310660,"Principal Data Analyst, AV Performance Analysis","Full-time","189000.0","Motional","git"
310660,"Principal Data Analyst, AV Performance Analysis","Full-time","189000.0","Motional","bitbucket"
310660,"Principal Data Analyst, AV Performance Analysis","Full-time","189000.0","Motional","atlassian"
310660,"Principal Data Analyst, AV Performance Analysis","Full-time","189000.0","Motional","jira"
310660,"Principal Data Analyst, AV Performance Analysis","Full-time","189000.0","Motional","confluence"
1749593,"Principal Data Analyst","Full-time","186000.0","SmartAsset","sql"
1749593,"Principal Data Analyst","Full-time","186000.0","SmartAsset","python"
1749593,"Principal Data Analyst","Full-time","186000.0","SmartAsset","go"
1749593,"Principal Data Analyst","Full-time","186000.0","SmartAsset","snowflake"
1749593,"Principal Data Analyst","Full-time","186000.0","SmartAsset","pandas"
1749593,"Principal Data Analyst","Full-time","186000.0","SmartAsset","numpy"
1749593,"Principal Data Analyst","Full-time","186000.0","SmartAsset","excel"
1749593,"Principal Data Analyst","Full-time","186000.0","SmartAsset","tableau"
1749593,"Principal Data Analyst","Full-time","186000.0","SmartAsset","gitlab"
387860,"ERM Data Analyst","Full-time","184000.0","Get It Recruit - Information Technology","sql"
387860,"ERM Data Analyst","Full-time","184000.0","Get It Recruit - Information Technology","python"
387860,"ERM Data Analyst","Full-time","184000.0","Get It Recruit - Information Technology","r"
]
*/ 