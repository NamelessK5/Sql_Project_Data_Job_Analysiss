




/*

Question: what skills are required for the top-paying data analyst jobs? 

- Use the top 10 highest-paying Data Analyst job from the first query
- Add the specific skills required for there roles
- Purpose: It provides a detailed look at which high-payinh jobs deman certain skills,
   helping job seekers understand which skills to develop that align with top salaries




*/

WITH top_paying_jobs AS (

SELECT 

   job_id, 
   job_title, 
   salary_year_avg, 
   name AS company_name
FROM 

  job_postings_fact

  LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
  
  WHERE job_title_short = 'Data Analyst' AND 
  job_location = 'Anywhere' AND  salary_year_avg IS NOT NULL
  
  ORDER BY salary_year_avg DESC LIMIT 10

)

SELECT  
top_paying_jobs.*,
skills                     -- this will display the same columns selected in top_paying_jobs
FROM top_paying_jobs

INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id   
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

ORDER BY  salary_year_avg DESC







/*


Data Analyst Skills – Frequency Breakdown
Based on the 8 job postings:


Skill	  Frequency  	Percentage
  SQL	   8	           100%

Python	   7         	   87.5%

Tableau    6	           75%

R	       4	           50%

Excel	   3	           37.5%

Pandas	   3	           37.5%

Snowflake  3	           37.5%

Azure	   2	           25%

Power BI   2               25%

Go	       2	           25%

Key takeaway: SQL, Python, and Tableau are the three most frequently requested skills. SQL appears in every posting, making it the most consistently requested skill in this dataset.


*/