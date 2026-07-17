
-- employee analysis
-- Q1) How many employees are in each department?
WITH emp_dept AS (
    SELECT d.department_name,
           COUNT(*) AS total_employee
    FROM employee e
    JOIN department d
      ON e.department_id = d.department_id
    GROUP BY d.department_name
)
SELECT department_name,
       total_employee,
       ROUND(
           total_employee * 100.0
           / SUM(total_employee) OVER (),
           2
       ) AS percentage
FROM emp_dept;



-- Q2) How many employees are located in each city?
SELECT 
    l.city, COUNT(*) AS total_emp_per_city
FROM
    employee e
        JOIN
    location l ON e.location_id = l.location_id
GROUP BY l.city;



-- Q3) What is the gender distribution across the company?
SELECT
    gender,
    COUNT(*) AS employee_count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS percentage_of_workforce
FROM employee
GROUP BY gender;




-- Q4) What is the average salary by department?
SELECT
    d.department_name,
    AVG(e.salary) AS avg_salary
FROM employee e
JOIN department d
    ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY avg_salary DESC;




-- Q5) What is the average experience by department?
SELECT 
    d.department_name, AVG(e.experience_years) AS avg_experience
FROM
    employee e
        LEFT JOIN
    department d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY avg_experience DESC;




-- Q6) Which employees earn more than their department's average salary?
WITH dept_avg_salary AS (
    SELECT
        department_id,
        AVG(salary) AS avg_salary
    FROM employee
    GROUP BY department_id
)
SELECT
    e.employee_name,
    d.department_name,
    e.salary,
    das.avg_salary AS department_avg_salary,
    e.salary - das.avg_salary AS salary_difference
FROM employee e
JOIN dept_avg_salary das
    ON e.department_id = das.department_id
JOIN department d
    ON e.department_id = d.department_id
WHERE e.salary > das.avg_salary
ORDER BY d.department_name, salary_difference DESC;




-- Q7) Which employees earn more than their department's average salary and have above-average experience?
WITH department_stats AS
(SELECT 
    d.department_id,
    d.department_name,
    AVG(e.salary) AS avg_salary,
    AVG(experience_years) AS avg_exp
FROM
    employee e
        JOIN
    department d ON e.department_id = d.department_id
GROUP BY d.department_id,d.department_name)
SELECT 
    e.employee_name,
    t.department_name,
    e.salary,
    e.experience_years
FROM
    employee e
        JOIN
    department_stats t ON e.department_id = t.department_id
WHERE
    e.salary > avg_salary
        AND e.experience_years > avg_exp;




-- Q8) Show the Top 3 highest-paid employees within each department.
WITH employee_salary_rank AS
(
    SELECT
        e.employee_name,
        d.department_name,
        e.salary,
        ROW_NUMBER() OVER (
            PARTITION BY e.department_id
            ORDER BY e.salary DESC
        ) AS salary_rank
    FROM employee e
    JOIN department d
        ON e.department_id = d.department_id
)
SELECT
	*
FROM employee_salary_rank
WHERE salary_rank <= 3
ORDER BY
    department_name,
    salary_rank;
