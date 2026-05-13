-- Calculate the Year-over-Year (YoY) growth rate of spend for each product

SELECT EXTRACT(YEAR from transaction_date) AS year, 
product_id, 
spend AS curr_year_spend, 
LAG(spend, 1) OVER(PARTITION BY product_id ORDER BY transaction_date) AS prev_year_spend,
ROUND(((spend - LAG(spend, 1) OVER(PARTITION BY product_id ORDER BY transaction_date))/LAG(spend, 1) OVER(PARTITION BY product_id ORDER BY transaction_date))*100, 2) AS yoy_rate 
FROM user_transactions 

