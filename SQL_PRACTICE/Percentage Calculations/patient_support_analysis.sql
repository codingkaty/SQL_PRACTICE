-- Calculate the percentage of calls that were uncategorised (i.e., where call_category is NULL or 'n/a'), and round the result to one decimal place.

SELECT 
  round(100.0*count(case_id)/(select count(case_id) from callers),1) as uncategorised_call_pct
FROM callers
where call_category IS NULL or call_category LIKE 'n/a'