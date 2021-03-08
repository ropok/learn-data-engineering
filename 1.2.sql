SELECT payment_method, AVG(DATEDIFF(minute, booking_created_time, booking_paid_time))
FROM fact_flight_sales
GROUP BY payment_method;