-- Calculate the percentage of international calls (calls where the caller and receiver are from different countries) out of the total number of calls, and round the result to one decimal place.
  
SELECT round(count(*) filter(
                             where i.country_id <> r.country_id) *100.0 / count(*),1)
FROM phone_calls c
left join phone_info i on c.caller_id = i.caller_id
left join phone_info r on c.receiver_id = r.caller_id
