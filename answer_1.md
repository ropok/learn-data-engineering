# 1.1
Write a query to find out popular international routes during Jan 2017 - Dec 2018. Sort from the most popular.

```SQL
SELECT f.booking_paid_time, f.source_airport_id, f.destination_airport_id, d1.airport_country_name as DepartureCountry, d2.airport_country_name as ArrivalCountry
FROM fact_flight_sales as f
INNER JOIN dim_flight_airport d1 ON d1.airport_id = f.source_airport_id
INNER JOIN dim_flight_airport d2 ON d2.airport_id = f.destination_airport_id
WHERE DepartureCountry <> ArrivalCountry
ORDER BY COUNT(ArrivalCountry) DESC;
```

# 1.2
Write a query to find the average time (in minute) it takes users to make payment of their bookings. Present the average times for each payment method.

```SQL
SELECT payment_method, AVG(DATEDIFF(minute, booking_created_time, booking_paid_time))
FROM fact_flight_sales
GROUP BY payment_method;
```

# 1.3
Write a query to get the first five flight ticket purchases of each user in 2017 who have purchased flight tickets at least 5 times and have spent IDR 25 Mio. Sort from users who have highest spend, and then sort by the purchase sequence (from 1 to 5) for each user.

```SQL
SELECT user_id, ROW_NUMBER() OVER (ORDER BY user_id) AS booking_sequence, CONVERT(booking_created_time, getdate()) AS booking_created_date, booking_price_amount, SUM(booking_price_amount) AS total_booking_price_amount
FROM fact_flight_sales
WHERE booking_sequence >= 5 AND total_booking_price_amount >= 25000000;
```