-- Calculate the total uptime of all servers in days, based on the start and stop times recorded in the server_utilization table. Assume that the session_status column indicates whether a server is starting or stopping, and that the status_time column records the timestamp of each status change.

WITH times AS
    (SELECT server_id,
            session_status,
            status_time AS start_time,
            LEAD(status_time) OVER (PARTITION BY server_id
                                    ORDER BY status_time) AS stop_time
     FROM server_utilization)
SELECT DATE_PART('days',JUSTIFY_HOURS(SUM(stop_time - start_time))) AS total_uptime_days
FROM times
WHERE session_status = 'start'
    AND stop_time IS NOT NULL