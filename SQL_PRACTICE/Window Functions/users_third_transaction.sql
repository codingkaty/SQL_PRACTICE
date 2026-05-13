--- Find the third transaction for each user, and return the user_id, spend, and transaction_date for those transactions.

with user_transaction_rank AS
(
  SELECT user_id, 
  spend,
  transaction_date,
  row_number() over(partition by user_id order by transaction_date) as transaction_order
  FROM transactions
)
select user_id, spend, transaction_date
from user_transaction_rank
where transaction_order = 3