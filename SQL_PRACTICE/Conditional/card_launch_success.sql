-- Identify the card with the highest number of cards issued in a single month, and return the card name along with the issued amount.

WITH monthly_cards_by_date AS
(
    SELECT DISTINCT(card_name) AS card, 
    issue_month,
    issue_year, 
    issued_amount, 
    ROW_NUMBER() OVER(PARTITION BY card_name ORDER BY card_name, issued_amount)
    FROM monthly_cards_issued
)
SELECT card, issued_amount
FROM monthly_cards_by_date
WHERE row_number = 1
ORDER BY issued_amount DESC