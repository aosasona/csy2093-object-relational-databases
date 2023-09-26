/* InsertCourse */
-- RunCommand @/Users/macintosh/school/ord/practicals/InsertCourse.sql
INSERT INTO addresses (street, city, country)
VALUES ('111 BAY STATE ROAD', 'BOSTON', 'USA');
INSERT INTO addresses (street, city, country)
VALUES ('111 VALLEY WAY', 'SAN FERNANDO', 'USA');
INSERT INTO addresses (street, city, country)
VALUES ('4545 ORACLE DRIVE', 'SAN FRANCISCO', 'USA');
INSERT INTO addresses (street, city, country)
VALUES ('22 GOLDEN GATE DRIVE', 'SAN FRANCISCO', 'USA');
INSERT INTO addresses (street, city, country)
VALUES ('77 ELM STREET', 'NEWARK', 'USA');
INSERT INTO addresses (street, city, country)
VALUES ('544 42ND STREET', 'NEW YORK', 'USA');
INSERT INTO addresses (street, city, country)
VALUES ('111 BEACHCOMBER PLACE', 'OCEANSIDE', 'USA');
INSERT INTO addresses (street, city, country)
VALUES ('25 MISSION WAY', 'SAN DIEGO', 'USA');
INSERT INTO addresses (street, city, country)
VALUES ('177 AIRPORT ROAD', 'NEWARK', 'USA');
INSERT INTO addresses (street, city, country)
VALUES ('5567 KNIGHTSBRIDGE COURT', 'LONDON', 'UK');
INSERT INTO addresses (street, city, country)
VALUES ('111 CRUISING WAY', 'TORTOLA', 'BVI');
INSERT INTO addresses (street, city, country)
VALUES ('45 KING STREET', 'OTTAWA', 'CANADA');
INSERT INTO addresses (street, city, country)
VALUES ('45555 BIG STREET', 'DALLAS', 'USA');
INSERT INTO addresses (street, city, country)
VALUES ('AVENUE CHAMPS-ELYSEES 456', 'PARIS', 'FRANCE');
INSERT INTO addresses (street, city, country)
VALUES ('562 HOCKEY STREET', 'TORONTO', 'CANADA');
INSERT INTO addresses (street, city, country)
VALUES ('4242 MISTY LANE', 'SEATTLE', 'USA');
INSERT INTO addresses (street, city, country)
VALUES ('KUNGSGATAN 56', 'STOCKHOLM', 'SWEDEN');
INSERT INTO addresses (street, city, country)
VALUES ('11-882 KAMEHAMEHA HIGHWAY', 'HAWAII', 'USA');
INSERT INTO addresses (street, city, country)
VALUES ('333 SAN JUAN BLVD', 'SAN JUAN', 'PUERTO RICO');
INSERT INTO addresses (street, city, country)
VALUES ('7500 IMPERIAL BLVD', 'LOS ANGELES', 'USA');

INSERT INTO companies (company_id, company_name, city, industry, no_employees, revenue, training_budget)
VALUES (10, 'USCABLES', 'WASHINGTON', 'MANUFACTURING', 250, 40000000, 50000.00);
INSERT INTO companies (company_id, company_name, city, industry, no_employees, revenue, training_budget)
VALUES (20, 'KODAK', 'HOUSTON', 'MANUFACTURING', 2500, 100000000, 100000.00);
INSERT INTO companies (company_id, company_name, city, industry, no_employees, revenue, training_budget)
VALUES (30, 'KLM', 'AMSTERDAM', 'SERVICE', 5000, 11000000, 9900000.00);
INSERT INTO companies (company_id, company_name, city, industry, no_employees, revenue, training_budget)
VALUES (40, 'HAMBRO', 'LONDON', 'SERVICE', 2000, 6000000, 5000000.00);
INSERT INTO companies (company_id, company_name, city, industry, no_employees, revenue, training_budget)
VALUES (50, 'FORD', 'DETROIT', 'MANUFACTURING', 8000, 200000000, 100000.00);
INSERT INTO companies (company_id, company_name, city, industry, no_employees, revenue, training_budget)
VALUES (60, 'CITYBANK', 'BOSTON', 'FINANCE', 3000, 50000000, 200000.00);
INSERT INTO companies (company_id, company_name, city, industry, no_employees, revenue, training_budget)
VALUES (70, 'DISNEY', 'ORLANDO', 'ARTS', 25000, 1000000000, 300000.00);

INSERT INTO students 
(student_id, student_firstname, student_surname, phone_number, gender, 
date_of_birth, preferred_language, company_id, address)
SELECT 1111, 'DIANE', 'BROWN', '(617)342-2345', 'F', '01-FEB-1994', 'EN', 20, REF(a)
FROM addresses a
WHERE a.street='111 BAY STATE ROAD';

INSERT INTO students 
(student_id, student_firstname, student_surname, phone_number, gender,
date_of_birth, preferred_language, company_id, address)
SELECT 2299, 'CHRIS', 'ADAMS', '(213)334-2789', 'M', '22-MAR-1995', 'EN', 30, REF(a)
FROM addresses a
WHERE a.street='7500 IMPERIAL BLVD';

INSERT INTO students 
(student_id, student_firstname, student_surname, phone_number, gender,
date_of_birth, preferred_language, company_id, address)
SELECT 4568, 'KEVIN', 'COX', '(619)433-6845', 'M', '04-DEC-2003', 'EN', 10, REF(a)
FROM addresses a
WHERE a.street='25 MISSION WAY';

INSERT INTO students 
(student_id, student_firstname, student_surname, phone_number, gender, 
date_of_birth, preferred_language, company_id, address)
SELECT 5556, 'JOHN', 'TYLER', '(212)444-9769', 'M', '13-JUN-1996', 'EN', 20, REF(a)
FROM addresses a
WHERE a.street='544 42ND STREET';

INSERT INTO students 
(student_id, student_firstname, student_surname, phone_number, gender, 
date_of_birth, preferred_language, company_id)
VALUES (6874, 'NANCY', 'GIBBS', '(714)346-2896', 'NB', '15-JUL-2005', 'EN', 10);

UPDATE students SET address = 
	(SELECT REF(a) FROM addresses a
	WHERE a.street='111 VALLEY WAY')
WHERE student_id = 6874;

INSERT INTO students 
(student_id, student_firstname, student_surname, phone_number, gender, 
date_of_birth, preferred_language, company_id)
VALUES (6789, 'JENNY', 'ROSE', '(415)334-2345', 'F', '16-SEP-2003', 'SW', 10);

UPDATE students SET address = 
	(SELECT REF(a) FROM addresses a
	WHERE a.street='4545 ORACLE DRIVE')
WHERE student_id = 6789;

INSERT INTO students 
(student_id, student_firstname, student_surname, phone_number, gender, 
date_of_birth, preferred_language, company_id)
VALUES (1199, 'FRANK', 'NELSON', '(609)345-2346', 'M', '22-APR-2004', 'EN', 20);

UPDATE students SET address = 
	(SELECT REF(a) FROM addresses a
	WHERE a.street='77 ELM STREET')
WHERE student_id = 1199;

INSERT INTO students 
(student_id, student_firstname, student_surname, phone_number, gender, 
date_of_birth, preferred_language, company_id)
VALUES (6263, 'KEN', 'CRICK', '(415)345-2313', 'M', '14-MAR-2005', 'EN', 50);

UPDATE students SET address = 
	(SELECT REF(a) FROM addresses a
	WHERE a.street='22 GOLDEN GATE DRIVE')
WHERE student_id = 6263;

INSERT INTO students 
(student_id, student_firstname, student_surname, phone_number, gender, 
date_of_birth, preferred_language, company_id)
VALUES (3452, 'NIGEL', 'TURNER', '(818)352-2511', 'M', '16-FEB-2002', 'SW', 10);

UPDATE students SET address = 
	(SELECT REF(a) FROM addresses a
	WHERE a.street='111 BEACHCOMBER PLACE')
WHERE student_id = 3452;

INSERT INTO students 
(student_id, student_firstname, student_surname, phone_number, gender, 
date_of_birth, preferred_language, company_id)
VALUES (2346, 'CARL', 'DUDLEY', '(609)223-7890', 'M', '28-NOV-1997', 'EN', 20);

UPDATE students SET address = 
	(SELECT REF(a) FROM addresses a
	WHERE a.street='5567 KNIGHTSBRIDGE COURT')
WHERE student_id = 2346;

INSERT INTO students 
(student_id, student_firstname, student_surname, phone_number, gender, 
date_of_birth, preferred_language, company_id)
VALUES (9842, 'MIKE', 'COOPER', '(713)726-9842', 'M', '18-OCT-2002', 'EN', 50);

UPDATE students SET address = 
	(SELECT REF(a) FROM addresses a
	WHERE a.street='562 HOCKEY STREET')
WHERE student_id = 9842;

INSERT INTO students 
(student_id, student_firstname, student_surname, phone_number, gender, 
date_of_birth, preferred_language, company_id)
VALUES (6901, 'LILY', 'GREEN', '(809)342-9621', 'F', '14-MAY-2004', 'EN', 30);

UPDATE students SET address = 
	(SELECT REF(a) FROM addresses a
	WHERE a.street='111 CRUISING WAY')
WHERE student_id = 6901;

INSERT INTO students 
(student_id, student_firstname, student_surname, phone_number, gender, 
date_of_birth, preferred_language, company_id)
VALUES (7652, 'MARY', 'FRANKS', '(713)234-8521', 'F', '23-DEC-2005', 'EN', 60);

UPDATE students SET address = 
	(SELECT REF(a) FROM addresses a
	WHERE a.street='45 KING STREET')
WHERE student_id = 7652;

INSERT INTO students 
(student_id, student_firstname, student_surname, phone_number, gender, 
date_of_birth, preferred_language, company_id)
VALUES (4631, 'JOE', 'FISHER', '(709)452-7392', 'M', '22-NOV-2002', 'EN', 50);

UPDATE students SET address = 
	(SELECT REF(a) FROM addresses a
	WHERE a.street='AVENUE CHAMPS-ELYSEES 456')
WHERE student_id = 4631;

INSERT INTO students 
(student_id, student_firstname, student_surname, phone_number, gender, 
date_of_birth, preferred_language, company_id)
VALUES (3459, 'LARRY', 'MYERS', '(909)352-6216', 'M', '15-AUG-2007', 'EN', 10);

UPDATE students SET address = 
	(SELECT REF(a) FROM addresses a
	WHERE a.street='4242 MISTY LANE')
WHERE student_id = 3459;

INSERT INTO students 
(student_id, student_firstname, student_surname, phone_number, gender, 
date_of_birth, preferred_language, company_id)
VALUES (6738, 'NICK', 'CARTER', '(808)238-2358', 'M', '17-FEB-2004', 'EN', 20);

UPDATE students SET address = 
	(SELECT REF(a) FROM addresses a
	WHERE a.street='11-882 KAMEHAMEHA HIGHWAY')
WHERE student_id = 6738;

INSERT INTO students 
(student_id, student_firstname, student_surname, phone_number, gender, 
date_of_birth, preferred_language, company_id)
VALUES (8390, 'CAROL', 'WOOD', '(809)342-2345', 'F', '01-MAR-2004', 'EN', 60);

UPDATE students SET address = 
	(SELECT REF(a) FROM addresses a
	WHERE a.street='KUNGSGATAN 56')
WHERE student_id = 8390;

INSERT INTO students 
(student_id, student_firstname, student_surname, phone_number, gender, 
date_of_birth, preferred_language, company_id)
VALUES (8872, 'DEBBY', 'ARCHER', '(980)247-2349', 'F', '01-SEP-2004', 'EN', 20);

UPDATE students SET address = 
	(SELECT REF(a) FROM addresses a
	WHERE a.street='333 SAN JUAN BLVD')
WHERE student_id = 8872;

INSERT INTO students 
(student_id, student_firstname, student_surname, phone_number, gender, 
date_of_birth, preferred_language, company_id)
VALUES (6474, 'PETER', 'HALL', '(707)843-2346', 'M', '22-FEB-2005', 'EN', 10);

UPDATE students SET address = 
	(SELECT REF(a) FROM addresses a
	WHERE a.street='45555 BIG STREET')
WHERE student_id = 6474;

INSERT INTO students 
(student_id, student_firstname, student_surname, phone_number, gender, 
date_of_birth, preferred_language, company_id)
VALUES (9835, 'PAUL', 'MARKS', '(706)343-2345', 'M', '16-DEC-2004', 'EN', 20);

UPDATE students SET address = 
	(SELECT REF(a) FROM addresses a
	WHERE a.street='177 AIRPORT ROAD')
WHERE student_id = 9835;

INSERT INTO students 
(student_id, student_firstname, student_surname, phone_number, gender,
date_of_birth, preferred_language, company_id)
VALUES (7777, 'FRED', 'FLINTSTONE', '(747)987-6543', 'M', '04-JUL-2004', 'FR', 70);

UPDATE students s SET s.address = 
	(SELECT REF(a) FROM addresses a
	WHERE a.street='177 AIRPORT ROAD')
WHERE s.student_id = 7777;

INSERT INTO instructors 
(instructor_id, instructor_name, salary, commission, mentor_id, date_hired, address)
SELECT 835, 'SPARKS', 4000 , 200, 978, '16-DEC-1999',
REF(a) FROM addresses a
WHERE a.street='177 AIRPORT ROAD';

INSERT INTO instructors 
(instructor_id, instructor_name, salary, commission, mentor_id, date_hired, address)
SELECT 978, 'STEEL', 5000 , 250, 222, '16-JAN-2000',
REF(a) FROM addresses a
WHERE a.street='177 AIRPORT ROAD';

INSERT INTO instructors 
(instructor_id, instructor_name, salary, commission, mentor_id, date_hired, address)
SELECT 222, 'CAINE', 5500 , 350, NULL, '02-NOV-2006',
REF(a) FROM addresses a
WHERE a.street='333 SAN JUAN BLVD';


INSERT INTO instructors 
(instructor_id, instructor_name, salary, commission, mentor_id, date_hired)
VALUES (243, 'TUCKER', 2000 , NULL, 835, '18-DEC-2019');

UPDATE instructors SET address = 
(SELECT REF(a) FROM addresses a
WHERE a.street='11-882 KAMEHAMEHA HIGHWAY')
WHERE instructor_id = 243;

INSERT INTO instructors 
(instructor_id, instructor_name, salary, commission, mentor_id, date_hired)
VALUES (263, 'JOHNSON', 4000 , NULL, 835, '18-JUL-2018');

UPDATE instructors SET address = 
(SELECT REF(a) FROM addresses a
WHERE a.street='562 HOCKEY STREET')
WHERE instructor_id = 263;

INSERT INTO instructors 
(instructor_id, instructor_name, salary, commission, mentor_id, date_hired)
VALUES (515, 'SHELLEY', 3500 , 200, 700, '20-JAN-2018');

UPDATE instructors SET address = 
(SELECT REF(a) FROM addresses a
WHERE a.street='4242 MISTY LANE')
WHERE instructor_id = 515;

INSERT INTO instructors 
(instructor_id, instructor_name, salary, commission, mentor_id, date_hired)
VALUES (453, 'LODGE', 2500 , 100, 835, '14-SEP-2008');

UPDATE instructors SET address = 
(SELECT REF(a) FROM addresses a
WHERE a.street='4242 MISTY LANE')
WHERE instructor_id = 453;

INSERT INTO instructors 
(instructor_id, instructor_name, salary, commission, mentor_id, date_hired)
VALUES (700, 'WAYNE', 4500 , 300, NULL, '16-MAY-2021');

UPDATE instructors SET address = 
(SELECT REF(a) FROM addresses a
WHERE a.street='AVENUE CHAMPS-ELYSEES 456')
WHERE instructor_id = 700;

INSERT INTO instructors 
(instructor_id, instructor_name, salary, commission, mentor_id, date_hired)
VALUES (628, 'MONROE', 3000 , NULL, 700, '16-JUN-2004');

UPDATE instructors SET address = 
(SELECT REF(a) FROM addresses a
WHERE a.street='5567 KNIGHTSBRIDGE COURT')
WHERE instructor_id = 628;

INSERT INTO instructors 
(instructor_id, instructor_name, salary, commission, mentor_id, date_hired)
VALUES (790, 'NEWMAN', 3100 , 300, 700, '16-DEC-2002');

UPDATE instructors SET address = 
(SELECT REF(a) FROM addresses a
WHERE a.street='544 42ND STREET')
WHERE instructor_id = 790;

INSERT INTO instructors 
(instructor_id, instructor_name, salary, commission, mentor_id, date_hired)
VALUES (795, 'BOGART', 3200 , NULL, 700, '16-DEC-2003');

UPDATE instructors SET address = 
(SELECT REF(a) FROM addresses a
WHERE a.street='111 CRUISING WAY')
WHERE instructor_id = 795;

INSERT INTO instructors 
(instructor_id, instructor_name, salary, commission, mentor_id, date_hired)
VALUES (560, 'LAUREL', 5200 , 200, 978, '16-DEC-2003');

UPDATE instructors SET address = 
(SELECT REF(a) FROM addresses a
WHERE a.street='333 SAN JUAN BLVD')
WHERE instructor_id = 560;

INSERT INTO instructors 
(instructor_id, instructor_name, salary, commission, mentor_id, date_hired)
VALUES (123, 'FLINTSTONE,FRED', 1000 , NULL, 978, '16-JUN-2009');

UPDATE instructors SET address = 
(SELECT REF(a) FROM addresses a
WHERE a.street='177 AIRPORT ROAD')
WHERE instructor_id = 123;

INSERT INTO instructors 
(instructor_id, instructor_name, salary, commission, mentor_id, date_hired)
VALUES (111, 'BROWN', 1000 , NULL, 978, '16-JUN-2009');

UPDATE instructors SET address = 
(SELECT REF(a) FROM addresses a
WHERE a.street='111 BAY STATE ROAD')
WHERE instructor_id = 111;

INSERT INTO subject_areas VALUES (10, 'SYSTEMS');
INSERT INTO subject_areas VALUES (20, 'LANGUAGES');
INSERT INTO subject_areas VALUES (30, 'DBMS');
INSERT INTO subject_areas VALUES (40, 'NETWORKS');
INSERT INTO subject_areas VALUES (50, 'ANALYTICS');

INSERT INTO courses VALUES (215, 'WEB DEVELOPMENT', 5, 1995, 10, NULL);
INSERT INTO courses VALUES (315, 'C++', 5, 1995, 20, NULL);
INSERT INTO courses VALUES (415, 'ADA', 3, 1500, 20, NULL);
INSERT INTO courses VALUES (515, 'ORACLE', 5, 1995, 30, NULL);
INSERT INTO courses VALUES (615, 'SYBASE', 3, 1200, 30, NULL);
INSERT INTO courses VALUES (115, 'DOS', 3, 500, 10, NULL);
INSERT INTO courses VALUES (715, 'VMS', 3, 995, 10, NULL);
INSERT INTO courses VALUES (815, 'NETWARE', 5, 1995, 40, NULL);
INSERT INTO courses VALUES (915, 'JAVA PROGRAMMING', 3, 1200, 30, NULL);
INSERT INTO courses VALUES (916, 'INTELLIGENCE', 3, 2200, 30, NULL);


INSERT INTO sites (site_id, address, classroom, location) VALUES (
1, address_type('3 PLACE DE CONCORDE','PARIS','FRANCE'),
classroom_varray_type(classroom_type ('LB1', 20, 'COMPUTER LAB'),
				classroom_type ('S2', 24, 'SEMINAR ROOM'),
				classroom_type ('L1', 130, 'LARGER LECTURE ROOM')),
'EUROPE WEST');

INSERT INTO sites (site_id, address, classroom, location) VALUES (
2, address_type('1600 PENNSYLVANIA','WASHINGTON','USA'),
classroom_varray_type (classroom_type ('LB1', 20, 'BIO LAB'),
				classroom_type ('P2', 24, 'PRACTICAL ROOM')), 
'US EAST');

INSERT INTO sites (site_id, address, classroom, location) VALUES (
3, address_type('22 TRAFALGAR SQUARE','LONDON','UK'),
classroom_varray_type(classroom_type ('LB1', 20, 'COMPUTER LAB'),
				classroom_type ('S2', 24, 'SEMINAR ROOM'),
				classroom_type ('L3', 24, 'LECTURE ROOM')),
'EUROPE WEST');

INSERT INTO sites (site_id, address, classroom, location) VALUES (
4, address_type('KUNGSGATAN 26','STOCKHOLM','SWEDEN'), 
classroom_varray_type (classroom_type ('P1', 20, 'PRACTICAL ROOM')),
'EUROPE NORTH');

INSERT INTO sites (site_id, address, classroom, location) VALUES (
5, address_type('343 ELM STREET','OTTAWA','CANADA'),
classroom_varray_type (classroom_type ('1', 20, NULL),
				classroom_type ('2', 20, NULL),
				classroom_type ('3', 20, NULL)),
'CANADA CTR');

INSERT INTO sites (site_id, address, classroom, location) VALUES (
6, address_type('101 BOYLSTON STREET','BOSTON','USA'),
classroom_varray_type (classroom_type ('P1', 20, 'PRACTICAL ROOM'),
				classroom_type ('LB2', 24, 'BIO LAB')),
'US EAST');

INSERT INTO sites (site_id, address, classroom, location) VALUES (
7, address_type('1010 SEPULVEDA','LOS ANGELES','USA'),
classroom_varray_type (classroom_type ('C1', 20, 'CONFERENCE ROOM'),
				classroom_type ('M2', 20, 'MEETING ROOM'),
				classroom_type ('T3', 20, NULL)),
'US WEST');

INSERT INTO sites (site_id, address, classroom, location) VALUES (
8, address_type('101 YOUNGE STREET','TORONTO','CANADA'), 
classroom_varray_type (classroom_type ('1', 20, NULL),
				classroom_type ('2', 24, NULL)),
'CANADA SOUTH');

INSERT INTO offerings 
(offering_id, course_id, instructor_id, site_id, start_date, max_no_students)
VALUES (1001, 315, 700, 1, '16-DEC-2014', 24);

INSERT INTO offerings 
(offering_id, course_id, instructor_id, site_id, start_date, max_no_students)
VALUES (1002, 315, 263, 3, '16-JUL-2022', 20);

INSERT INTO offerings
(offering_id, course_id, instructor_id, site_id, start_date, max_no_students)
VALUES (1003, 915, 560, 7, '23-NOV-2020', 30);

INSERT INTO offerings 
(offering_id, course_id, instructor_id, site_id, start_date, max_no_students)
VALUES (1004, 215, 263, 2, '26-SEP-2022', 24);

INSERT INTO offerings 
(offering_id, course_id, instructor_id, site_id, start_date, max_no_students)
VALUES (1005, 815, 978, 3, '15-OCT-2022', 20);

INSERT INTO offerings 
(offering_id, course_id, instructor_id, site_id, start_date, max_no_students)
VALUES (1006, 915, 560, 4, '04-JAN-2021', 22);

INSERT INTO offerings 
(offering_id, course_id, instructor_id, site_id, start_date, max_no_students)
VALUES (1007, 615, 453, 4, '30-SEP-2023', 30);

INSERT INTO offerings 
(offering_id, course_id, instructor_id, site_id, start_date, max_no_students)
VALUES (1008, 515, 835, 5, '20-JUN-2021', 24);

INSERT INTO offerings 
(offering_id, course_id, instructor_id, site_id, start_date, max_no_students)
VALUES (1009, 315, 790, 4, '21-JUN-2021', 24);

INSERT INTO offerings 
(offering_id, course_id, instructor_id, site_id, start_date, max_no_students)
VALUES (1010, 315, NULL, 4, '30-AUG-2022', 24);

INSERT INTO offerings 
(offering_id, course_id, instructor_id, site_id, start_date, max_no_students)
VALUES (1011, 916, NULL, 4, '30-AUG-2022', 24);


INSERT INTO attendance VALUES (1001,1111, '01-JAN-2022', 4, 1000);
INSERT INTO attendance VALUES (1002,2299, '05-JAN-2022', NULL, 1000);
INSERT INTO attendance VALUES (1003,4568, '10-JAN-2022', 3, 1200);
INSERT INTO attendance VALUES (1002,6789, '15-JAN-2022', 4, 1150);
INSERT INTO attendance VALUES (1005,9835, '25-JAN-2022', 3, 1995);
INSERT INTO attendance VALUES (1006,9842, '05-FEB-2022', 4, 1000);
INSERT INTO attendance VALUES (1006,1199, '10-FEB-2022', 4, 1200);
INSERT INTO attendance VALUES (1006,3452, '15-FEB-2022', 2, 200);
INSERT INTO attendance VALUES (1007,8390, '20-FEB-2022', 4, 1200);
INSERT INTO attendance VALUES (1007,6474, '25-FEB-2022', 4, 900);
INSERT INTO attendance VALUES (1008,8390, '05-MAR-2022', 4, 1000);
INSERT INTO attendance VALUES (1003,1199, '10-MAR-2022', 4, 1000);
INSERT INTO attendance VALUES (1001,6738, '15-MAR-2022', 4, 850);
INSERT INTO attendance VALUES (1001,5556, '20-MAR-2022', 4, 1995);
INSERT INTO attendance VALUES (1001,6263, '25-MAR-2022', 1, 1995);
INSERT INTO attendance VALUES (1002,2346, '30-MAR-2022', 4, 1995);
INSERT INTO attendance VALUES (1003,6901, '05-APR-2022', 4, 1200);
INSERT INTO attendance VALUES (1003,7652, '10-APR-2022', 4, 1200);
INSERT INTO attendance VALUES (1003,4631, '15-APR-2022', 3, 1200);
INSERT INTO attendance VALUES (1008,3459, '20-APR-2022', 4, 1995);
INSERT INTO attendance VALUES (1004,2299, '25-APR-2022', 3, 1995);
INSERT INTO attendance VALUES (1004,6789, '30-APR-2022', 4, 1995);
INSERT INTO attendance VALUES (1004,6263, '05-MAY-2022', 4, 1995);
INSERT INTO attendance VALUES (1007,9842, '10-MAY-2022', 3, 1200);
INSERT INTO attendance VALUES (1007,4631, '15-MAY-2022', 3, 1200);
INSERT INTO attendance VALUES (1005,6738, '20-MAY-2022', 4, 1000);
INSERT INTO attendance VALUES (1005,3459, '25-MAY-2022', 3, 1995);
INSERT INTO attendance VALUES (1006,6474, '30-MAY-2022', 2, 1200);
INSERT INTO attendance VALUES (1006,9835, '05-JUN-2022', 4, 1000);
INSERT INTO attendance VALUES (1007,9835, '10-JUN-2022', 4, 1200);
INSERT INTO attendance VALUES (1009,3459, '15-JUN-2022', 3, 4000);

INSERT INTO invoices
(invoice_number, company_id, billing_date, invoice_item)
VALUES (10007, 30, '01-OCT-2022',
invoice_item_table_type(
invoice_item_type('GREEN','ORACLE','20-JUL-2021',NULL,1250),
invoice_item_type('ADAMS','UNIX','08-SEP-2022',NULL,1250)));

commit
;
