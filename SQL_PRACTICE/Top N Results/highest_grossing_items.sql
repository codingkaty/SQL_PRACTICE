-- This query retrieves the top 2 highest grossing products in each category for the year 2022.

with ranked_spend_by_cateogry AS (
SELECT category, 
product, 
sum(spend) as total_spend, 
row_number() over(partition by category order by sum(spend) DESC) as spend_rank
FROM product_spend
where extract ('year' from transaction_date) = 2022
GROUP BY 1, 2
order by 1,3 desc)
SELECT category, product, total_spend
FROM ranked_spend_by_cateogry
where spend_rank <= 2