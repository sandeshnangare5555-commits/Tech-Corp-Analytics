-- Project Analysis

-- Q1) Which are the Top 10 highest-budget projects?
WITH budgets AS
(
    SELECT
        project_id,
        project_name,
        project_status,
        project_budget,
        RANK() OVER(ORDER BY project_budget DESC) AS project_rank
    FROM project
)
SELECT 
    project_id,
    project_name,
    project_status,
    project_budget,
    project_rank
FROM
    budgets
WHERE
    project_rank <= 10
ORDER BY project_rank;

-- start transaction;

-- update project set project_budget = 4950054 where project_id = 3;




-- Q2) What is the distribution of projects by status?
SELECT 
    project_status, COUNT(project_status) AS total_projects
FROM
    project
GROUP BY project_status
ORDER BY total_projects DESC;



-- Q3) What is the average project budget by project status?
SELECT 
    project_status,
    ROUND(AVG(project_budget), 2) AS avg_project_budgets
FROM
    project
GROUP BY project_status
ORDER BY avg_project_budgets DESC;


-- Q4) Which are the Top 10 highest-budget projects and which departments manage them?
with ranked_projects as
(select 
rank() over(order by p.project_budget desc) as ranks,
p.project_name, d.department_name , p.project_budget 
from project p
left join department d 
on p.department_id = d.department_id)


SELECT 
    ranks, project_name, department_name, project_budget
FROM
    ranked_projects
WHERE
    ranks <= 10;

select * from client;
select * from project;



-- Q5) Which clients have the highest number of projects?
SELECT 
    c.client_id,
    c.client_name,
    COUNT(p.project_id) AS project_count
FROM
    client c
        LEFT JOIN
    project p ON p.client_id = c.client_id
GROUP BY c.client_id , c.client_name
ORDER BY project_count DESC;






use techcorp_analytics;
-- Q6) Which clients have the highest total project budget?
SELECT 
    c.client_name,
    COALESCE(sum(p.project_budget),0) AS total_project_budget
FROM
    client c
        LEFT JOIN
    project p ON p.client_id = c.client_id
GROUP BY c.client_id , c.client_name
ORDER BY total_project_budget DESC;








-- Q7) Which projects are currently on hold, and which departments are responsible for them?
SELECT 
    p.project_name,
    d.department_name AS responsible_department,
    p.project_budget,
    p.project_status
FROM
    project p
        LEFT JOIN
    department d ON p.department_id = d.department_id
WHERE
    p.project_status = 'on hold'
ORDER BY p.project_budget DESC;
	








-- Q8) Which project statuses account for the highest total project budget?
SELECT 
    project_status, COALESCE(SUM(project_budget),0) AS total_project_budget
FROM
    project
GROUP BY project_status
ORDER BY total_project_budget DESC;
