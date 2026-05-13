-- This query retrieves the top 3 highest salaries in each department along with the employee names and department names.

WITH top_earner_by_dept AS (SELECT e.name, d.department_name,
DENSE_RANK() OVER(PARTITION BY e.department_id ORDER BY e.salary DESC) AS salary_rank, salary
FROM employee e
JOIN department d ON e.department_id = d.department_id)

SELECT department_name, name,  salary
FROM top_earner_by_dept 
WHERE salary_rank <=3
ORDER BY department_name, salary DESC, name 