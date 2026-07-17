-- Department Analysis

-- Q1) Which department has the largest workforce?
SELECT 
    d.department_name, COUNT(*) AS department_workforce
FROM
    employee e
        JOIN
    department d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY department_workforce DESC;





-- Q2) Which department has the highest average salary and how many employee in that department?
SELECT 
    COUNT(*) AS employee_count,
    d.Department_Name,
    ROUND(AVG(e.salary), 2) AS Department_Avg_Salary
FROM
    department d
        LEFT JOIN
    employee e ON e.department_id = d.department_id
GROUP BY d.department_name , d.department_id
ORDER BY Department_avg_salary DESC
LIMIT 1;




-- Q3)  Which department has the highest total salary expense?
SELECT
    d.Department_Name,
    COUNT(e.employee_id) AS Employee_Count,
    SUM(e.salary) AS Total_Salary_Expense
FROM department d
LEFT JOIN employee e
    ON d.department_id = e.department_id
GROUP BY
    d.department_id,
    d.department_name
ORDER BY total_salary_expense DESC
LIMIT 1;


-- Q4)  Which department has the most experienced workforce on average?
SELECT 
    d.Department_Name,
    ROUND(AVG(e.experience_years),2) AS Avg_Experience_Years,
    COUNT(e.employee_id) AS Total_Emp_Per_Dept
FROM
    employee e
        LEFT JOIN
    department d ON e.department_id = d.department_id
GROUP BY d.department_id ,d.department_name
ORDER BY avg_experience_years DESC limit 1;



-- Q5) How many projects are managed by each department?
SELECT 
    d.department_name, COUNT(p.project_id) AS count_of_projects
FROM
    department d 
        LEFT JOIN
    project p ON p.department_id = d.department_id
GROUP BY d.department_id , d.department_name
ORDER BY count_of_projects DESC;


-- Q6) What is the total project budget managed by each department?
SELECT 
    d.Department_Name, COALESCE(SUM(p.project_budget), 0) AS total_budget
FROM
    department d
        LEFT JOIN
    project p ON d.department_id = p.department_id
GROUP BY d.department_id , d.department_name
ORDER BY total_budget DESC;


-- Q7)What is the average project budget managed by each department?
SELECT 
    d.Department_Name, COALESCE(ROUND(avg(p.project_budget),2), 0) AS AVG_Project_budget
FROM
    department d
        LEFT JOIN
    project p ON d.department_id = p.department_id
GROUP BY d.department_id , d.department_name
ORDER BY AVG_Project_budget DESC;



-- Q8) Which departments have completed the highest number of projects?                                                                                                      
SELECT
    d.department_name,
    SUM(
        CASE
            WHEN p.project_status = 'Completed' THEN 1                                                       
            ELSE 0                                                                                                             
        END                                                                                                         
    ) AS completed_projects_count
FROM department d                                                                                                        
LEFT JOIN project p
    ON d.department_id = p.department_id                                                                            
GROUP BY
    d.department_id,
    d.department_name
ORDER BY
    completed_projects_count DESC;
    
-- THIS IS USE TO DEBUGGING FOR CASE     

-- start TRANSACTION;
-- UPDATE PROJECT SET PROJECT_STATUS = NULL WHERE DEPARTMENT_ID = 3;
-- SELECT * FROM PROJECT; /* THIS SHOW HR PROJECT_STATUS ARE NULL AND THEN RUN QUESTION NUMBER 8 THEN YOU SEE THE ACTUAL CASE IS EXECUTE*/
-- ROLLBACK; /* THIS YOU TO ROLLBACK ALL DATA AFTER USE */




-- Q9) Which departments are managing the highest number of projects that are currently in progress?
SELECT 
    d.department_name,
    SUM(CASE
        WHEN p.project_status = 'in progress' THEN 1
        ELSE 0
    END) AS in_progress_count
FROM
    department d
        LEFT JOIN
    project p ON d.department_id = p.department_id
GROUP BY d.department_id , d.department_name
ORDER BY in_progress_count DESC;




-- Q10) What percentage of the company's total project budget is managed by each department?
WITH department_budgets AS
(SELECT 
    d.department_id,
    d.department_name,
    SUM(p.project_budget) AS department_total_project_budget,
    (SELECT 
            SUM(p.project_budget)
        FROM
            project p) AS company_budget
FROM
    department d
        LEFT JOIN
    project p ON d.department_id = p.department_id
GROUP BY d.department_id , d.department_name)

SELECT 
    department_id,
    department_name,
    department_total_project_budget,
    company_budget,
    ROUND(((db.department_total_project_budget / db.company_budget) * 100),
                    2)
             AS percentage_of_project_budgets
FROM
    department_budgets db
ORDER BY percentage_of_project_budgets DESC;
