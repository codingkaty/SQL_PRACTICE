-- Calculate the total cost of all unique three-topping pizza combinations, and order the results by total cost in descending order.

SELECT 
  DISTINCT
  CONCAT(
  p1.topping_name, ',',
  p2.topping_name, ',', 
  p3.topping_name) as pizza,
  (p1.ingredient_cost + p2.ingredient_cost + p3.ingredient_cost) as total_cost
FROM pizza_toppings p1
JOIN pizza_toppings p2 on p1.topping_name < p2.topping_name
JOIN pizza_toppings p3 on p2.topping_name < p3.topping_name 
order by 2 DESC