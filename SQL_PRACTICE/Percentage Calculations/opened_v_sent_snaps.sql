-- Calculate the percentage of time spent on 'send' and 'open' activities for each age bucket, and round the percentages to two decimal places.

WITH send AS (
  SELECT SUM(a.time_spent) AS time_spent_s, age_bucket
  FROM activities a
  LEFT JOIN age_breakdown a_b
  ON a.user_id = a_b.user_id
  WHERE activity_type LIKE 'send'
  GROUP BY a_b.age_bucket),
open AS (
  SELECT SUM(a.time_spent) AS time_spent_o, age_bucket
  FROM activities a
  LEFT JOIN age_breakdown a_b
  ON a.user_id = a_b.user_id
  WHERE activity_type LIKE 'open'
  GROUP BY a_b.age_bucket
)
SELECT o.age_bucket, 
ROUND((s.time_spent_s/(s.time_spent_s + o.time_spent_o))*100.00,2) AS send_perc, 
ROUND((o.time_spent_o/(s.time_spent_s + o.time_spent_o))*100.00,2) AS open_perc
FROM send s
JOIN open o on s.age_bucket = o.age_bucket
