
-- Location Analysis
select * from employee;
select * from location;
-- Q1)  Which locations have the highest number of employees?
SELECT 
    l.city, COUNT(e.employee_id) AS total_employee
FROM
    location l
        LEFT JOIN
    employee e ON l.location_id = e.location_id
GROUP BY l.location_id , l.city
ORDER BY total_employee DESC;





-- Q2) Which locations have the highest average employee salary?
SELECT 
    l.city, COALESCE(ROUND(AVG(e.salary), 2),0) AS avg_salary
FROM
    location l
        LEFT JOIN
    employee e ON l.location_id = e.location_id
GROUP BY l.city , l.location_id
ORDER BY avg_salary DESC;



-- Q3) Which locations have the most experienced workforce on average?
SELECT 
    l.city, COALESCE(ROUND(AVG(e.experience_years), 2),0) AS avg_experience_years
FROM
    location l
        LEFT JOIN
    employee e ON l.location_id = e.location_id
GROUP BY l.city , l.location_id
ORDER BY avg_experience_years DESC;
