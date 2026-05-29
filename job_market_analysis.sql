Create database job_market_analysis;

show databases;

Use job_market_analysis;

Select * from job_market_analysis;

-- States with most jobs
Select States, count(*) As Total_Jobs
From job_market_analysis
Group By States
Order By Total_Jobs Desc;

-- Average min and max salary by state
Select States,
Avg(Lower_salary) As Avg_Min_Salary,
Avg(Upper_salary) As Avg_Max_Salary
From job_market_analysis
Group by States
Order by Avg_Max_Salary Desc;

-- Rename Column name of avg_salary
Alter Table job_market_analysis
Rename column Avg_Salaryk To Avg_Salary;

-- Average salary by state
Select States,
Round(Avg(Avg_Salary), 2) As Avg_Salaries_State
From job_market_analysis
Group by States
Order by Avg_Salaries_State Desc;

-- Top 5 industries with most jobs of Data science 
Select Industry, Count(*) As Total_Jobs
From job_market_analysis
WHERE job_title_sim = 'data scientist'
Group by Industry
Order by Total_Jobs Desc
Limit 5;

-- Companies with Maximum Number of Job Openings.
Select Company_Name, Count(*) As Total_Openings 	
From job_market_analysis
Group by Company_Name 
Order by Total_Openings Desc
Limit 10;

-- Job Titles with Most Number of Jobs.
Select Job_Title, Count(*) As Total_Jobs
From job_market_analysis
Group by Job_Title 
Order by Total_Jobs Desc
Limit 10;

-- Salary of Job Titles with Most Number of Jobs.
Select job_title_sim, 
	Round(Avg(Lower_Salary), 2) As Avg_Min_Salary,
    Round(Avg(Upper_Salary), 2) As Avg_Max_Salary,
    Round(Avg(Avg_Salary), 2) As Avg_Salary
From job_market_analysis
Group by job_title_sim
Order by Avg_Salary Desc;

-- Skills Required by Companies for Each Job Title
Select Company_Name, Job_Title,
	Sum(Python) As Python,
    Sum(spark) As Pyspark,
	Sum(aws) As AWS,
	Sum(excel) As Excel,
    Sum(sql_) As SQL_,
    Sum(Tableau) As Tableau,
    Sum(bi) As PowerBI,
    Sum(hadoop) As Hadoop,
    Sum(tensor) As TensorFlow,
    Sum(mongo) As MongoDB
From job_market_analysis
Group by Company_Name, Job_Title
Order by Company_Name ASC
Limit 20;

-- Relation between Average Salary and Education.
Select Degree,
	Count(*) As Total_Jobs,
    Round(Avg(Avg_Salary), 2) As Avg_Salary
From job_market_analysis
Group by Degree
Order by Avg_Salary Desc;

-- Insight 1: Hourly vs Annual salary jobs count
SELECT 
  CASE WHEN Hourly = 1 THEN 'Hourly' ELSE 'Annual' END AS Salary_Type,
  COUNT(*) AS Total_Jobs,
  ROUND(AVG(Avg_Salary), 2) AS Avg_Salary
FROM job_market_analysis
GROUP BY Hourly;

-- Insight 2: Company size vs average salary
SELECT Size,
  COUNT(*) AS Total_Jobs,
  ROUND(AVG(Avg_Salary), 2) AS Avg_Salary
FROM job_market_analysis
GROUP BY Size
ORDER BY Avg_Salary DESC;

-- Insight 3: Seniority level vs average salary
SELECT seniority_by_title,
  COUNT(*) AS Total_Jobs,
  ROUND(AVG(Avg_Salary), 2) AS Avg_Salary
FROM job_market_analysis
GROUP BY seniority_by_title
ORDER BY Avg_Salary DESC;

-- Insight 4: Type of ownership vs average salary
SELECT Type_of_ownership,
  COUNT(*) AS Total_Jobs,
  ROUND(AVG(Avg_Salary), 2) AS Avg_Salary
FROM job_market_analysis
GROUP BY Type_of_ownership
ORDER BY Avg_Salary DESC;

-- Insight 5: Sector wise job count and salary
SELECT Sector,
  COUNT(*) AS Total_Jobs,
  ROUND(AVG(Avg_Salary), 2) AS Avg_Salary
FROM job_market_analysis
GROUP BY Sector
ORDER BY Total_Jobs DESC
LIMIT 10;

SELECT * FROM job_market_analysis;









