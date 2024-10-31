SELECT airline.airline_id, flights.flight_id, airline.airline_name, flights.flight_no FROM airline
INNER JOIN flights ON flights.airline_id = airline.airline_id;

SELECT flights.*, airport.airport_name FROM airport
INNER JOIN flights ON flights.departure_airport_id = airport.airport_id;

SELECT *
FROM airline
LEFT JOIN flights
    ON airline.airline_id = flights.airline_id
    AND EXTRACT(MONTH FROM flights.scheduled_arrival) = EXTRACT(MONTH FROM CURRENT_DATE + INTERVAL '1 month')
    AND EXTRACT(YEAR FROM flights.scheduled_arrival) = EXTRACT(YEAR FROM CURRENT_DATE + INTERVAL '1 month')
WHERE flights.scheduled_arrival IS NULL;

SELECT flights.flight_id, STRING_AGG(passengers.first_name || ' ' || passengers.last_name, ', ') AS full_name
FROM flights INNER JOIN booking ON flights.flight_id=booking.flight_id
    INNER JOIN passengers ON booking.passenger_id=passengers.passenger_id
GROUP BY flights.flight_id
ORDER BY flights.flight_id;


SELECT flights.flight_id, STRING_AGG(passengers.first_name || ' ' || passengers.last_name, ', ') AS full_name, AVG(booking.price) AS average_tenge
FROM flights INNER JOIN booking ON flights.flight_id=booking.flight_id
    INNER JOIN passengers ON booking.passenger_id=passengers.passenger_id
GROUP BY flights.flight_id
ORDER BY flights.flight_id;

SELECT flights.flight_id, STRING_AGG(passengers.first_name || ' ' || passengers.last_name, ', ') AS full_name, MAX(booking.price) AS average_tenge
FROM flights INNER JOIN booking ON flights.flight_id=booking.flight_id
    INNER JOIN passengers ON booking.passenger_id=passengers.passenger_id
GROUP BY flights.flight_id
ORDER BY flights.flight_id;

SELECT airport.country, STRING_AGG(flights.flight_no, ', ') AS flights FROM flights
    FULL JOIN airline ON flights.airline_id=airline.airline_id
    FULL JOIN airport ON airline.airline_id=airport.airport_id
GROUP BY airport.country;

SELECT passengers.first_name || ' ' || passengers.last_name AS full_name, airport.country FROM booking
    INNER JOIN flights ON booking.flight_id = flights.flight_id
    INNER JOIN passengers ON booking.passenger_id = passengers.passenger_id
    INNER JOIN airport ON flights.arrival_airport_id = airport.airport_id
WHERE EXTRACT(YEAR FROM AGE(current_date, passengers.date_of_birth)) < 18;

SELECT passengers.first_name || ' ' || passengers.last_name AS full_name, flights.actual_arrival FROM booking
    INNER JOIN flights ON booking.flight_id=flights.flight_id
    INNER JOIN passengers ON booking.passenger_id = passengers.passenger_id;
