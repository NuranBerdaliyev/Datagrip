CREATE TABLE Airline_info (
    airline_id serial PRIMARY KEY,
    airline_code VARCHAR(30) NOT NULL,
    airline_name VARCHAR(50) NOT NULL,
    airline_country VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP,
    info VARCHAR(50) NOT NULL
);

CREATE TABLE Airport (
    airport_id serial PRIMARY KEY,
    airport_name VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP
);
CREATE TABLE Baggage_check (
    baggage_check_id serial PRIMARY KEY,
    check_result VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP,
    booking_id INT NOT NULL,
    passenger_id INT NOT NULL
);
CREATE TABLE Baggage (
    baggage_id serial PRIMARY KEY,
    weight_in_kg DECIMAL(4, 2) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP,
    booking_id INT NOT NULL
);
CREATE TABLE Boarding_pass (
    boarding_pass_id serial PRIMARY KEY,
    booking_id INT,
    seat VARCHAR(50) NOT NULL,
    boarding_time TIMESTAMP NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP
);
CREATE TABLE Booking_flight (
    booking_flight_id serial PRIMARY KEY,
    booking_id INT NOT NULL,
    flight_id INT NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP
);
CREATE TABLE Booking (
    booking_id serial PRIMARY KEY,
    flight_id INT NOT NULL,
    passenger_id INT NOT NULL,
    booking_platform VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP,
    status VARCHAR(50) NOT NULL,
    price DECIMAL(7,2)
);
CREATE TABLE Flights (
    flight_id serial PRIMARY KEY,
    sch_departure_time TIMESTAMP,
    sch_arrival_time TIMESTAMP,
    departing_airport_id INT,
    arriving_airport_id INT,
    departing_gate VARCHAR(50),
    arriving_gate VARCHAR(50),
    airline_id INT NOT NULL,
    act_departure_time TIMESTAMP,
    act_arrival_time TIMESTAMP,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP
);
CREATE TABLE Passengers (
    passenger_id serial PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(50) NOT NULL,
    country_of_citizenship VARCHAR(50) NOT NULL,
    country_of_residence VARCHAR(50) NOT NULL,
    passport_number VARCHAR(20) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP
);

CREATE TABLE Security_check (
    security_check_id serial PRIMARY KEY,
    check_result VARCHAR(20) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP,
    passenger_id INT NOT NULL
);

ALTER TABLE Airline_info RENAME TO Airline;
ALTER TABLE Booking RENAME COLUMN price TO ticket_price;
ALTER TABLE Flights ALTER COLUMN departing_gate SET DATA TYPE text;
ALTER TABLE Airline DROP COLUMN info;
