---- List the names of all senior managers (managers who have at least one direct reportee who is also a manager) along with the count of their direct reportees.

SELECT m.manager_name AS manager_name,
       COUNT(DISTINCT e.emp_id) AS direct_reportees
FROM employees e
INNER JOIN employees m ON e.manager_id = m.emp_id
INNER JOIN employees sm ON m.manager_id = sm.emp_id
GROUP BY m.manager_name