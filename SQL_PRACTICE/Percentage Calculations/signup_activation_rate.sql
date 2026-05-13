-- Calculate the percentage of signups that were confirmed, and round the result to two decimal places.

SELECT ROUND(
CAST(
COUNT(CASE WHEN signup_action = 'Confirmed' THEN 1 END) AS DECIMAL(10,2))
/COUNT(signup_action),2) AS total_signup
FROM emails
LEFT JOIN texts ON emails.email_id = texts.email_id