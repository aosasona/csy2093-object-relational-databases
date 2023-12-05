SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER trig_dob_ck
BEFORE INSERT OR UPDATE OF date_of_birth ON students
FOR EACH ROW
WHEN (NEW.date_of_birth > SYSDATE)
BEGIN
  RAISE_APPLICATION_ERROR(-20000, 'ERROR - THIS STUDENT WAS BORN AFTER TODAY, AMEND STUDENT DATE OF BIRTH!');
END trig_dob_ck;
/

-- test trigger
 
-- test insert
INSERT INTO students 
(student_id, student_firstname, student_surname, phone_number, gender, 
date_of_birth, preferred_language, company_id, address)
SELECT 1211, 'DIANE', 'BROWN', '(617)342-2345', 'F', '01-JAN-2024', 'EN', 20, REF(a)
FROM addresses a
WHERE a.street='111 BAY STATE ROAD';

SELECT COUNT(student_id) FROM students WHERE student_id = 1211;

-- test update
UPDATE students SET date_of_birth = ADD_MONTHS(SYSDATE, 1) WHERE student_id = 1111;

SELECT date_of_birth FROM students WHERE student_id = 1111;

-- test update with trigger
UPDATE students SET date_of_birth = '27-MAY-1993' WHERE student_id = 1111;
SELECT date_of_birth FROM students WHERE student_id = 1111;

-- drop trigger
DROP TRIGGER trig_dob_ck;


-- trigger to display whether a student is an adult or not
CREATE OR REPLACE TRIGGER trig_output_class
BEFORE INSERT OR UPDATE ON students
FOR EACH ROW
WHEN (NEW.date_of_birth IS NOT NULL)
DECLARE
  vn_age NUMBER(6,2);
BEGIN
  vn_age := MONTHS_BETWEEN(SYSDATE, :NEW.date_of_birth);
  IF (vn_age / 12) >= 18
    THEN DBMS_OUTPUT.PUT_LINE(:OLD.student_firstname || ' WITH STUDENT ID (' || :OLD.student_id || ') IS AN ADULT');
    ELSE DBMS_OUTPUT.PUT_LINE(:OLD.student_firstname || ' WITH STUDENT ID (' || :OLD.student_id || ') IS NOT AN ADULT');
  END IF;
END trig_output_class;
/

-- test trigger
-- is an adult
UPDATE students SET student_firstname = 'JOE' WHERE student_id = 1111;
-- is NOT an adult
-- UPDATE students SET date_of_birth = '22-DEC-2007' WHERE student_id = 2299;
UPDATE students SET date_of_birth = '06-DEC-2023' WHERE student_id = 2299;
-- is an adult
UPDATE students SET date_of_birth = ADD_MONTHS(SYSDATE, -18 * 12) WHERE student_id = 4568;

-- drop trigger
DROP TRIGGER trig_output_class;


-- trigger to display message when the age is >= 18
CREATE OR REPLACE TRIGGER trig_output_added
BEFORE INSERT ON students
FOR EACH ROW
WHEN ((MONTHS_BETWEEN(SYSDATE, NEW.date_of_birth) / 12) >= 18)
BEGIN
  DBMS_OUTPUT.PUT_LINE('Student added');
END trig_output_added;
/

-- test - should fire
INSERT INTO students 
(student_id, student_firstname, student_surname, phone_number, gender, 
date_of_birth, preferred_language, company_id, address)
SELECT 5684, 'FOX', 'MULDER', '(617)342-2879', 'M', '08-JUN-2004', 'EN', 20, REF(a)
FROM addresses a
WHERE a.street='111 BAY STATE ROAD';

-- test - should not fire
INSERT INTO students 
(student_id, student_firstname, student_surname, phone_number, gender, 
date_of_birth, preferred_language, company_id, address)
SELECT 5685, 'DANA', 'SCULLY', '(617)376-2879', 'F', '01-JAN-2008', 'EN', 20, REF(a)
FROM addresses a
WHERE a.street='111 BAY STATE ROAD';

DROP TRIGGER trig_output_added;

-- trigger to display message when the age is < 18
CREATE OR REPLACE TRIGGER trig_min_age
BEFORE INSERT ON students
FOR EACH ROW
WHEN ((MONTHS_BETWEEN(SYSDATE, NEW.date_of_birth) / 12) < 18)
BEGIN
  RAISE_APPLICATION_ERROR(-20000, 'ERROR - STUDENT IS TOO YOUNG');
END trig_min_age;
/

-- test - should not fire
INSERT INTO students 
(student_id, student_firstname, student_surname, phone_number, gender, 
date_of_birth, preferred_language, company_id, address)
SELECT 5686, 'FOX', 'MULDER', '(617)342-2879', 'M', '08-JUN-2004', 'EN', 20, REF(a)
FROM addresses a
WHERE a.street='111 BAY STATE ROAD';

-- test - should fire
INSERT INTO students 
(student_id, student_firstname, student_surname, phone_number, gender, 
date_of_birth, preferred_language, company_id, address)
SELECT 5687, 'DANA', 'SCULLY', '(617)376-2879', 'F', '01-JAN-2008', 'EN', 20, REF(a)
FROM addresses a
WHERE a.street='111 BAY STATE ROAD';

DROP TRIGGER trig_min_age;
