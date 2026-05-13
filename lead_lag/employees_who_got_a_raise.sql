-- This query identifies employees who received a raise by comparing their current salary to their previous salary.

WITH previous_job_salary AS
(SELECT 
    employee_id, 
    LEAD(salary) OVER(PARTITION BY employee_id order by effective_date desc) as previous_salary,
    salary as current_salary,
    ROW_NUMBER() OVER(PARTITION BY employee_id order by effective_date desc) as position_num
FROM salary_history
order by employee_id, effective_date Desc)

SELECT employee_id, previous_salary, current_salary, current_salary - previous_salary as increase_amount
FROM previous_job_salary
WHERE current_salary > previous_salary and position_num = 1 and previous_salary is not null