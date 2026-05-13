-- Maximize the frequency of prime eligible items in the inventory while ensuring that the total square footage does not exceed 500,000 sqft.

WITH prime AS(
SELECT item_type, SUM(square_footage) as total_sqft, COUNT(item_id) AS num_items 
FROM inventory
GROUP BY item_type),
 prime_calc AS 
(
SELECT item_type, 500000 - FLOOR(500000/total_sqft)*total_sqft AS remaining_sqft, (FLOOR(500000/total_sqft)*num_items) AS item_count
FROM prime
WHERE item_type LIKE 'prime_eligible'
),
not_prime_calc AS (
SELECT item_type, FLOOR((SELECT remaining_sqft FROM prime_calc)/total_sqft)*num_items as item_count
FROM prime
WHERE item_type LIKE 'not_prime'
)
SELECT item_type, item_count FROM prime_calc
UNION
SELECT item_type, item_count FROM not_prime_calc
ORDER BY item_type DESC