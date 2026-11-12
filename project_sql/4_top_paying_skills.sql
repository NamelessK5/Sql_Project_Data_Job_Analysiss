/*  

Questions: What are the top skills based on salary?

- Look at the average salary associated with each skills for Data Analyst posistions

- focuses on roles with specified salries, regardless of location

 - Purpose: it reveals how different skills impact salary levels for Data Analyst and helps identify the most financially rewarding skills to acquire or improve

 */



SELECT 

    skills , 
     ROUND ( AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact

INNER JOIN skills_job_dim ON  job_postings_fact.job_id = skills_job_dim.job_id   
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE  
job_title_short = 'Data Analyst' 
AND salary_year_avg IS NOT NULL

 AND job_work_from_home= True
  GROUP BY
  
   skills
ORDER BY

 avg_salary DESC

LIMIT 25;





/*

- Big Data & Distributed Computing: PySpark ($208K) leads the list, suggesting strong demand for processing and analyzing large-scale datasets.
- Cloud & Infrastructure: Databricks, GCP, Kubernetes, and Linux indicate that high-paying roles increasingly value cloud computing and scalable data environments.
- Programming & Data Science: Python libraries (Pandas, NumPy, Scikit-learn), Scala, and Go highlight the importance of programming, statistical analysis, and machine learning.
- Data Engineering: Airflow, PostgreSQL, Couchbase, and Elasticsearch point to the value of database management, data pipelines, and efficient data storage.
- Development & Collaboration: Bitbucket, GitLab, and Jenkins suggest that version control, automation, and collaborative development are valuable complementary skills.
- AI & Machine Learning: Watson and DataRobot indicate that AI integration and machine learning platforms are associated with higher-paying positions.
Overall trend: The highest-paying data analytics roles appear to favor candidates with a combination of advanced programming, big data processing, cloud infrastructure, and data engineering skills rather than just traditional reporting and visualization.

Notable observation: PySpark ($208,172) stands out significantly, suggesting that large-scale data processing is particularly valuable in this dataset.

Note: These are average salaries associated with job postings mentioning each skill.


*/