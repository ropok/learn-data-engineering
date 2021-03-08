SELECT f.booking_paid_time, f.source_airport_id, f.destination_airport_id, d1.airport_country_name as DepartureCountry, d2.airport_country_name as ArrivalCountry
FROM fact_flight_sales as f
INNER JOIN dim_flight_airport d1 ON d1.airport_id = f.source_airport_id
INNER JOIN dim_flight_airport d2 ON d2.airport_id = f.destination_airport_id
WHERE DepartureCountry <> ArrivalCountry
ORDER BY COUNT(ArrivalCountry) DESC;