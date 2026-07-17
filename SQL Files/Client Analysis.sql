-- Client Analysis

SELECT * from client;


-- Q1) Which clients belong to each industry?
select client_name ,industry from client
ORDER BY industry, client_name asc;





-- Q2) Which industry has the highest number of clients?
SELECT 
    COUNT(client_name) AS client_counts, industry
FROM
    client
GROUP BY industry
ORDER BY client_counts DESC;




-- Q3)  Which industry generates the highest total project budget?
SELECT 
    c.industry, COALESCE(SUM(p.project_budget),0) AS total_project_budget
FROM
    client c
    LEFT JOIN
    project p ON c.client_id = p.client_id
GROUP BY c.industry
ORDER BY total_project_budget DESC;




-- Q4) Which clients have the highest average project budget?
SELECT 
    c.client_id,c.client_name,
    COALESCE(ROUND(AVG(p.project_budget), 2), 0) AS avg_project_budget
FROM
    client c
        LEFT JOIN
    project p ON c.client_id = p.client_id
GROUP BY c.client_id , C.client_name
ORDER BY avg_project_budget DESC LIMIT 1;



select * from project;
-- Q5) Which clients have the highest number of completed projects?
SELECT 
    c.client_name, COUNT(p.project_status) AS  completed_projects
FROM
    client c
        JOIN
    project p ON c.client_id = p.client_id
WHERE
    p.project_status = 'completed'
GROUP BY c.client_id , c.client_name
ORDER BY completed_projects DESC;
