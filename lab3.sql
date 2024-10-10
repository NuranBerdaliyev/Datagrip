CREATE TABLE Airline_info (
    airline_id serial PRIMARY KEY,
    airline_code VARCHAR(30) NOT NULL,
    airline_name VARCHAR(50) NOT NULL,
    airline_country VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP,
    info VARCHAR(50)
);
CREATE TABLE Airport (
    airport_id serial PRIMARY KEY,
    airport_name VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    state VARCHAR(50),
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
    passenger_id INT NOT NULL,
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id) ON UPDATE CASCADE ON DELETE
    CASCADE,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)  ON UPDATE CASCADE ON DELETE
    CASCADE
);
CREATE TABLE Baggage (
    baggage_id serial PRIMARY KEY,
    weight_in_kg DECIMAL(4, 2) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP,
    booking_id INT NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)  ON UPDATE CASCADE ON DELETE
    CASCADE
);
CREATE TABLE Boarding_pass (
    boarding_pass_id serial PRIMARY KEY,
    booking_id INT,
    seat VARCHAR(50) NOT NULL,
    boarding_time TIMESTAMP NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)  ON UPDATE CASCADE ON DELETE
    CASCADE
);
CREATE TABLE Booking_flight (
    booking_flight_id serial PRIMARY KEY,
    booking_id INT NOT NULL,
    flight_id INT NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)  ON UPDATE CASCADE ON DELETE
    CASCADE,
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)  ON UPDATE CASCADE ON DELETE
    CASCADE
);
CREATE TABLE Booking (
    booking_id serial PRIMARY KEY,
    flight_id INT NOT NULL,
    passenger_id INT NOT NULL,
    booking_platform VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP,
    status VARCHAR(50) NOT NULL,
    price NUMERIC(7,2),
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id)  ON UPDATE CASCADE ON DELETE
    CASCADE
);
ALTER TABLE Booking ADD COLUMN price numeric(7,2);
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
    updated_at TIMESTAMP,
    FOREIGN KEY (departing_airport_id) REFERENCES Airport(airport_id)  ON UPDATE CASCADE ON DELETE
    CASCADE,
    FOREIGN KEY (arriving_airport_id) REFERENCES Airport(airport_id)  ON UPDATE CASCADE ON DELETE
    CASCADE,
    FOREIGN KEY (airline_id) REFERENCES Airline_info(airline_id)  ON UPDATE CASCADE ON DELETE
    CASCADE
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
    check_result BOOLEAN NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP,
    passenger_id INT NOT NULL,
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id)  ON UPDATE CASCADE ON DELETE
    CASCADE
);

ALTER TABLE Airline_info RENAME TO Airline;
ALTER TABLE Booking RENAME COLUMN price TO ticket_price;
ALTER TABLE Flights ALTER COLUMN departing_gate SET DATA TYPE text;
ALTER TABLE Airline DROP COLUMN info;

insert into Airport (airport_name, country, state, city, created_at) values ('Grant County Airport', 'Russia', null, 'Voskresenskoye', '2023-03-03');
insert into Airport (airport_name, country, state, city, created_at) values ('Valley International Airport', 'Mongolia', null, 'Bulgan', '2023-09-19');
insert into Airport (airport_name, country, state, city, created_at) values ('Whitesburg Municipal Airport', 'Russia', null, 'Novyy Oskol', '2023-01-12');
insert into Airport (airport_name, country, state, city, created_at) values ('Ipil Airport', 'Egypt', null, 'Al Qurayn', '2023-06-27');
insert into Airport (airport_name, country, state, city, created_at) values ('Puerto Deseado Airport', 'Colombia', null, 'Ráquira', '2023-09-15');
insert into Airport (airport_name, country, state, city, created_at) values ('Leeward Point Field', 'Zambia', null, 'Lundazi', '2023-07-24');
insert into Airport (airport_name, country, state, city, created_at) values ('Wiscasset Airport', 'Philippines', null, 'Talaibon', '2023-01-30');
insert into Airport (airport_name, country, state, city, created_at) values ('Lumbala Airport', 'France', 'Centre', 'Blois', '2023-06-02');
insert into Airport (airport_name, country, state, city, created_at) values ('Concórdia Airport', 'China', null, 'Hengdaohezi', '2023-09-14');
insert into Airport (airport_name, country, state, city, created_at) values ('Mejit Atoll Airport', 'Netherlands', 'Provincie Overijssel', 'Zwolle', '2023-08-01');
insert into Airport (airport_name, country, state, city, created_at) values ('Komo-Manda Airport', 'China', null, 'Yandun', '2023-03-20');
insert into Airport (airport_name, country, state, city, created_at) values ('Fazenda Constância Airport', 'Japan', null, 'Okinawa', '2022-11-08');
insert into Airport (airport_name, country, state, city, created_at) values ('Corazón de Jesús Airport', 'Japan', null, 'Uenohara', '2023-09-25');
insert into Airport (airport_name, country, state, city, created_at) values ('Syamsudin Noor Airport', 'Palestinian Territory', null, 'Sīlat al Ḩārithīyah', '2023-08-23');
insert into Airport (airport_name, country, state, city, created_at) values ('Yoro Airport', 'Brazil', null, 'Artur Nogueira', '2023-10-01');
insert into Airport (airport_name, country, state, city, created_at) values ('Nephi Municipal Airport', 'China', null, 'Sanzhou', '2023-01-12');
insert into Airport (airport_name, country, state, city, created_at) values ('Flugplatz Kitzingen', 'China', null, 'Beiling', '2023-09-17');
insert into Airport (airport_name, country, state, city, created_at) values ('Komodo Airport', 'Russia', null, 'Zhiryatino', '2022-10-22');
insert into Airport (airport_name, country, state, city, created_at) values ('Ware Airport', 'Nigeria', null, 'Danja', '2023-04-01');
insert into Airport (airport_name, country, state, city, created_at) values ('Saipan International Airport', 'China', null, 'Maoshan', '2023-05-17');
insert into Airport (airport_name, country, state, city, created_at) values ('Manhattan Regional Airport', 'China', null, 'Qiaosi', '2023-10-07');
insert into Airport (airport_name, country, state, city, created_at) values ('Siuna', 'Indonesia', null, 'Nangkasari', '2023-05-17');
insert into Airport (airport_name, country, state, city, created_at) values ('Aitutaki Airport', 'Georgia', null, 'Ozurgeti', '2023-07-29');
insert into Airport (airport_name, country, state, city, created_at) values ('Wiluna Airport', 'Japan', null, 'Tomigusuku', '2023-06-18');
insert into Airport (airport_name, country, state, city, created_at) values ('Qurghonteppa International Airport', 'China', null, 'Licheng', '2023-01-29');
insert into Airport (airport_name, country, state, city, created_at) values ('Persian Gulf International Airport', 'Venezuela', null, 'Pedraza La Vieja', '2023-08-25');
insert into Airport (airport_name, country, state, city, created_at) values ('Coromandel Aerodrome', 'China', null, 'Helin', '2023-07-27');
insert into Airport (airport_name, country, state, city, created_at) values ('Pescara International Airport', 'Russia', null, 'Nizhniy Novgorod', '2023-09-27');
insert into Airport (airport_name, country, state, city, created_at) values ('Warrnambool Airport', 'Russia', null, 'Mukhen', '2022-12-03');
insert into Airport (airport_name, country, state, city, created_at) values ('Barstow Daggett Airport', 'Russia', null, 'Zelenchukskaya', '2022-12-14');
insert into Airport (airport_name, country, state, city, created_at) values ('Bolshoye Savino Airport', 'Brazil', null, 'Barra de São Francisco', '2023-09-04');
insert into Airport (airport_name, country, state, city, created_at) values ('Silur Airport', 'Russia', null, 'Mochishche', '2023-08-24');
insert into Airport (airport_name, country, state, city, created_at) values ('Sfax Thyna International Airport', 'Brazil', null, 'Rio Branco', '2022-10-25');
insert into Airport (airport_name, country, state, city, created_at) values ('Kakoro(Koroko) Airstrip', 'United States', 'Nevada', 'Las Vegas', '2022-11-08');
insert into Airport (airport_name, country, state, city, created_at) values ('Myitkyina Airport', 'Ukraine', null, 'Sloboda', '2022-11-20');
insert into Airport (airport_name, country, state, city, created_at) values ('Oswaldo Guevara Mujica Airport', 'Japan', null, 'Iyo', '2023-04-04');
insert into Airport (airport_name, country, state, city, created_at) values ('Moki Airport', 'United States', 'Connecticut', 'New Haven', '2023-06-01');
insert into Airport (airport_name, country, state, city, created_at) values ('Tuticorin Airport', 'Iran', null, 'Yazd', '2023-02-23');
insert into Airport (airport_name, country, state, city, created_at) values ('Budapest Liszt Ferenc International Airport', 'Indonesia', null, 'Kepoh', '2023-03-02');
insert into Airport (airport_name, country, state, city, created_at) values ('Kärdla Airport', 'China', null, 'Henghe', '2022-11-01');
insert into Airport (airport_name, country, state, city, created_at) values ('Gaua Island Airport', 'China', null, 'Changqi', '2022-11-09');
insert into Airport (airport_name, country, state, city, created_at) values ('Gardo Airport', 'China', null, 'Su’ao', '2023-03-07');
insert into Airport (airport_name, country, state, city, created_at) values ('Illizi Takhamalt Airport', 'Sweden', 'Västra Götaland', 'Partille', '2023-08-24');
insert into Airport (airport_name, country, state, city, created_at) values ('Stockholm Airport', 'Mexico', 'Oaxaca', 'Lazaro Cardenas', '2023-10-08');
insert into Airport (airport_name, country, state, city, created_at) values ('Brisbane International Airport', 'Indonesia', null, 'Rawuk', '2023-04-19');
insert into Airport (airport_name, country, state, city, created_at) values ('Kanas Airport', 'Jamaica', null, 'Point Hill', '2023-04-25');
insert into Airport (airport_name, country, state, city, created_at) values ('Melbourne International Airport', 'Uruguay', null, 'Treinta y Tres', '2022-10-31');
insert into Airport (airport_name, country, state, city, created_at) values ('Shaw River Airport', 'China', null, 'Tianxin', '2023-08-29');
insert into Airport (airport_name, country, state, city, created_at) values ('Comandante Gustavo Kraemer Airport', 'Philippines', null, 'Baganga', '2023-08-06');
insert into Airport (airport_name, country, state, city, created_at) values ('Shillong Airport', 'China', null, 'Meitang', '2023-08-20');
insert into Airport (airport_name, country, state, city, created_at) values ('Maxson Airfield', 'China', null, 'Namling', '2023-08-24');
insert into Airport (airport_name, country, state, city, created_at) values ('Syamsudin Noor Airport', 'Sweden', 'Norrbotten', 'Boden', '2023-03-12');
insert into Airport (airport_name, country, state, city, created_at) values ('Nadym Airport', 'Canada', 'Ontario', 'Delaware', '2023-01-14');
insert into Airport (airport_name, country, state, city, created_at) values ('Kristianstad Airport', 'Colombia', null, 'Gigante', '2023-03-15');
insert into Airport (airport_name, country, state, city, created_at) values ('Gol Airport', 'Indonesia', null, 'Sentani', '2023-01-10');
insert into Airport (airport_name, country, state, city, created_at) values ('Ngjiva Pereira Airport', 'China', null, 'Xinkai', '2023-02-28');
insert into Airport (airport_name, country, state, city, created_at) values ('Yaviza Airport', 'Indonesia', null, 'Ketanen', '2023-05-01');
insert into Airport (airport_name, country, state, city, created_at) values ('Gustavus Airport', 'Denmark', 'Region Hovedstaden', 'København', '2022-10-28');
insert into Airport (airport_name, country, state, city, created_at) values ('La Florida Airport', 'Russia', null, 'Malaya Dubna', '2022-11-02');
insert into Airport (airport_name, country, state, city, created_at) values ('Rangiroa Airport', 'Armenia', null, 'Shaghat', '2023-02-25');
insert into Airport (airport_name, country, state, city, created_at) values ('Meadows Field', 'Philippines', null, 'Pulo', '2022-12-08');
insert into Airport (airport_name, country, state, city, created_at) values ('Capt Justiniano Montenegro Airport', 'China', null, 'Chenda', '2023-06-17');
insert into Airport (airport_name, country, state, city, created_at) values ('Dinwiddie County Airport', 'Honduras', null, 'San Antonio', '2023-05-07');
insert into Airport (airport_name, country, state, city, created_at) values ('Qikiqtarjuaq Airport', 'China', null, 'Huilong', '2022-10-10');
insert into Airport (airport_name, country, state, city, created_at) values ('Matari Airport', 'Uzbekistan', null, 'Gazli', '2023-01-04');
insert into Airport (airport_name, country, state, city, created_at) values ('Simbai Airport', 'France', 'Île-de-France', 'Paris 17', '2023-06-15');
insert into Airport (airport_name, country, state, city, created_at) values ('Bayannur Tianjitai Airport', 'Sweden', 'Gävleborg', 'Gävle', '2023-02-07');
insert into Airport (airport_name, country, state, city, created_at) values ('Inta Airport', 'China', null, 'Huangfang', '2023-02-24');
insert into Airport (airport_name, country, state, city, created_at) values ('Songwe Airport', 'Chile', null, 'San Pedro de Atacama', '2023-06-25');
insert into Airport (airport_name, country, state, city, created_at) values ('Poplar Hill Airport', 'Vietnam', null, 'Thành Phố Nam Định', '2022-11-19');
insert into Airport (airport_name, country, state, city, created_at) values ('Clinton Municipal Airport', 'China', null, 'Longzhouwan', '2023-09-17');
insert into Airport (airport_name, country, state, city, created_at) values ('Jorge Chávez International Airport', 'United States', 'Texas', 'Austin', '2023-07-20');
insert into Airport (airport_name, country, state, city, created_at) values ('Lucélia Airport', 'China', null, 'Hekou', '2023-07-28');
insert into Airport (airport_name, country, state, city, created_at) values ('Maxwell Air Force Base', 'United Kingdom', 'England', 'Brampton', '2023-01-31');
insert into Airport (airport_name, country, state, city, created_at) values ('Rota International Airport', 'Afghanistan', null, 'Qarchī Gak', '2023-03-19');
insert into Airport (airport_name, country, state, city, created_at) values ('Zhoushan Airport', 'Belarus', null, 'Blon’', '2023-01-08');
insert into Airport (airport_name, country, state, city, created_at) values ('Khost Airport', 'Kenya', null, 'Ol Kalou', '2022-12-23');
insert into Airport (airport_name, country, state, city, created_at) values ('Aden Adde International Airport', 'France', 'Rhône-Alpes', 'Lyon', '2022-11-12');
insert into Airport (airport_name, country, state, city, created_at) values ('Long Bawan Airport', 'Philippines', null, 'Binucayan', '2023-03-01');
insert into Airport (airport_name, country, state, city, created_at) values ('Canton Island Airport', 'Burundi', null, 'Bururi', '2023-06-27');
insert into Airport (airport_name, country, state, city, created_at) values ('Sanford Seacoast Regional Airport', 'Czech Republic', null, 'Lysice', '2022-11-30');
insert into Airport (airport_name, country, state, city, created_at) values ('Waterloo Airport', 'China', null, 'Huaqiao', '2022-10-12');
insert into Airport (airport_name, country, state, city, created_at) values ('Tarauacá Airport', 'Russia', null, 'Vacha', '2023-09-25');
insert into Airport (airport_name, country, state, city, created_at) values ('Saidor Airport', 'Lithuania', null, 'Plateliai', '2023-01-17');
insert into Airport (airport_name, country, state, city, created_at) values ('Waukesha County Airport', 'Finland', null, 'Haapajärvi', '2023-02-10');
insert into Airport (airport_name, country, state, city, created_at) values ('Oudtshoorn Airport', 'Russia', null, 'Podol’sk', '2023-02-12');
insert into Airport (airport_name, country, state, city, created_at) values ('Playa De Oro International Airport', 'United Arab Emirates', null, 'Khawr Fakkān', '2023-03-16');
insert into Airport (airport_name, country, state, city, created_at) values ('Okayama Airport', 'Russia', null, 'Zyuzino', '2022-12-22');
insert into Airport (airport_name, country, state, city, created_at) values ('Dundo Airport', 'Mexico', 'Guanajuato', 'Guanajuato', '2022-10-30');
insert into Airport (airport_name, country, state, city, created_at) values ('Uchiza Airport', 'Greece', null, 'Évlalo', '2023-04-20');
insert into Airport (airport_name, country, state, city, created_at) values ('Minden-Tahoe Airport', 'Canada', 'Québec', 'Saint-Joseph-de-Coleraine', '2023-10-08');
insert into Airport (airport_name, country, state, city, created_at) values ('Bocas Del Toro International Airport', 'China', null, 'Si’en', '2022-11-10');
insert into Airport (airport_name, country, state, city, created_at) values ('Itacoatiara Airport', 'Czech Republic', null, 'Dolní Cerekev', '2023-09-15');
insert into Airport (airport_name, country, state, city, created_at) values ('Arnold Air Force Base', 'Sri Lanka', null, 'Welisara', '2023-01-10');
insert into Airport (airport_name, country, state, city, created_at) values ('Manners Creek Airport', 'the Grenadines', null, 'Port Elizabeth', '2022-12-09');
insert into Airport (airport_name, country, state, city, created_at) values ('Brevig Mission Airport', 'Russia', null, 'Peterhof', '2023-07-23');
insert into Airport (airport_name, country, state, city, created_at) values ('General International Airport', 'Argentina', null, 'Chavarría', '2023-08-30');
insert into Airport (airport_name, country, state, city, created_at) values ('Craig Cove Airport', 'Russia', null, 'Omutninsk', '2022-12-24');
insert into Airport (airport_name, country, state, city, created_at) values ('Chesterfield Inlet Airport', 'Czech Republic', null, 'Malé Svatoňovice', '2022-12-12');
insert into Airport (airport_name, country, state, city, created_at) values ('Rafaï Airport', 'Iceland', null, 'Stykkishólmur', '2023-03-31');

TRUNCATE TABLE Passengers;

insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Lucien', 'Pepon', '2004-01-16', 'Non-binary', 'Bosnia and Herzegovina', 'Portugal', 473917714, '2023-12-23', '2024-05-23');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Derrick', 'Clohissy', '2003-12-06', 'Male', 'Niger', 'Brazil', 318383379, '2024-08-04', '2024-06-21');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Darcie', 'Rigeby', '2001-07-01', 'Female', 'Czech Republic', 'Mexico', 686126494, '2024-05-22', '2023-10-17');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Nonnah', 'Codi', '2003-08-21', 'Female', 'China', 'Guatemala', 182028099, '2024-03-11', '2024-09-23');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Elsinore', 'Luciano', '2004-05-14', 'Female', 'Indonesia', 'Indonesia', 106017484, '2024-09-04', '2024-04-25');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Liv', 'Canham', '2003-11-20', 'Non-binary', 'China', 'France', 666793154, '2023-10-24', '2023-12-05');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Truman', 'Kohn', '2005-01-14', 'Male', 'Indonesia', 'Sweden', 779157229, '2024-02-21', '2023-10-21');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Avril', 'O''Cullinane', '2002-07-28', 'Female', 'France', 'China', 712296804, '2024-09-09', '2024-08-03');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Cristionna', 'Heineking', '2004-08-30', 'Female', 'Mongolia', 'China', 585884614, '2024-07-17', '2023-12-31');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Darrell', 'Teodorski', '2004-02-11', 'Male', 'China', 'Brazil', 985089749, '2024-01-22', '2024-07-25');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Scotty', 'MacFarlan', '2002-06-16', 'Male', 'China', 'China', 557892535, '2024-08-30', '2024-03-26');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Goldy', 'Parysowna', '2001-02-19', 'Female', 'China', 'North Korea', 198627711, '2024-04-22', '2024-05-02');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Maud', 'Allso', '2004-09-05', 'Female', 'Philippines', 'Slovenia', 493834598, '2024-08-05', '2024-07-31');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Eloise', 'Grimm', '2000-11-30', 'Genderqueer', 'Poland', 'United Arab Emirates', 847933301, '2024-05-15', '2024-07-27');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Wallace', 'Widd', '2003-10-19', 'Male', 'Sweden', 'Canada', 893637196, '2024-03-27', '2024-02-05');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Cris', 'Olliff', '2003-01-09', 'Female', 'Indonesia', 'Russia', 628525635, '2024-08-28', '2024-04-24');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Uriah', 'Gresswood', '2005-01-15', 'Male', 'China', 'Russia', 832692446, '2024-09-12', '2024-02-25');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Garnette', 'Hounsom', '2000-11-04', 'Female', 'China', 'China', 209634294, '2023-11-29', '2024-04-19');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Marcy', 'Halle', '2002-06-30', 'Female', 'Indonesia', 'Serbia', 315631295, '2024-08-07', '2024-06-30');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Gabi', 'Rattrie', '2004-05-12', 'Male', 'Russia', 'Indonesia', 210208132, '2024-06-11', '2024-02-06');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Hi', 'Biggadike', '2001-05-19', 'Male', 'Russia', 'Indonesia', 996694542, '2023-10-30', '2024-02-23');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Friedrich', 'Vaudre', '2002-07-06', 'Male', 'China', 'Indonesia', 407973512, '2024-07-08', '2024-06-14');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Zelig', 'Pettigree', '2000-10-28', 'Male', 'Colombia', 'Poland', 489663190, '2024-09-09', '2024-06-27');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Ondrea', 'Stoneham', '2004-12-11', 'Female', 'Japan', 'Brazil', 183595627, '2024-09-03', '2024-03-26');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Niki', 'Eversfield', '2002-07-22', 'Male', 'China', 'Poland', 696059786, '2024-09-16', '2024-07-09');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Tanney', 'Kike', '2002-12-21', 'Male', 'United States', 'Brazil', 764575153, '2024-06-15', '2024-04-15');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Godfree', 'De Ruggero', '2002-05-14', 'Male', 'Ireland', 'France', 201960244, '2024-02-20', '2024-07-31');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Dru', 'Tiddeman', '2004-11-26', 'Female', 'China', 'Central African Republic', 881772037, '2023-12-11', '2023-11-21');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Bliss', 'Ccomini', '2004-09-15', 'Female', 'Germany', 'Peru', 805868241, '2023-10-31', '2023-12-08');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Bridgette', 'Pervoe', '2001-08-09', 'Female', 'Guatemala', 'Philippines', 807525987, '2024-08-17', '2024-01-05');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Colan', 'Oulner', '2004-11-27', 'Male', 'Russia', 'Indonesia', 487016182, '2023-12-11', '2024-01-21');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Carmen', 'Albert', '2001-12-05', 'Female', 'China', 'Bulgaria', 542934762, '2023-11-27', '2024-10-04');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Una', 'Dunckley', '2002-02-25', 'Female', 'Philippines', 'Canada', 379640924, '2024-08-17', '2024-06-09');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Teresina', 'Aveyard', '2004-05-16', 'Female', 'China', 'Albania', 473964319, '2024-08-12', '2024-02-18');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Giavani', 'Christon', '2004-09-11', 'Male', 'Colombia', 'China', 915466159, '2024-01-25', '2024-06-25');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Emmey', 'Magrannell', '2003-10-24', 'Female', 'Japan', 'Uruguay', 693313990, '2024-07-05', '2024-09-17');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Charity', 'Ruhben', '2001-06-05', 'Genderfluid', 'United States', 'Palestinian Territory', 542260154, '2024-04-23', '2024-04-02');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Erinn', 'Yoseloff', '2005-02-04', 'Female', 'Mexico', 'Philippines', 523460382, '2024-08-06', '2024-04-16');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Sol', 'Valeri', '2004-07-06', 'Male', 'Canada', 'Poland', 881726776, '2024-06-17', '2024-07-01');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Mitzi', 'Deniseau', '2004-11-19', 'Female', 'Sweden', 'Philippines', 344666040, '2024-03-17', '2024-01-05');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Lorie', 'De la Yglesia', '2003-07-04', 'Genderfluid', 'Indonesia', 'Portugal', 502314107, '2023-12-22', '2024-02-27');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Alejandro', 'Revening', '2001-03-16', 'Male', 'Poland', 'China', 281984179, '2024-03-27', '2024-09-22');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Erma', 'Trippick', '2003-11-01', 'Female', 'Philippines', 'Honduras', 365144576, '2024-08-04', '2024-07-17');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Lucine', 'Philbrook', '2005-08-09', 'Genderqueer', 'Cameroon', 'Brazil', 322926091, '2024-07-22', '2024-01-26');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Jacquenetta', 'Mellmer', '2004-06-08', 'Female', 'Italy', 'Western Sahara', 756873760, '2024-03-27', '2024-05-28');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Merna', 'Coushe', '2001-06-10', 'Female', 'Peru', 'Norway', 719303757, '2024-03-10', '2023-11-05');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Cale', 'Tommasetti', '2005-03-17', 'Agender', 'Israel', 'Latvia', 365470452, '2024-03-17', '2024-07-17');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Melamie', 'Wakelam', '2004-08-17', 'Female', 'Sweden', 'Ivory Coast', 550895056, '2023-11-17', '2024-02-07');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Filberto', 'Marwood', '2001-08-29', 'Male', 'United States', 'China', 379648102, '2024-02-02', '2024-07-28');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Osborne', 'Vasyutin', '2004-09-13', 'Male', 'Cambodia', 'Vietnam', 126012184, '2024-03-15', '2024-05-04');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Kathy', 'Gersam', '2005-09-24', 'Female', 'Portugal', 'Philippines', 462749591, '2023-12-26', '2024-03-13');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Ulrick', 'Asey', '2005-06-01', 'Genderfluid', 'China', 'Indonesia', 668171151, '2023-12-20', '2023-12-19');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Mella', 'Tourner', '2004-07-23', 'Female', 'France', 'Brazil', 335263842, '2024-09-06', '2024-09-18');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Elyn', 'Spohrmann', '2002-05-05', 'Female', 'China', 'Serbia', 841773977, '2023-12-25', '2023-10-10');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Jeffry', 'Watkins', '2001-03-28', 'Male', 'Portugal', 'Brazil', 943496123, '2023-11-26', '2023-11-16');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Cassey', 'Escalero', '2001-06-14', 'Female', 'Pakistan', 'China', 359412270, '2024-04-23', '2024-06-10');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Sutton', 'Pulver', '2004-05-30', 'Male', 'Malta', 'Brazil', 548761486, '2024-04-18', '2024-09-30');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Hunt', 'Scatcher', '2001-01-09', 'Male', 'China', 'China', 375449964, '2024-02-01', '2024-02-03');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Guy', 'Lamacraft', '2001-11-30', 'Male', 'Albania', 'China', 404055638, '2024-01-04', '2023-11-12');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Jon', 'Kalisz', '2001-11-22', 'Male', 'China', 'Poland', 750747960, '2024-09-08', '2024-01-15');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Shellysheldon', 'Parbrook', '2003-09-10', 'Male', 'Mauritius', 'Kenya', 783517624, '2024-08-23', '2024-04-01');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Noach', 'Sedgeman', '2002-04-28', 'Male', 'Botswana', 'Indonesia', 608588263, '2023-10-23', '2023-12-14');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Terence', 'MacDermand', '2004-10-19', 'Male', 'South Africa', 'Brazil', 690201729, '2023-10-20', '2024-01-01');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Kirsten', 'Salan', '2000-10-14', 'Female', 'Indonesia', 'Colombia', 491499952, '2023-11-21', '2023-10-27');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Monika', 'Scorthorne', '2001-05-30', 'Female', 'Indonesia', 'Indonesia', 817213454, '2024-06-11', '2024-08-23');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Arnaldo', 'Blinkhorn', '2003-08-02', 'Male', 'China', 'Indonesia', 701381120, '2024-05-26', '2024-08-09');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Rheta', 'Moffett', '2005-06-18', 'Female', 'Chile', 'China', 237398410, '2024-03-19', '2024-02-25');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Colly', 'Heam', '2002-01-24', 'Female', 'Philippines', 'Haiti', 207709452, '2024-10-04', '2024-05-05');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Randene', 'Wattisham', '2002-03-10', 'Female', 'China', 'China', 735996679, '2024-01-02', '2024-04-04');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Gilligan', 'Cripin', '2002-09-10', 'Female', 'France', 'Indonesia', 969046867, '2024-01-13', '2024-07-02');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Rolf', 'Tindley', '2004-05-11', 'Male', 'China', 'Cambodia', 792125879, '2024-05-25', '2024-03-01');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Abran', 'Roumier', '2001-04-23', 'Agender', 'Haiti', 'Thailand', 369143186, '2024-02-01', '2024-07-26');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Waverly', 'Laxson', '2004-04-24', 'Male', 'Jamaica', 'Guatemala', 729608242, '2024-09-25', '2024-01-28');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Trey', 'D''Ambrogio', '2001-07-04', 'Male', 'Albania', 'Poland', 842170073, '2024-03-03', '2024-09-20');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Holt', 'Longland', '2001-07-06', 'Male', 'Estonia', 'Portugal', 206759514, '2024-09-18', '2024-03-14');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Minerva', 'Ferrini', '2002-12-23', 'Female', 'China', 'Czech Republic', 413554347, '2023-10-31', '2024-03-06');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Jeannette', 'Collinge', '2003-05-21', 'Female', 'Indonesia', 'China', 209525161, '2024-05-27', '2024-05-13');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Wallie', 'Vaughan-Hughes', '2002-01-07', 'Female', 'Russia', 'Libya', 886331774, '2024-02-17', '2024-04-17');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Allistir', 'Doag', '2001-09-20', 'Male', 'Indonesia', 'Indonesia', 609904935, '2024-07-28', '2024-01-18');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Gerardo', 'Bernath', '2004-11-27', 'Male', 'Peru', 'Brazil', 161191856, '2023-12-17', '2024-04-17');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Winona', 'Clench', '2002-02-25', 'Female', 'Indonesia', 'China', 163646727, '2024-04-15', '2023-12-01');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Kellsie', 'Boys', '2004-07-01', 'Female', 'China', 'China', 248480195, '2024-02-18', '2024-05-22');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Cherlyn', 'Dwelley', '2001-10-26', 'Female', 'Indonesia', 'Portugal', 388003734, '2024-01-13', '2024-03-18');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Wiatt', 'Cattermoul', '2003-07-19', 'Male', 'Norway', 'China', 261401600, '2024-07-14', '2024-05-04');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Nevins', 'Dionsetti', '2001-07-23', 'Male', 'Russia', 'Croatia', 736044089, '2024-04-23', '2024-05-03');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Dannel', 'Jacmar', '2005-07-11', 'Male', 'Czech Republic', 'China', 497223002, '2024-07-22', '2023-10-13');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Kinna', 'Cawston', '2005-04-25', 'Female', 'Brazil', 'Pakistan', 151649939, '2024-06-04', '2024-07-07');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Nicholle', 'Vayro', '2002-11-29', 'Female', 'Philippines', 'Nigeria', 392765307, '2024-09-26', '2023-10-12');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Jere', 'Hand', '2002-08-08', 'Male', 'Philippines', 'Cyprus', 935518362, '2024-09-19', '2024-03-21');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Inness', 'Gouldsmith', '2003-09-03', 'Male', 'China', 'China', 620060756, '2023-11-27', '2024-10-04');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Delphinia', 'Hause', '2003-05-20', 'Female', 'Guatemala', 'Indonesia', 854887120, '2024-05-04', '2023-12-11');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Pascal', 'Easun', '2005-07-15', 'Non-binary', 'South Korea', 'Cuba', 436314608, '2023-11-20', '2024-02-26');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Gisele', 'Lindeboom', '2001-07-31', 'Female', 'Poland', 'France', 993476346, '2023-10-20', '2024-01-29');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Robb', 'Baseggio', '2001-10-22', 'Male', 'Indonesia', 'China', 526182124, '2024-09-24', '2024-02-23');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Gasper', 'Fetherston', '2005-05-22', 'Male', 'France', 'Portugal', 103826361, '2024-03-08', '2024-02-28');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Vaughan', 'Carnall', '2004-02-06', 'Male', 'Portugal', 'Philippines', 961014776, '2024-03-16', '2023-11-17');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Jaquelyn', 'Leamon', '2001-01-16', 'Female', 'Uruguay', 'Brazil', 966251124, '2023-11-26', '2024-03-21');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Goldina', 'Athridge', '2002-06-02', 'Female', 'Lithuania', 'Palestinian Territory', 273394056, '2024-07-21', '2023-12-02');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Vale', 'Dionsetti', '2005-03-26', 'Male', 'Philippines', 'Kazakhstan', 597821633, '2024-02-10', '2023-12-05');
insert into Passengers (first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values ('Xylia', 'Tunaclift', '2001-04-10', 'Female', 'Bosnia and Herzegovina', 'Indonesia', 522355691, '2024-02-10', '2024-02-01');

insert into Airline (airline_code, airline_name, airline_country, created_at) values ('0603-5338', 'Connelly and Sons', 'Kyrgyzstan', '2024-09-23');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('56062-485', 'Bailey LLC', 'Indonesia', '2024-09-05');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('63174-214', 'Monahan, Luettgen and Stanton', 'Poland', '2023-10-22');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('46122-026', 'Stracke, Terry and Bogan', 'Indonesia', '2024-05-05');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('60927-116', 'Armstrong-Muller', 'Bulgaria', '2024-07-08');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('59779-329', 'McKenzie, Kling and Lindgren', 'China', '2024-02-17');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('35781-0194', 'Rippin, Marvin and Monahan', 'Netherlands', '2024-06-21');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('54868-5865', 'Torp-Watsica', 'Sweden', '2023-10-22');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('68382-196', 'Stiedemann Inc', 'Argentina', '2024-01-10');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('53208-503', 'Macejkovic, Ward and Schoen', 'Indonesia', '2024-07-07');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('54575-225', 'Labadie Group', 'Philippines', '2024-07-22');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('67457-522', 'Hudson, Hickle and Hessel', 'Colombia', '2024-06-29');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('63629-5202', 'Gutmann-O''Keefe', 'Indonesia', '2023-12-11');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('0527-1355', 'Gutkowski Group', 'Indonesia', '2024-02-21');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('43478-902', 'Kassulke, Abbott and Olson', 'Palestinian Territory', '2024-04-30');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('52125-224', 'McClure-Kohler', 'Philippines', '2024-08-01');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('37808-092', 'Romaguera, Yundt and Hartmann', 'Cuba', '2024-08-29');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('49781-045', 'Sipes, Kunde and Gusikowski', 'France', '2023-10-15');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('0781-9326', 'Kessler-Prosacco', 'Indonesia', '2024-01-07');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('16590-187', 'Grant, Walker and Pfeffer', 'China', '2024-06-09');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('55714-2245', 'Reichel Group', 'Poland', '2023-11-28');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('55910-006', 'Bruen-Lockman', 'Poland', '2024-05-25');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('11673-812', 'Roberts-Wiegand', 'China', '2024-02-24');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('65862-470', 'Parker Group', 'China', '2023-10-11');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('0615-7568', 'Hayes, Blanda and Hartmann', 'Belarus', '2024-01-12');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('0472-1262', 'Kilback Inc', 'Serbia', '2023-11-22');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('10191-1844', 'Kessler LLC', 'Russia', '2024-05-14');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('37012-340', 'Wilderman, Wyman and Powlowski', 'France', '2024-04-15');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('37012-588', 'Paucek, Mitchell and Gleason', 'Thailand', '2023-12-09');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('61919-012', 'Jast and Sons', 'Japan', '2023-11-12');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('21695-850', 'Wilderman-Heathcote', 'China', '2024-06-08');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('36987-2661', 'Waters Inc', 'Sweden', '2024-03-15');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('65923-136', 'DuBuque, Donnelly and Nader', 'Portugal', '2023-10-12');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('57520-0268', 'Skiles, Carroll and Bednar', 'Portugal', '2024-05-21');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('76237-138', 'Muller Inc', 'Sri Lanka', '2024-03-26');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('59535-8901', 'Schuster-Kemmer', 'China', '2024-07-26');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('16714-421', 'Bayer LLC', 'Colombia', '2023-11-05');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('68258-7049', 'Rau, Walter and O''Reilly', 'Japan', '2024-02-18');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('65862-210', 'Doyle, Paucek and Sawayn', 'Thailand', '2024-02-09');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('49358-541', 'Hoeger-Fisher', 'Israel', '2024-10-02');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('0228-2076', 'Orn, Haag and Lind', 'China', '2023-10-24');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('61748-017', 'Brakus-Koepp', 'China', '2023-10-13');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('59746-334', 'Rath, Armstrong and Kertzmann', 'Philippines', '2024-03-02');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('50383-959', 'Torphy-Jacobi', 'Palestinian Territory', '2023-11-15');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('0093-0892', 'Predovic-Ebert', 'Nigeria', '2024-02-07');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('61912-103', 'Cummerata Group', 'Spain', '2024-02-16');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('68428-739', 'Wuckert Inc', 'China', '2024-04-30');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('68210-0102', 'Robel Group', 'China', '2024-05-24');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('0093-5512', 'Weissnat Inc', 'Indonesia', '2024-08-19');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('0378-0218', 'Jenkins Group', 'China', '2024-07-02');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('64679-744', 'Lakin, Block and Prohaska', 'Indonesia', '2023-10-29');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('36987-2627', 'Christiansen and Sons', 'China', '2024-02-08');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('59779-433', 'Nikolaus-Bernhard', 'China', '2024-05-01');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('45861-006', 'Schaden, Shields and Bode', 'Nigeria', '2023-11-18');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('63629-1605', 'Cassin, Baumbach and Dickinson', 'Sweden', '2023-10-09');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('68645-202', 'Heidenreich Inc', 'Iraq', '2024-03-01');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('55289-523', 'Friesen-Klocko', 'Philippines', '2024-05-17');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('52371-200', 'Bradtke, O''Conner and Klein', 'Indonesia', '2024-10-04');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('0363-0080', 'Nader-Anderson', 'Philippines', '2024-05-05');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('0185-0140', 'Altenwerth, Ruecker and Rippin', 'France', '2023-12-18');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('54575-437', 'Herman-Gislason', 'China', '2024-05-03');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('51389-122', 'Brown-Stark', 'Russia', '2024-04-10');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('60758-188', 'Howe-Jacobs', 'Indonesia', '2024-08-19');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('54723-150', 'Terry, Gusikowski and Lang', 'Peru', '2023-11-25');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('67668-162', 'Glover and Sons', 'Greece', '2024-04-11');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('51270-113', 'Collier, Turcotte and Crist', 'China', '2024-04-03');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('21695-537', 'Lemke, Collier and Jaskolski', 'Sweden', '2024-09-30');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('68169-0049', 'Fay-Schinner', 'Vietnam', '2023-11-06');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('49557-572', 'Okuneva-Howell', 'American Samoa', '2024-08-24');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('17714-009', 'Kuvalis-Bednar', 'China', '2024-10-02');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('61010-3200', 'Lebsack-DuBuque', 'Sweden', '2023-11-06');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('60681-0105', 'Heathcote, Streich and Altenwerth', 'Belarus', '2024-03-14');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('54868-4759', 'Dare, Crooks and Russel', 'Sweden', '2023-10-14');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('55154-5436', 'Homenick, Casper and Toy', 'China', '2024-10-04');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('0548-5633', 'Gulgowski-Rutherford', 'Poland', '2024-03-27');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('49288-0665', 'Boyle, Bins and Langosh', 'China', '2024-03-13');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('59572-405', 'Champlin Group', 'France', '2024-05-09');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('55154-5980', 'Roob-Bayer', 'China', '2024-01-31');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('35356-950', 'Halvorson, Hansen and Simonis', 'Indonesia', '2024-03-21');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('0904-6099', 'Reichel-Wunsch', 'China', '2024-07-24');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('55289-624', 'Hyatt, Kihn and Bartoletti', 'Morocco', '2024-06-04');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('67457-592', 'Jacobson Inc', 'Myanmar', '2024-01-26');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('21695-714', 'McClure-Quigley', 'France', '2024-04-18');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('49955-100', 'Wolff-Ernser', 'Dominican Republic', '2024-09-14');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('0409-4179', 'Legros, Witting and Bernhard', 'Czech Republic', '2023-12-18');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('49991-001', 'Rogahn, Jacobi and Rohan', 'Thailand', '2024-04-25');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('68180-381', 'Baumbach and Sons', 'Sweden', '2024-07-01');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('36987-2466', 'Adams LLC', 'Costa Rica', '2024-01-30');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('54973-2955', 'Collier, Spinka and Halvorson', 'Philippines', '2024-02-06');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('12634-687', 'Considine-DuBuque', 'Cuba', '2024-05-11');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('68258-8922', 'Boyer, Macejkovic and Wuckert', 'Australia', '2024-08-23');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('52125-448', 'Kuvalis-Wiza', 'Russia', '2024-07-09');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('0832-0511', 'Cronin LLC', 'Philippines', '2024-09-03');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('75990-221', 'McClure and Sons', 'Thailand', '2024-08-20');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('13537-004', 'MacGyver and Sons', 'Indonesia', '2024-08-03');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('31645-158', 'Nitzsche-Lockman', 'Indonesia', '2024-06-03');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('49035-520', 'Kshlerin, Gutkowski and Fritsch', 'Russia', '2024-09-12');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('53645-1250', 'Schultz Group', 'Afghanistan', '2024-06-25');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('0068-0021', 'Breitenberg-Moen', 'Sweden', '2024-09-11');
insert into Airline (airline_code, airline_name, airline_country, created_at) values ('57664-263', 'Wolf-Runolfsson', 'Syria', '2024-08-29');

insert into Security_check (check_result, created_at, passenger_id) values (true, '2023-10-19', 55);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-07-01', 86);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2023-11-25', 57);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-08-21', 49);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-02-18', 16);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-04-13', 98);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2023-12-17', 65);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-01-07', 64);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2023-12-22', 97);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2023-10-31', 56);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-03-16', 95);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-06-07', 73);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-02-23', 22);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-07-02', 83);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-07-08', 28);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-02-18', 63);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-05-13', 5);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-07-05', 43);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2023-10-18', 84);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-08-23', 59);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2023-12-02', 90);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-07-14', 16);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-05-31', 57);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-07-05', 85);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-08-22', 52);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2023-12-13', 48);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-02-26', 10);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-07-28', 41);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-05-02', 13);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2023-11-17', 90);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-03-20', 58);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2023-10-18', 10);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-08-08', 29);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-08-18', 69);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-06-02', 5);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2023-12-20', 87);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2023-12-08', 36);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-09-09', 94);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-08-04', 25);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-03-10', 80);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-08-04', 37);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-09-01', 99);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-01-08', 93);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-05-10', 87);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-08-30', 81);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-02-16', 20);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2023-11-15', 69);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-08-04', 92);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2023-11-05', 12);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2023-11-26', 34);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-06-23', 8);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2023-11-20', 21);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-08-07', 71);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-05-13', 19);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-02-28', 44);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2023-12-04', 90);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-04-16', 79);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-02-01', 37);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-07-15', 16);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2023-11-04', 56);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2023-11-06', 88);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2023-10-30', 69);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-09-11', 99);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2023-11-18', 72);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2023-12-19', 64);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-02-08', 39);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-02-25', 42);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-05-08', 93);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-09-29', 46);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-02-25', 50);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-07-28', 70);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-04-06', 88);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-09-17', 16);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-02-28', 19);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-05-17', 99);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-09-18', 45);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-05-15', 16);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-07-06', 69);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-05-29', 47);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2023-10-08', 32);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-04-07', 89);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-02-17', 94);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-06-01', 29);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-05-07', 88);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-02-10', 54);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-03-23', 8);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-04-01', 60);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-01-21', 61);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-09-22', 78);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-01-16', 100);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2023-12-28', 2);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-06-11', 14);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-08-21', 42);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-08-24', 79);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-06-28', 22);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-04-26', 6);
insert into Security_check (check_result, created_at, passenger_id) values (true, '2024-08-21', 81);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-07-29', 40);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2024-01-07', 27);
insert into Security_check (check_result, created_at, passenger_id) values (false, '2023-10-08', 51);

insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2023-11-13', '2024-08-12', 91, 16, 43, '2023-06-11');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-05-29', '2024-04-16', 34, 92, 98, '2023-07-04');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-05-01', '2024-03-21', 34, 34, 96, '2023-09-28');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-09-22', '2024-07-12', 7, 37, 25, '2023-09-20');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-07-22', '2024-10-08', 57, 82, 51, '2023-06-27');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-04-28', '2023-12-25', 24, 76, 93, '2023-08-10');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-03-03', '2023-12-30', 73, 67, 75, '2022-12-31');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2023-12-03', '2024-09-20', 13, 50, 8, '2022-12-17');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-03-07', '2023-12-19', 60, 56, 19, '2023-07-28');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-08-26', '2024-02-02', 88, 35, 42, '2022-10-19');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-06-18', '2024-02-16', 4, 25, 60, '2023-07-11');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-03-01', '2024-07-22', 3, 16, 2, '2023-04-19');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-08-26', '2023-12-13', 66, 6, 87, '2023-01-10');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2023-11-23', '2023-11-29', 4, 65, 11, '2022-11-06');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-01-25', '2024-03-28', 90, 45, 58, '2023-03-04');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-08-07', '2024-06-24', 23, 15, 13, '2023-01-28');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-04-01', '2024-03-10', 55, 26, 45, '2023-09-15');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-08-11', '2024-06-20', 64, 78, 51, '2023-07-20');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-04-12', '2023-12-31', 44, 72, 71, '2023-03-21');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-06-03', '2024-08-18', 95, 38, 37, '2023-08-07');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-08-03', '2024-09-26', 98, 72, 46, '2023-09-16');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-02-10', '2024-01-24', 75, 40, 36, '2023-04-05');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-01-20', '2023-12-04', 16, 87, 65, '2022-10-31');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-05-24', '2023-12-07', 1, 73, 31, '2023-07-13');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2023-11-30', '2024-03-02', 45, 4, 26, '2023-04-29');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2023-12-03', '2024-03-20', 76, 38, 66, '2023-02-19');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-02-19', '2024-01-05', 47, 38, 47, '2022-12-17');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-08-09', '2024-05-04', 65, 53, 72, '2023-03-20');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-02-01', '2023-11-23', 91, 19, 46, '2023-05-20');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2023-10-11', '2024-08-03', 5, 11, 99, '2023-10-06');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2023-11-06', '2023-12-10', 4, 35, 99, '2023-02-17');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2023-11-26', '2023-12-12', 52, 55, 57, '2023-08-11');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2023-11-28', '2023-10-30', 58, 66, 100, '2023-04-07');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-05-26', '2024-05-09', 74, 55, 79, '2023-01-23');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-03-08', '2024-03-20', 61, 71, 19, '2023-05-17');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-09-25', '2024-01-25', 66, 4, 13, '2023-07-10');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-08-08', '2023-12-03', 7, 15, 20, '2023-01-10');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-05-18', '2024-08-18', 62, 12, 79, '2023-06-03');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-01-12', '2024-06-13', 66, 11, 56, '2023-09-14');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2023-12-21', '2024-06-07', 96, 46, 9, '2023-06-15');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-05-22', '2023-12-09', 80, 44, 20, '2023-05-02');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-09-05', '2024-06-16', 19, 19, 2, '2023-09-05');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2023-11-01', '2024-02-07', 68, 31, 25, '2023-01-07');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-05-15', '2024-06-25', 70, 30, 29, '2023-03-30');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-08-05', '2023-12-26', 73, 47, 56, '2023-02-04');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-03-01', '2024-06-25', 80, 7, 34, '2022-10-24');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-02-02', '2024-01-13', 3, 92, 65, '2023-08-07');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-08-17', '2024-03-14', 47, 98, 78, '2022-12-29');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-02-20', '2024-09-29', 32, 45, 90, '2023-01-10');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-01-05', '2024-06-02', 50, 15, 67, '2023-07-22');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-07-17', '2024-05-17', 90, 15, 12, '2022-10-27');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-03-20', '2023-11-26', 40, 78, 77, '2023-08-05');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-09-07', '2024-06-21', 51, 21, 73, '2022-10-31');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2023-11-24', '2023-11-25', 16, 38, 75, '2023-07-14');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2023-12-08', '2023-11-07', 66, 6, 79, '2023-09-10');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-04-01', '2024-04-16', 23, 78, 43, '2023-07-17');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-06-25', '2023-12-30', 30, 22, 80, '2023-04-02');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2023-12-24', '2024-07-17', 23, 43, 2, '2023-05-07');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2023-11-16', '2024-05-22', 20, 72, 56, '2023-05-05');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2023-10-12', '2024-09-26', 96, 37, 53, '2023-08-22');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-05-06', '2024-06-14', 5, 61, 98, '2023-03-19');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-02-03', '2024-01-04', 17, 50, 40, '2023-02-19');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2023-12-09', '2024-06-07', 91, 46, 83, '2023-09-19');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-05-25', '2024-03-31', 32, 4, 92, '2023-02-28');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2023-11-29', '2024-05-02', 84, 81, 96, '2023-06-23');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-02-04', '2024-03-22', 22, 11, 13, '2023-08-01');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2023-11-02', '2024-06-22', 77, 74, 31, '2023-07-17');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-03-01', '2024-04-22', 18, 49, 97, '2023-03-11');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2023-10-10', '2024-08-02', 30, 88, 54, '2023-09-04');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2023-11-04', '2024-04-13', 68, 32, 30, '2023-03-20');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-06-20', '2024-01-14', 19, 40, 22, '2022-12-21');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-08-07', '2024-09-13', 53, 58, 15, '2023-04-05');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-09-06', '2024-04-15', 46, 99, 56, '2023-04-14');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-04-15', '2024-07-28', 13, 5, 24, '2023-07-18');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-08-01', '2024-07-29', 57, 6, 72, '2023-06-24');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-03-01', '2024-06-23', 23, 66, 13, '2023-07-29');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-05-20', '2024-07-23', 88, 40, 82, '2023-02-07');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2023-11-20', '2023-10-18', 34, 44, 90, '2022-11-23');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-02-17', '2024-01-23', 37, 70, 29, '2023-06-06');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-01-23', '2023-10-09', 91, 3, 78, '2023-06-29');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-04-27', '2024-09-29', 41, 44, 18, '2022-12-26');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-09-05', '2024-03-27', 43, 97, 31, '2023-04-15');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-01-23', '2023-11-10', 85, 91, 88, '2022-11-04');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-03-02', '2024-07-18', 6, 68, 89, '2022-11-14');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-07-05', '2024-06-16', 84, 85, 66, '2023-07-01');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-01-24', '2024-05-11', 96, 99, 16, '2022-10-24');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2023-10-12', '2024-09-08', 19, 98, 53, '2023-06-13');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2023-12-14', '2024-01-18', 87, 55, 5, '2022-11-17');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-06-29', '2024-02-02', 86, 54, 56, '2023-02-07');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-02-11', '2023-11-29', 31, 35, 27, '2023-07-12');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-07-28', '2023-12-01', 85, 73, 77, '2023-07-31');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-01-02', '2023-12-03', 53, 96, 15, '2023-10-07');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-04-08', '2024-08-28', 63, 74, 66, '2023-02-18');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-08-26', '2023-10-28', 58, 8, 93, '2023-04-20');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-09-19', '2023-12-13', 41, 99, 42, '2023-03-20');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-04-26', '2023-12-24', 95, 29, 25, '2023-04-22');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-09-10', '2024-02-26', 87, 57, 68, '2023-05-18');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2023-12-18', '2024-07-22', 49, 25, 90, '2023-04-26');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-03-13', '2024-09-10', 48, 20, 15, '2022-11-17');
insert into Flights (sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id, airline_id, created_at) values ('2024-02-22', '2023-10-13', 97, 84, 60, '2023-02-03');

insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (12, 27, 'Booking.com', 1, '2024-10-02', '2024-04-25', 'confirmed', 23954.71);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (19, 85, 'Hotels.com', 2, '2023-12-09', '2023-10-20', 'completed', 55981.35);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (26, 78, 'Agoda', 3, '2024-06-23', '2024-04-08', 'confirmed', 16558.53);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (11, 19, 'Hotels.com', 4, '2024-01-21', '2024-04-17', 'completed', 58999.29);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (17, 8, 'Booking.com', 5, '2024-01-31', '2024-05-14', 'cancelled', 18221.41);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (7, 56, 'Airbnb', 6, '2024-07-27', '2024-03-29', 'pending', 31326.94);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (19, 87, 'Expedia', 7, '2024-08-31', '2024-07-14', 'cancelled', 34533.04);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (6, 76, 'Hotels.com', 8, '2024-03-01', '2023-10-20', 'cancelled', 41909.65);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (30, 27, 'Expedia', 9, '2024-06-27', '2024-09-02', 'cancelled', 45261.93);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (21, 1, 'Booking.com', 10, '2024-07-09', '2023-11-17', 'cancelled', 69903.5);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (30, 17, 'Expedia', 11, '2024-03-27', '2024-08-03', 'pending', 14787.67);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (4, 13, 'Hotels.com', 12, '2023-12-06', '2024-06-28', 'completed', 51198.29);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (28, 28, 'Expedia', 13, '2024-05-28', '2023-11-26', 'completed', 11707.17);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (26, 54, 'Expedia', 14, '2024-04-05', '2024-02-12', 'pending', 28252.57);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (26, 72, 'Hotels.com', 15, '2023-11-26', '2024-07-01', 'pending', 66169.38);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (22, 84, 'Hotels.com', 16, '2024-04-03', '2024-09-17', 'completed', 51490.64);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (10, 72, 'Agoda', 17, '2024-09-02', '2023-12-29', 'completed', 12764.7);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (30, 31, 'Booking.com', 18, '2024-06-03', '2023-10-20', 'cancelled', 64562.61);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (6, 91, 'Booking.com', 19, '2024-01-20', '2024-06-15', 'pending', 63341.17);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (9, 84, 'Expedia', 20, '2024-08-29', '2024-08-25', 'pending', 14663.27);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (30, 28, 'Hotels.com', 21, '2024-07-04', '2024-08-11', 'confirmed', 18250.94);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (6, 62, 'Booking.com', 22, '2024-09-21', '2024-08-19', 'pending', 27159.22);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (28, 57, 'Hotels.com', 23, '2024-03-15', '2024-08-25', 'confirmed', 48885.72);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (17, 20, 'Hotels.com', 24, '2024-08-11', '2023-12-02', 'pending', 58478.45);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (17, 94, 'Hotels.com', 25, '2024-01-31', '2024-04-13', 'pending', 33491.92);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (22, 18, 'Agoda', 26, '2024-08-16', '2024-03-12', 'completed', 37946.58);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (2, 24, 'Booking.com', 27, '2024-08-08', '2024-03-02', 'confirmed', 29095.41);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (9, 64, 'Expedia', 28, '2023-11-25', '2024-08-16', 'confirmed', 59795.84);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (11, 39, 'Booking.com', 29, '2024-04-26', '2024-01-29', 'cancelled', 16255.56);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (1, 78, 'Booking.com', 30, '2024-01-30', '2023-10-21', 'confirmed', 44061.42);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (22, 32, 'Agoda', 31, '2023-11-20', '2024-06-25', 'completed', 64313.32);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (30, 70, 'Agoda', 32, '2024-06-12', '2023-11-19', 'confirmed', 30724.37);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (15, 48, 'Airbnb', 33, '2024-07-25', '2023-11-27', 'cancelled', 67111.97);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (21, 69, 'Airbnb', 34, '2024-08-20', '2024-07-05', 'confirmed', 16057.78);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (11, 88, 'Agoda', 35, '2024-09-21', '2024-04-29', 'completed', 40515.07);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (20, 61, 'Expedia', 36, '2024-01-30', '2024-01-07', 'cancelled', 59578.53);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (16, 18, 'Hotels.com', 37, '2024-05-25', '2024-05-02', 'completed', 32149.91);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (10, 19, 'Booking.com', 38, '2024-03-28', '2024-09-19', 'confirmed', 68484.49);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (2, 6, 'Booking.com', 39, '2024-07-05', '2023-11-09', 'pending', 67840.66);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (30, 51, 'Hotels.com', 40, '2024-04-19', '2024-01-05', 'cancelled', 11608.14);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (12, 93, 'Expedia', 41, '2024-09-29', '2024-07-27', 'confirmed', 69466.83);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (30, 27, 'Agoda', 42, '2024-01-27', '2024-01-07', 'confirmed', 24013.95);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (20, 26, 'Hotels.com', 43, '2023-12-04', '2024-01-06', 'pending', 62800.28);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (6, 19, 'Expedia', 44, '2024-01-26', '2023-10-18', 'completed', 64213.3);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (25, 18, 'Booking.com', 45, '2024-08-28', '2023-11-27', 'confirmed', 31553.23);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (8, 42, 'Hotels.com', 46, '2024-09-08', '2023-11-09', 'completed', 37528.54);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (29, 17, 'Agoda', 47, '2024-04-11', '2024-04-18', 'confirmed', 65813.82);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (19, 65, 'Booking.com', 48, '2024-03-04', '2023-10-27', 'cancelled', 65327.95);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (1, 5, 'Agoda', 49, '2024-02-09', '2023-12-20', 'pending', 61892.19);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (5, 45, 'Airbnb', 50, '2024-06-27', '2024-04-03', 'cancelled', 64056.98);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (24, 87, 'Agoda', 51, '2024-10-09', '2024-09-10', 'confirmed', 52057.05);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (15, 64, 'Expedia', 52, '2023-12-12', '2024-01-04', 'completed', 11011.39);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (11, 60, 'Hotels.com', 53, '2024-05-11', '2024-07-09', 'confirmed', 55867.99);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (26, 11, 'Airbnb', 54, '2024-08-13', '2023-11-12', 'completed', 25862.62);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (13, 44, 'Hotels.com', 55, '2024-03-29', '2024-06-22', 'completed', 31351.99);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (16, 48, 'Agoda', 56, '2023-11-21', '2024-09-22', 'confirmed', 19886.29);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (13, 12, 'Hotels.com', 57, '2023-11-01', '2024-09-19', 'cancelled', 16419.98);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (29, 98, 'Expedia', 58, '2024-05-18', '2024-07-26', 'cancelled', 39647.93);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (17, 93, 'Agoda', 59, '2024-04-14', '2024-03-03', 'pending', 14436.51);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (11, 40, 'Hotels.com', 60, '2024-07-25', '2024-01-10', 'completed', 38420.92);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (9, 8, 'Airbnb', 61, '2024-05-06', '2023-12-24', 'cancelled', 35515.16);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (4, 33, 'Airbnb', 62, '2023-10-25', '2024-09-27', 'completed', 53377.71);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (21, 60, 'Expedia', 63, '2023-12-15', '2024-02-28', 'confirmed', 50558.47);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (13, 11, 'Airbnb', 64, '2024-10-05', '2024-02-23', 'confirmed', 31077.23);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (3, 43, 'Booking.com', 65, '2024-10-01', '2024-10-08', 'cancelled', 24850.88);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (12, 5, 'Agoda', 66, '2024-04-24', '2024-02-19', 'cancelled', 51370.45);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (25, 40, 'Expedia', 67, '2024-08-12', '2024-09-26', 'completed', 28272.07);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (18, 95, 'Booking.com', 68, '2023-11-25', '2024-02-05', 'pending', 45772.25);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (14, 100, 'Expedia', 69, '2024-05-23', '2023-12-18', 'pending', 18368.82);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (24, 29, 'Airbnb', 70, '2024-02-01', '2024-09-14', 'pending', 14946.15);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (15, 8, 'Booking.com', 71, '2024-05-03', '2024-09-12', 'completed', 69143.35);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (27, 69, 'Agoda', 72, '2024-02-11', '2024-01-17', 'cancelled', 49205.41);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (9, 7, 'Hotels.com', 73, '2024-10-02', '2023-12-09', 'pending', 18660.91);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (19, 52, 'Expedia', 74, '2024-04-20', '2024-03-17', 'completed', 61988.47);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (11, 49, 'Hotels.com', 75, '2024-01-23', '2024-04-01', 'confirmed', 65359.2);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (24, 88, 'Agoda', 76, '2024-06-27', '2024-07-27', 'confirmed', 62059.58);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (4, 65, 'Hotels.com', 77, '2024-05-27', '2024-06-23', 'completed', 48979.18);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (22, 76, 'Agoda', 78, '2023-11-22', '2024-07-10', 'cancelled', 27278.11);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (5, 3, 'Hotels.com', 79, '2023-12-23', '2024-07-06', 'completed', 48096.39);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (10, 49, 'Agoda', 80, '2024-01-17', '2024-01-28', 'pending', 25727.87);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (10, 72, 'Airbnb', 81, '2024-08-11', '2024-04-07', 'pending', 37906.1);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (21, 40, 'Hotels.com', 82, '2024-02-09', '2024-06-17', 'completed', 34973.1);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (11, 30, 'Booking.com', 83, '2024-09-29', '2024-03-24', 'completed', 20572.24);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (16, 81, 'Agoda', 84, '2024-08-27', '2024-05-26', 'confirmed', 18664.06);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (29, 95, 'Airbnb', 85, '2024-03-11', '2024-07-01', 'completed', 56735.77);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (3, 56, 'Booking.com', 86, '2024-07-18', '2024-04-16', 'pending', 19090.78);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (6, 71, 'Expedia', 87, '2024-05-01', '2024-04-06', 'completed', 47490.89);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (26, 44, 'Hotels.com', 88, '2023-11-03', '2024-07-28', 'pending', 66597.04);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (4, 87, 'Hotels.com', 89, '2024-01-23', '2024-06-02', 'pending', 27932.87);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (10, 96, 'Hotels.com', 90, '2024-08-19', '2023-11-05', 'pending', 61503.4);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (29, 1, 'Airbnb', 91, '2024-07-01', '2024-05-07', 'cancelled', 54685.81);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (19, 38, 'Booking.com', 92, '2024-05-25', '2024-05-31', 'completed', 31500.8);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (21, 89, 'Expedia', 93, '2024-02-25', '2024-05-30', 'pending', 60834.63);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (16, 81, 'Booking.com', 94, '2024-07-01', '2024-06-11', 'cancelled', 56893.17);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (17, 93, 'Booking.com', 95, '2024-06-11', '2023-11-03', 'pending', 45621.16);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (23, 86, 'Agoda', 96, '2023-11-08', '2024-04-02', 'cancelled', 18362.87);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (8, 74, 'Hotels.com', 97, '2023-12-06', '2023-10-16', 'pending', 63199.85);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (8, 45, 'Expedia', 98, '2024-05-25', '2024-04-15', 'cancelled', 69294.44);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (20, 11, 'Hotels.com', 99, '2023-12-14', '2024-02-09', 'completed', 38814.48);
insert into Booking (flight_id, passenger_id, booking_platform, booking_id, created_at, updated_at, status, price) values (22, 69, 'Booking.com', 100, '2024-01-09', '2024-04-27', 'cancelled', 15785.65);

TRUNCATE TABLE Booking CASCADE;

insert into Baggage (weight_in_kg, created_at, booking_id) values (47, '2024-04-23', 53);
insert into Baggage (weight_in_kg, created_at, booking_id) values (30, '2024-03-23', 65);
insert into Baggage (weight_in_kg, created_at, booking_id) values (34, '2024-08-10', 31);
insert into Baggage (weight_in_kg, created_at, booking_id) values (22, '2024-01-13', 78);
insert into Baggage (weight_in_kg, created_at, booking_id) values (6, '2024-07-20', 91);
insert into Baggage (weight_in_kg, created_at, booking_id) values (43, '2024-06-25', 75);
insert into Baggage (weight_in_kg, created_at, booking_id) values (27, '2024-02-09', 27);
insert into Baggage (weight_in_kg, created_at, booking_id) values (10, '2024-07-12', 72);
insert into Baggage (weight_in_kg, created_at, booking_id) values (29, '2024-05-11', 90);
insert into Baggage (weight_in_kg, created_at, booking_id) values (10, '2023-11-14', 29);
insert into Baggage (weight_in_kg, created_at, booking_id) values (10, '2024-09-01', 13);
insert into Baggage (weight_in_kg, created_at, booking_id) values (2, '2024-03-20', 13);
insert into Baggage (weight_in_kg, created_at, booking_id) values (35, '2024-08-27', 56);
insert into Baggage (weight_in_kg, created_at, booking_id) values (13, '2024-02-27', 86);
insert into Baggage (weight_in_kg, created_at, booking_id) values (22, '2023-11-27', 34);
insert into Baggage (weight_in_kg, created_at, booking_id) values (32, '2024-07-01', 31);
insert into Baggage (weight_in_kg, created_at, booking_id) values (18, '2024-03-23', 48);
insert into Baggage (weight_in_kg, created_at, booking_id) values (13, '2024-05-06', 73);
insert into Baggage (weight_in_kg, created_at, booking_id) values (13, '2024-07-05', 20);
insert into Baggage (weight_in_kg, created_at, booking_id) values (9, '2024-07-13', 45);
insert into Baggage (weight_in_kg, created_at, booking_id) values (40, '2024-09-10', 65);
insert into Baggage (weight_in_kg, created_at, booking_id) values (25, '2024-03-04', 4);
insert into Baggage (weight_in_kg, created_at, booking_id) values (28, '2024-07-11', 42);
insert into Baggage (weight_in_kg, created_at, booking_id) values (9, '2024-01-14', 97);
insert into Baggage (weight_in_kg, created_at, booking_id) values (23, '2024-09-22', 87);
insert into Baggage (weight_in_kg, created_at, booking_id) values (37, '2023-10-26', 31);
insert into Baggage (weight_in_kg, created_at, booking_id) values (45, '2024-04-06', 51);
insert into Baggage (weight_in_kg, created_at, booking_id) values (24, '2024-09-29', 13);
insert into Baggage (weight_in_kg, created_at, booking_id) values (40, '2024-07-13', 7);
insert into Baggage (weight_in_kg, created_at, booking_id) values (36, '2024-05-26', 55);
insert into Baggage (weight_in_kg, created_at, booking_id) values (36, '2024-02-27', 47);
insert into Baggage (weight_in_kg, created_at, booking_id) values (41, '2024-06-02', 58);
insert into Baggage (weight_in_kg, created_at, booking_id) values (33, '2023-12-23', 32);
insert into Baggage (weight_in_kg, created_at, booking_id) values (18, '2024-03-28', 81);
insert into Baggage (weight_in_kg, created_at, booking_id) values (39, '2023-12-23', 61);
insert into Baggage (weight_in_kg, created_at, booking_id) values (38, '2024-08-16', 28);
insert into Baggage (weight_in_kg, created_at, booking_id) values (18, '2024-05-04', 46);
insert into Baggage (weight_in_kg, created_at, booking_id) values (1, '2024-06-04', 57);
insert into Baggage (weight_in_kg, created_at, booking_id) values (12, '2024-05-20', 19);
insert into Baggage (weight_in_kg, created_at, booking_id) values (23, '2024-03-10', 63);
insert into Baggage (weight_in_kg, created_at, booking_id) values (22, '2024-02-13', 43);
insert into Baggage (weight_in_kg, created_at, booking_id) values (21, '2023-10-19', 16);
insert into Baggage (weight_in_kg, created_at, booking_id) values (34, '2024-05-09', 62);
insert into Baggage (weight_in_kg, created_at, booking_id) values (50, '2024-06-24', 5);
insert into Baggage (weight_in_kg, created_at, booking_id) values (26, '2024-06-13', 98);
insert into Baggage (weight_in_kg, created_at, booking_id) values (15, '2024-08-18', 3);
insert into Baggage (weight_in_kg, created_at, booking_id) values (15, '2024-06-17', 21);
insert into Baggage (weight_in_kg, created_at, booking_id) values (19, '2024-09-03', 14);
insert into Baggage (weight_in_kg, created_at, booking_id) values (33, '2023-12-18', 27);
insert into Baggage (weight_in_kg, created_at, booking_id) values (2, '2023-10-11', 63);
insert into Baggage (weight_in_kg, created_at, booking_id) values (20, '2023-10-27', 80);
insert into Baggage (weight_in_kg, created_at, booking_id) values (9, '2024-07-04', 45);
insert into Baggage (weight_in_kg, created_at, booking_id) values (45, '2024-10-03', 97);
insert into Baggage (weight_in_kg, created_at, booking_id) values (12, '2023-12-01', 56);
insert into Baggage (weight_in_kg, created_at, booking_id) values (42, '2023-12-20', 41);
insert into Baggage (weight_in_kg, created_at, booking_id) values (22, '2024-03-04', 71);
insert into Baggage (weight_in_kg, created_at, booking_id) values (45, '2023-12-10', 74);
insert into Baggage (weight_in_kg, created_at, booking_id) values (7, '2024-07-22', 48);
insert into Baggage (weight_in_kg, created_at, booking_id) values (6, '2024-01-14', 73);
insert into Baggage (weight_in_kg, created_at, booking_id) values (23, '2024-02-04', 25);
insert into Baggage (weight_in_kg, created_at, booking_id) values (39, '2024-06-14', 91);
insert into Baggage (weight_in_kg, created_at, booking_id) values (41, '2024-01-06', 52);
insert into Baggage (weight_in_kg, created_at, booking_id) values (18, '2024-07-31', 68);
insert into Baggage (weight_in_kg, created_at, booking_id) values (3, '2023-11-16', 100);
insert into Baggage (weight_in_kg, created_at, booking_id) values (35, '2024-09-07', 45);
insert into Baggage (weight_in_kg, created_at, booking_id) values (8, '2023-12-06', 35);
insert into Baggage (weight_in_kg, created_at, booking_id) values (16, '2024-01-24', 61);
insert into Baggage (weight_in_kg, created_at, booking_id) values (21, '2024-09-02', 4);
insert into Baggage (weight_in_kg, created_at, booking_id) values (46, '2024-09-20', 66);
insert into Baggage (weight_in_kg, created_at, booking_id) values (28, '2023-10-21', 60);
insert into Baggage (weight_in_kg, created_at, booking_id) values (17, '2024-04-26', 7);
insert into Baggage (weight_in_kg, created_at, booking_id) values (14, '2024-05-19', 81);
insert into Baggage (weight_in_kg, created_at, booking_id) values (10, '2024-08-29', 35);
insert into Baggage (weight_in_kg, created_at, booking_id) values (42, '2024-01-19', 10);
insert into Baggage (weight_in_kg, created_at, booking_id) values (50, '2024-06-15', 25);
insert into Baggage (weight_in_kg, created_at, booking_id) values (40, '2024-01-13', 47);
insert into Baggage (weight_in_kg, created_at, booking_id) values (5, '2024-04-27', 53);
insert into Baggage (weight_in_kg, created_at, booking_id) values (13, '2023-12-14', 98);
insert into Baggage (weight_in_kg, created_at, booking_id) values (32, '2024-07-30', 33);
insert into Baggage (weight_in_kg, created_at, booking_id) values (45, '2024-06-28', 54);
insert into Baggage (weight_in_kg, created_at, booking_id) values (32, '2023-11-20', 5);
insert into Baggage (weight_in_kg, created_at, booking_id) values (33, '2023-12-15', 60);
insert into Baggage (weight_in_kg, created_at, booking_id) values (18, '2024-04-04', 66);
insert into Baggage (weight_in_kg, created_at, booking_id) values (14, '2024-03-08', 30);
insert into Baggage (weight_in_kg, created_at, booking_id) values (19, '2024-08-08', 50);
insert into Baggage (weight_in_kg, created_at, booking_id) values (46, '2024-06-22', 45);
insert into Baggage (weight_in_kg, created_at, booking_id) values (32, '2023-12-26', 50);
insert into Baggage (weight_in_kg, created_at, booking_id) values (38, '2024-08-19', 46);
insert into Baggage (weight_in_kg, created_at, booking_id) values (19, '2024-07-28', 60);
insert into Baggage (weight_in_kg, created_at, booking_id) values (50, '2024-05-02', 16);
insert into Baggage (weight_in_kg, created_at, booking_id) values (33, '2024-06-23', 30);
insert into Baggage (weight_in_kg, created_at, booking_id) values (13, '2023-11-24', 2);
insert into Baggage (weight_in_kg, created_at, booking_id) values (34, '2023-12-14', 75);
insert into Baggage (weight_in_kg, created_at, booking_id) values (31, '2023-10-21', 70);
insert into Baggage (weight_in_kg, created_at, booking_id) values (33, '2024-05-16', 83);
insert into Baggage (weight_in_kg, created_at, booking_id) values (17, '2023-11-26', 84);
insert into Baggage (weight_in_kg, created_at, booking_id) values (34, '2024-08-13', 8);
insert into Baggage (weight_in_kg, created_at, booking_id) values (9, '2024-06-05', 43);
insert into Baggage (weight_in_kg, created_at, booking_id) values (19, '2024-05-28', 52);
insert into Baggage (weight_in_kg, created_at, booking_id) values (35, '2024-08-01', 91);

SELECT *
FROM passengers
WHERE first_name = last_name;

SELECT DISTINCT last_name FROM Passengers;

SELECT * FROM Passengers
WHERE gender = 'Male' AND date_of_birth BETWEEN '1990-01-01' AND '2000-12-31';

SELECT * FROM Flights
JOIN Airport ON Flights.arriving_airport_id = Airport.airport_id
WHERE Airport.country = 'China';

SELECT first_name || ' ' || last_name AS full_name
     , AGE(CURRENT_DATE, date_of_birth) FROM Passengers
ORDER BY date_of_birth DESC
limit 1;
SELECT ticket_price FROM Booking;
DROP TABLE Baggage;

SELECT baggage_id, weight_in_kg FROM Baggage
WHERE weight_in_kg>25
ORDER BY weight_in_kg DESC
LIMIT 3;

SELECT booking_platform, min(price) AS Shrek FROM Booking
GROUP BY booking_platform;

SELECT first_name || ' ' || last_name AS full_name, AGE (CURRENT_DATE, Passengers.date_of_birth) FROM Passengers
ORDER BY date_of_birth DESC
LIMIT 1;
