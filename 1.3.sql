SELECT user_id, ROW_NUMBER() OVER (ORDER BY user_id) AS booking_sequence, CONVERT(booking_created_time, getdate()) AS booking_created_date, booking_price_amount, SUM(booking_price_amount) AS total_booking_price_amount
FROM fact_flight_sales
WHERE booking_sequence >= 5 AND total_booking_price_amount >= 25000000;