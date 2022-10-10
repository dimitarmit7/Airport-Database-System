CREATE DATABASE Airport_Official;

USE  Airport_Official;

CREATE TABLE AIRPORT
(
a_id NUMERIC(3) NOT NULL CONSTRAINT a_id_pk PRIMARY KEY,
a_name VARCHAR(50),
a_city VARCHAR(50)

);

CREATE TABLE EMPLOYEE
(
e_id NUMERIC(4) IDENTITY NOT NULL,
a_id NUMERIC(3) NOT NULL REFERENCES AIRPORT(a_id),
e_name VARCHAR(100),
e_age NUMERIC(2),
e_job VARCHAR(500),
salary MONEY,
CONSTRAINT emp_a_id_pk PRIMARY KEY(e_id, a_id)
);

CREATE TABLE PASSENGER
(
p_id NUMERIC(5) IDENTITY NOT NULL CONSTRAINT p_id_pk PRIMARY KEY,
p_name VARCHAR(100),
p_email VARCHAR(50),
p_country VARCHAR(60),
);

CREATE TABLE FLIGHTS
(
flight_no VARCHAR(5) NOT NULL CONSTRAINT flight_no_pk PRIMARY KEY,
deprature_time VARCHAR(5), /*TIME*/
arrival_time VARCHAR(5), /*TIME*/
airport_name VARCHAR(50),
);

CREATE TABLE TICKETS
(
ticket_no NUMERIC(5) NOT NULL,
flight_no VARCHAR(5) NOT NULL REFERENCES FLIGHTS (flight_no),
p_id NUMERIC(5) NOT NULL REFERENCES PASSENGER(p_id),
departure_date DATE,
seat_no VARCHAR(3),
f_company VARCHAR(30),
p_name VARCHAR(100),
destination VARCHAR(40),
CONSTRAINT ticket_id_pk PRIMARY KEY(ticket_no, flight_no, p_id)
);

CREATE TABLE AIRLINES_COMPANY
(
ac_id NUMERIC(2) IDENTITY NOT NULL CONSTRAINT ac_id_pk PRIMARY KEY,
ac_name VARCHAR (50),
ac_country VARCHAR(60),
);

CREATE TABLE SERVES
(
e_id NUMERIC(4),
a_id NUMERIC(3),
type VARCHAR(50),
p_id NUMERIC(5) NOT NULL REFERENCES PASSENGER(p_id),
CONSTRAINT serves_id_fk FOREIGN KEY (e_id, a_id) REFERENCES EMPLOYEE(e_id, a_id),
CONSTRAINT serves_id_pk PRIMARY KEY(e_id, a_id, p_id)
);

CREATE TABLE PROVIDES
(
flight_no VARCHAR(5) NOT NULL REFERENCES FLIGHTS(flight_no),
ac_id NUMERIC(2) NOT NULL REFERENCES AIRLINES_COMPANY(ac_id)
CONSTRAINT provides_id_pk PRIMARY KEY(flight_no, ac_id)
);

CREATE TABLE CARRIES
(
flight_no VARCHAR(5) NOT NULL REFERENCES FLIGHTS(flight_no),
p_id NUMERIC(5) NOT NULL REFERENCES PASSENGER(p_id)
CONSTRAINT carries_id PRIMARY KEY(flight_no, p_id)
);

SELECT * FROM AIRPORT;
SELECT * FROM CARRIES;
SELECT * FROM PROVIDES;
SELECT * FROM EMPLOYEE;
SELECT * FROM AIRLINES_COMPANY;
SELECT * FROM FLIGHTS;
SELECT * FROM SERVES;
SELECT * FROM TICKETS;
SELECT * FROM PASSENGER;

INSERT INTO AIRPORT VALUES(306, 'St.Paul the Apostle','Ohrid');
INSERT INTO AIRPORT VALUES(524, 'Skopje International Airport','Skopje');
INSERT INTO AIRPORT VALUES(179, 'Nikola Tesla','Belgrade');
INSERT INTO AIRPORT VALUES(613, 'Miami International Airport', 'Miami');
INSERT INTO AIRPORT VALUES(715, 'Melbourne Airport', 'Melbourne');
INSERT INTO AIRPORT VALUES(638, 'Istanbul Airport', 'Istanbul');
INSERT INTO AIRPORT VALUES(356, 'Paris Charles de Gaulle Airport', 'Paris');
INSERT INTO AIRPORT VALUES(578, 'Dubai International Airport', 'Dubai');

INSERT INTO EMPLOYEE VALUES(306, 'Nikola Siljanoski', 36, 'Airline Ticket Agent', 700);
INSERT INTO EMPLOYEE VALUES(306, 'Marija Mileska', 24,'Avionics Technician', 1500);
INSERT INTO EMPLOYEE VALUES(715, 'Jerome Shawns', 45, 'Pilot', 4500);
INSERT INTO EMPLOYEE VALUES(306, 'Emanuela Mileska', 25,'Air Traffic Controller', 2000);
INSERT INTO EMPLOYEE VALUES(306, 'Mihaela Markuleska', 30,'Air Traffic Controller', 2000);
INSERT INTO EMPLOYEE VALUES(179, 'Andrija Trajkovic', 28, 'Air Traffic Controller', 2700);
INSERT INTO EMPLOYEE VALUES(179, 'Marina Veselinovic', 31, 'Airline Ticket Agent', 1700);
INSERT INTO EMPLOYEE VALUES(179, 'Ana Antic', 25, 'Passenger Service Agent', 1500);
INSERT INTO EMPLOYEE VALUES(524, 'Darko Nikoloski', 29, 'Airport Manager', 4000);
INSERT INTO EMPLOYEE VALUES(613, 'Helen O Connor', 32, 'Airport Manager',4800);
INSERT INTO EMPLOYEE VALUES(613, 'Amanda Rowland', 40, 'Air Traffic Controller', 2700);
INSERT INTO EMPLOYEE VALUES(715, 'Nick Zapta', 24, 'Airline Ticket Agent', 2560);
INSERT INTO EMPLOYEE VALUES(306, 'Leonid Nikoloski', 25,'Transportation Security Screener', 1000);
INSERT INTO EMPLOYEE VALUES(578, 'Abdul Rahman', 35, 'Airline Ticket Agent', 850);
INSERT INTO EMPLOYEE VALUES(578, 'Husnie Hamid', 24, 'Airport Manager', 2400);
INSERT INTO EMPLOYEE VALUES(578, 'Hadisa Ursus', 30, 'Transportation Security Screener',1200);
INSERT INTO EMPLOYEE VALUES(578, 'Aladin Rahman', 46, 'Airline Ticket Agent', 900);
INSERT INTO EMPLOYEE VALUES(578, 'Jair Muhau', 36, 'Airport Manager', 3000);
INSERT INTO EMPLOYEE VALUES(613, 'Sarah Smith', 26, 'Passenger Service Agent', 1350);
INSERT INTO EMPLOYEE VALUES(613, 'Mia Gerber', 28, 'Passenger Service Agent', 1700);
INSERT INTO EMPLOYEE VALUES(613, 'Marcus Johns', 29, 'Air Traffic Controller', 1960);
INSERT INTO EMPLOYEE VALUES(356, 'Pia Peters', 30, 'Airline Ticket Agent', 1900);
INSERT INTO EMPLOYEE VALUES(356, 'Susan Michel', 27, 'Passenger Service Agent', 1400);
INSERT INTO EMPLOYEE VALUES(356, 'Nicolia Ombre', 40, 'Avionics Technician', 1400);
INSERT INTO EMPLOYEE VALUES(356, 'Nicolia Michel', 37, 'Passenger Service Agent', 1400);
INSERT INTO EMPLOYEE VALUES(356, 'Laura Olive', 48, 'Transportation Security Screener', 1400);
INSERT INTO EMPLOYEE VALUES(356, 'Olivia Beths', 25, 'Airline Ticket Agent', 1400);
INSERT INTO EMPLOYEE VALUES(524, 'Nada Angeleska', 40 ,'Airline Ticket Agent', 890);
INSERT INTO EMPLOYEE VALUES(524, 'Jovan Meceski', 39, 'Passenger Service Agent', 1400);
INSERT INTO EMPLOYEE VALUES(524, 'Jovana Risteska', 43, 'Airport Manager', 2400);
INSERT INTO EMPLOYEE VALUES(524, 'Teodor Mihajloski', 28, 'Transportation Security Screener', 900);
INSERT INTO EMPLOYEE VALUES(524, 'Krste Naumoski', 37, 'Transportation Security Screener', 900);
INSERT INTO EMPLOYEE VALUES(524, 'Elena Jovanova', 28, 'Airline Ticket Agent', 1200);
INSERT INTO EMPLOYEE VALUES(179, 'Tamara Milanovic', 38, 'Airline Ticket Agent', 1300);
INSERT INTO EMPLOYEE VALUES(179, 'Petar Koncarevic', 30, 'Airline Ticket Agent', 1300);
INSERT INTO EMPLOYEE VALUES(179, 'Valentina Kovac', 30, 'Passenger Service Agent', 1500);
INSERT INTO EMPLOYEE VALUES(179, 'Stefan Matic', 26, 'Avionics Technician', 2500);
INSERT INTO EMPLOYEE VALUES(638, 'Azra Celen', 25, 'Air Traffic Controller', 2800);
INSERT INTO EMPLOYEE VALUES(638, 'Sumru Gjunesh', 45, 'Airline Ticket Agent', 1800);
INSERT INTO EMPLOYEE VALUES(638, 'Dzenk Celen', 28, 'Airport Manager', 3800);
INSERT INTO EMPLOYEE VALUES(638, 'Feride Tekin', 48, 'Passenger Service Agent', 1600);



INSERT INTO PASSENGER VALUES('Dimitar Mitrevski', 'dimitarmitrevski@yahoo.com', 'Macedonia');
INSERT INTO PASSENGER VALUES('Elena Trajkoska', 'ekitrajkoska@gmail.com', 'Macedonia');
INSERT INTO PASSENGER VALUES('Mia Johns', 'm_johns@yahoo.com', 'USA');
INSERT INTO PASSENGER VALUES('Michael Gray', 'm.gray@gmail.com', 'Canada');
INSERT INTO PASSENGER VALUES('Mahmud Orhan', 'mahmud_orhan@gmail.com', 'UAE');
INSERT INTO PASSENGER VALUES('Mike Delfino', 'mikedelfino@yahoo.com', 'Mexico');
INSERT INTO PASSENGER VALUES('Susan Mayer', 'susie.mayer@gmail.com', 'Germany');
INSERT INTO PASSENGER VALUES('Carlos Solis', 'soliscarlos@gmail.com', 'Spain');
INSERT INTO PASSENGER VALUES('Bree Van de Kamp', 'breevdk@gmail.com', 'The Netherlands');
INSERT INTO PASSENGER VALUES('Vanessa Williams', 'vanessawithv@yahoo.com', 'United Kingdom');
INSERT INTO PASSENGER VALUES('Norma John', 'norma.john@gmail.com', 'Finland');
INSERT INTO PASSENGER VALUES('Kristina Popovic', 'kikipopstar@yahoo.com', 'Serbia');
INSERT INTO PASSENGER VALUES('Rebeka Jankoska', 'rebela_jankoska@yahoo.com', 'Macedonia');
INSERT INTO PASSENGER VALUES('Silas Metzger', 'silas.metzger@gmail.com', 'Germany');
INSERT INTO PASSENGER VALUES('Sarah Pitt', 'sarah.pitt@gmail.com', 'Germany');
INSERT INTO PASSENGER VALUES('Kate Laurenson', 'kate_laurenson@yahoo.com', 'Germany');
INSERT INTO PASSENGER VALUES('Pia Linoda', 'pia_linoda@yahoo.com', 'France');
INSERT INTO PASSENGER VALUES('Sofia Richie', 'sofia_richie@yahoo.com', 'France');
INSERT INTO PASSENGER VALUES('Emanuel Macron', 'emanuel_macron@yahoo.com', 'France');
INSERT INTO PASSENGER VALUES('Hamid Abduli', 'hamid_abduli@yahoo.com', 'UAE');
INSERT INTO PASSENGER VALUES('Mohamed Hadid', 'mohamed_hadid@gmail.com', 'UAE');
INSERT INTO PASSENGER VALUES('Bella Hadid', 'bella_hadid@yahoo.com', 'USA');
INSERT INTO PASSENGER VALUES('Gigi Hadid', 'gigi.hadid@yahoo.com', 'USA');
INSERT INTO PASSENGER VALUES('Selena Gomez', 'selena_domez@yahoo.com', 'USA');
INSERT INTO PASSENGER VALUES('Angelina Davis', 'angelina.davis@gmail.com', 'UK');
INSERT INTO PASSENGER VALUES('Brent Riviera', 'brent.riviera@gmail.com', 'UK');
INSERT INTO PASSENGER VALUES('Eva Mendes', 'eva_mendes@gmail.com', 'UK');
INSERT INTO PASSENGER VALUES('Anne Heathaway', 'anne_heathaway@yahoo.com', 'Australia');
INSERT INTO PASSENGER VALUES('Nicolas Smith', 'nicolas.smith@yahoo.com', 'Australia');
INSERT INTO PASSENGER VALUES('Laura Henson', 'laura.henson@yahoo.com', 'Australia');
INSERT INTO PASSENGER VALUES('Sao Jeng', 'sao_jeng@yahoo.com', 'Japan');
INSERT INTO PASSENGER VALUES('Pijong Kjang', 'pijong_kjang@gmail.com', 'Japan');
INSERT INTO PASSENGER VALUES('Songjul Kadis', 'songlul_kadis@gmail.com', 'Turkey');
INSERT INTO PASSENGER VALUES('Jason Kolea', 'jason_kolea@yahoo.com', 'Japan');
INSERT INTO PASSENGER VALUES('Mert Gjunesh', 'mert.gjunesh@gmail.com', 'Turkey');
INSERT INTO PASSENGER VALUES('Miranda Kerr', 'miranda_kerr@yahoo.com', 'Canada');
INSERT INTO PASSENGER VALUES('Ramis Tekin', 'ramis.tekin@gmail.com', 'Turkey');
INSERT INTO PASSENGER VALUES('Kendal Jenner', 'kendal_jenner@yahoo.com', 'Canada');
INSERT INTO PASSENGER VALUES('Sassie Romerts', 'sassie_roberts@gmail.com', 'Australia');
INSERT INTO PASSENGER VALUES('Aliriza Tekin', 'aliriza_tekin@gmail.com', 'Turkey');
INSERT INTO PASSENGER VALUES('Anja Trzan', 'anja.trzan@gmail.com', 'Serbia');
INSERT INTO PASSENGER VALUES('Borko Ristovski', 'borko_ristovski@yahoo.com', 'Macedonia');
INSERT INTO PASSENGER VALUES('Jelena Tomasevic', 'jelena_tomasevic@yahoo.com', 'Serbia');
INSERT INTO PASSENGER VALUES('Antonia Gigovska', 'antonia_gigovska@yahoo.com', 'Macedonia');
INSERT INTO PASSENGER VALUES('Kia Kockar', 'kia_kockar@gmail.com', 'Serbia');
INSERT INTO PASSENGER VALUES('Kia Kockar', 'kia_kockar@gmail.com', 'Serbia');
INSERT INTO PASSENGER VALUES('David Bendisch', 'david_bendisch@yahoo.com', 'Germany');
INSERT INTO PASSENGER VALUES('Leona Todoroska', 'leona_todoroska@yahoo.com', 'Macedonia');
INSERT INTO PASSENGER VALUES('Isabella Klein', 'isabella.klein@gmail.com', 'Germany');

update FLIGHTS set airport_name='St. Paul the Apostle' where flight_no = 'EI919';

INSERT INTO FLIGHTS VALUES('AB670', '17:05', '19:00', 'Nikola Tesla');
INSERT INTO FLIGHTS VALUES('EI919', '23:30', '06:45', 'St.Paul the Apostle');
INSERT INTO FLIGHTS VALUES('RL975', '19:15', '22:30', 'Skopje International Airport');
INSERT INTO FLIGHTS VALUES('RQ256', '05:30', '17:00', 'Miami International Airport');
INSERT INTO FLIGHTS VALUES('SP919', '12:00', '16:00', 'St. Paul the Apostle');
INSERT INTO FLIGHTS VALUES('UX133', '04:00', '11:35', 'Melbourne Airport');
INSERT INTO FLIGHTS VALUES('DT254', '00:00', '07:45', 'Melbourne Airport');
INSERT INTO FLIGHTS VALUES('YA541', '15:05', '17:40', 'Skopje International Airport');
INSERT INTO FLIGHTS VALUES('TA178', '17:00', '23:40', 'Istanbul Airport');
INSERT INTO FLIGHTS VALUES('AU478', '10:05', '17:40', 'Paris Cahrles de Gaulle Airport');
INSERT INTO FLIGHTS VALUES('OX325', '15:00', '18:55', 'Dubai International Airport');
INSERT INTO FLIGHTS VALUES('YA894', '11:25', '20:45', 'Dubai International Airport');
INSERT INTO FLIGHTS VALUES('WO147', '19:30', '00:00', 'Dubai International Airport');
INSERT INTO FLIGHTS VALUES('PQ481', '02:25', '15:40', 'Istanbul Airport');
INSERT INTO FLIGHTS VALUES('OA582', '15:15', '18:40', 'Paris Cahrles de Gaulle Airport');
INSERT INTO FLIGHTS VALUES('PF984', '14:15', '23:20', 'Paris Cahrles de Gaulle Airport');
INSERT INTO FLIGHTS VALUES('MW654', '04:45', '13:00', 'Paris Cahrles de Gaulle Airport');

SELECT * FROM TICKETS;

INSERT INTO TICKETS VALUES(35672, 'AB670', 3, '02-06-2021', '5E', 'Wizz Air', 'Mia Johns', 'Milano');
INSERT INTO TICKETS VALUES(56427, 'EI919', 1, '03-07-2021', '13A', 'Turkish Airlines', 'Dimitar Mitrevski', 'Istanbul');
INSERT INTO TICKETS VALUES(21564, 'SP919', 6, '04-16-2021', '1C', 'Emirates', 'Mike Delfino', 'Wisconsin');
INSERT INTO TICKETS VALUES(19484, 'UX133', 8, '05-03-2021', '22D', 'Turkish Airlines', 'Carlos Solis', 'New South Wales');
INSERT INTO TICKETS VALUES(78914, 'DT254', 7, '01-31-2021', '3A', 'Qantas', 'Susan Mayer', 'Perth');
INSERT INTO TICKETS VALUES(18471, 'YA541', 10, '01-22-2021', '1C', 'Wizz Air', 'Vanessa Williams', 'Athens');
INSERT INTO TICKETS VALUES(79165, 'EI919', 11, '03-07-2021', '14D', 'Turkish Airlines', 'Norma John','Istanbul');
INSERT INTO TICKETS VALUES(19484, 'MW654', 13, '02-14-2021', '14A', 'Lufthansa', 'Rebeka Jankoska','Nairobi');
INSERT INTO TICKETS VALUES(48961, 'PF984', 14, '02-18-2021', '7C','Qantas','Silas Metzger', 'Tashkent');
INSERT INTO TICKETS VALUES(56427, 'OA582',15, '03-01-2021','22B','Emirates','Sarah Pitt', 'Berlin');
INSERT INTO TICKETS VALUES(21564, 'AB670', 18, '02-06-2021','1A','Wizz Air','Sofia Richie', 'Milano');
INSERT INTO TICKETS VALUES(19484, 'PQ481',19, '04-04-2021','18E', 'Lufthansa','Emanuel Macron', 'Lisbon');
INSERT INTO TICKETS VALUES(84164, 'WO147',23, '03-07-2021', '25B','Turkish Airlines', 'Gigi Hadid','Istanbul');
INSERT INTO TICKETS VALUES(98741, 'YA894',24, '02-21-2021','15C', 'Emirates','Selena Gomez', 'Torronto');
INSERT INTO TICKETS VALUES(64130, 'OX325',25, '01-30-2021','5B','Qantas','Angelina Davis', 'Dublin');
INSERT INTO TICKETS VALUES(97463,'AU478',28,'03-31-2021','30B','Turkish Airlines','Anne Heathaway', 'Brisbane');
INSERT INTO TICKETS VALUES(88791,'TA178',32,'04-16-2021','29A', 'Emirates', 'Pijong Kjang', 'Mumbai');
INSERT INTO TICKETS VALUES(03201, 'WO147',33, '03-07-2021','13B','Turkish Airlines','Songjul Kadis', 'Istanbul');
INSERT INTO TICKETS VALUES(98104, 'MW654',38, '02-17-2021','2D','Lufthansa','Kendal Jenner', 'Nairobi');
INSERT INTO TICKETS VALUES(34891,'OX325',42, '01-30-2021','21A','Qantas','Borko Ristovski', 'Dublin');
INSERT INTO TICKETS VALUES(12345,'TA178',43,'04-16-2021','11E','Emirates','Jelena Tomasevic', 'Mumbai');
INSERT INTO TICKETS VALUES(99881,'WO147',45, '03-07-2021','20D','Turkish Airlines', 'Kia Kockar', 'Istanbul');
INSERT INTO TICKETS VALUES(33348, 'PQ481',49, '04-04-2021','26C','Lufthansa','Isabella Klein', 'Lisbon');


SELECT * FROM AIRLINES_COMPANY;
INSERT INTO AIRLINES_COMPANY VALUES('Emirates', 'UAE');
INSERT INTO AIRLINES_COMPANY VALUES('Qantas', 'Australia');
INSERT INTO AIRLINES_COMPANY VALUES('Turkish Airlines', 'Turkey');
INSERT INTO AIRLINES_COMPANY VALUES('Lufthansa', 'Germany');
INSERT INTO AIRLINES_COMPANY VALUES('Wizz Air', 'Hungary');

SELECT * FROM EMPLOYEE;
SELECT * FROM SERVES;
INSERT INTO SERVES VALUES(1, 306,'Service 1', 1 );
INSERT INTO SERVES VALUES(2, 306, 'Service 2', 3);
INSERT INTO SERVES VALUES(14, 578, 'Service 3', 10);
INSERT INTO SERVES VALUES(6, 179, 'Service 4', 9);
INSERT INTO SERVES VALUES(8, 179, 'Service 2', 12);
INSERT INTO SERVES VALUES(9, 524, 'Service 4', 4);
INSERT INTO SERVES VALUES(12, 715, 'Service 1', 33);
INSERT INTO SERVES VALUES(14, 578, 'Service 4', 49);
INSERT INTO SERVES VALUES(20, 613, 'Service 2', 38);
INSERT INTO SERVES VALUES(25, 356, 'Service 1', 14);
INSERT INTO SERVES VALUES(29, 524, 'Service 3', 42);
INSERT INTO SERVES VALUES(31, 524, 'Service 4', 24);
INSERT INTO SERVES VALUES(32, 524, 'Service 4', 25);
INSERT INTO SERVES VALUES(23, 356, 'Service 2', 23);
INSERT INTO SERVES VALUES(34, 179, 'Service 1', 13);
INSERT INTO SERVES VALUES(41, 638, 'Service 3', 11);

SELECT * FROM PROVIDES;
INSERT INTO PROVIDES VALUES('RL975', 1);
INSERT INTO PROVIDES VALUES('DT254', 2);
INSERT INTO PROVIDES VALUES('UX133', 3);
INSERT INTO PROVIDES VALUES('EI919', 3);
INSERT INTO PROVIDES VALUES('TA178', 1);
INSERT INTO PROVIDES VALUES('SP919', 1);
INSERT INTO PROVIDES VALUES('OA582', 1);
INSERT INTO PROVIDES VALUES('YA894', 1);
INSERT INTO PROVIDES VALUES('OX325', 2);
INSERT INTO PROVIDES VALUES('PF984', 2);
INSERT INTO PROVIDES VALUES('AU478', 3);
INSERT INTO PROVIDES VALUES('WO147', 3);
INSERT INTO PROVIDES VALUES('PQ481', 4);
INSERT INTO PROVIDES VALUES('MW654', 4);
INSERT INTO PROVIDES VALUES('AB670', 5);
INSERT INTO PROVIDES VALUES('YA541', 5);


SELECT * FROM CARRIES;
INSERT INTO CARRIES VALUES('RL975', 3);
INSERT INTO CARRIES VALUES('AB670', 2);
INSERT INTO CARRIES VALUES('YA541', 10);
INSERT INTO CARRIES VALUES('EI919', 11);
INSERT INTO CARRIES VALUES('DT254', 7);
INSERT INTO CARRIES VALUES('UX133', 8);
INSERT INTO CARRIES VALUES('SP919', 6);
INSERT INTO CARRIES VALUES('AB670', 18);
INSERT INTO CARRIES VALUES('OX325', 25);
INSERT INTO CARRIES VALUES('TA178', 32);
INSERT INTO CARRIES VALUES('WO147', 45);
INSERT INTO CARRIES VALUES('AU478', 28);
INSERT INTO CARRIES VALUES('PQ481', 28);


UPDATE CARRIES SET p_id =3 WHERE flight_no= 'AB670' and p_id = 2;

DELETE FROM CARRIES WHERE flight_no = 'RL975' AND p_id = 3;

SELECT p_id, p.p_name 
FROM PASSENGER p
EXCEPT
SELECT t.p_id, p.p_name
FROM TICKETS t, PASSENGER p
WHERE t.p_id = p.p_id
ORDER BY p.p_name DESC

SELECT distinct t1.p_name
FROM TICKETS t1, TICKETS t2
WHERE t1.ticket_no = t2.ticket_no AND t1.p_name <> t2.p_name;

SELECT distinct p.p_email
FROM PASSENGER p, FLIGHTS f, TICKETS t
WHERE t.departure_date > '03-01-2021' AND t.p_id =p.p_id AND f.flight_no = t.flight_no AND f.airport_name IN('St. Paul the Apostle','Istanbul Airport');

SELECT COUNT(flight_no) AS Total_Flights, airport_name
FROM  FLIGHTS 
GROUP BY airport_name
HAVING airport_name LIKE ('%p%')
ORDER BY Total_Flights;

SELECT s.type, t.f_company, p.p_name
FROM TICKETS t, SERVES S, PASSENGER p
WHERE s.type NOT IN('Service 2 ','Service 4') AND t.f_company = 'Turkish Airlines' AND s.p_id = p.p_id AND p.p_id = t.p_id;

/*Get the sum of all salaries and of employees whose name starts with M*/
SELECT SUM(salary) as Total_Salary
FROM EMPLOYEE
WHERE e_name LIKE 'M%';

/*Create a view to find how many passengers have bought a ticket for Milano.*/
CREATE VIEW PASSENGERS_TICKETS
AS
SELECT p.p_id
FROM PASSENGER p, TICKETS t
WHERE p.p_id=t.p_id and t.destination='Milano';
SELECT COUNT(*) AS TOTAL_PASSENGER
FROM PASSENGERS_TICKETS;

/*Find all flight destinations and all passengers' names that have bought a ticket for 01.30.2021 */
SELECT destination, p_name
FROM TICKETS
WHERE departure_date='01-30-2021';

/*Get all combinations passenger(p_name) and airlines company that are located in Germany*/
SELECT p.p_name, ac.ac_name
FROM PASSENGER p, CARRIES c, FLIGHTS f, PROVIDES pr, AIRLINES_COMPANY ac
WHERE p.p_id =c.p_id AND c.flight_no = f.flight_no AND f.flight_no = pr.flight_no AND pr.ac_id =ac.ac_id AND ac.ac_country IN ('Germany','Hungary') and p.p_country IN ('USA','Australia');

/*Create a view to find the salary of all employee names that serve to passengers who fly to Istanbul*/
CREATE VIEW SALARY_EMP1 AS
SELECT e.salary, e.e_name
FROM employee e, passenger p, serves s, tickets t
WHERE e.e_id=s.e_id and s.p_id=p.p_id and t.p_id=p.p_id and t.destination='Istanbul';
SELECT *
FROM SALARY_EMP1;

/*Get all passengers who travel to Istanbul*/ 
SELECT *  
FROM TICKETS t, PASSENGER p
WHERE t.p_id = p.p_id AND t.destination = 'Istanbul';

/*Find passengers that their id is not between 15 and 20 and are flying from 'Skopje International Airport', 'St. Paul the Apostle' or 'Melbourne Airport' */

SELECT p.*
FROM PASSENGER p, CARRIES c, FLIGHTS f
WHERE p.p_id = c.p_id 
AND c.flight_no = f.flight_no
AND p.p_id NOT BETWEEN 15 AND 20 
AND f.airport_name IN('Skopje International Airport', 'St. Paul the Apostle', 'Melbourne Airport');

/*Find all passenger id's, their names and their travel destination for all passengers who have a flying ticket from the airlines company Emirates.*/
SELECT p.p_id, p.p_name, t.destination, ac.ac_name
FROM PASSENGER p, TICKETS t, PROVIDES pr, AIRLINES_COMPANY ac
WHERE p.p_id=t.p_id and t.flight_no=pr.flight_no and pr.ac_id=ac.ac_id and ac.ac_name='Emirates';







