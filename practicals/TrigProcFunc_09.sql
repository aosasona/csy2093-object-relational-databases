DROP TABLE staff;

CREATE TABLE staff (
  staff_id NUMBER(6),
  firstname VARCHAR2(15),
  surname VARCHAR2(15),
  username VARCHAR2(10),
  role VARCHAR2(10),
  date_of_birth DATE
);

INSERT INTO staff VALUES (1000, 'ALISON', 'APPLE', NULL, 'HEAD','01-JAN-1965');
INSERT INTO staff VALUES (1001, 'BERTY', 'BANANA', 'BBANA', 'WORKER BEE','02-MAR-1989');
INSERT INTO staff VALUES (1002, 'CANDY', 'CANE', NULL,'CONTROL','12-JUN-1980');

SET SERVEROUTPUT ON;

-- function(s)
CREATE OR REPLACE FUNCTION func_calculate_age (in_staff_dob DATE) RETURN NUMBER IS
  vn_age NUMBER(6,2);
BEGIN
  vn_age := FLOOR(MONTHS_BETWEEN(SYSDATE, in_staff_dob) / 12);
  RETURN vn_age;
END func_calculate_age;
/

CREATE OR REPLACE FUNCTION func_calculate_years_left (in_staff_dob DATE) RETURN NUMBER IS
  vn_service_period_left NUMBER(6,2);
BEGIN
  vn_service_period_left := 67 - func_calculate_age(in_staff_dob);
  RETURN vn_service_period_left;
END func_calculate_years_left;
/


-- procedure(s)
CREATE OR REPLACE PROCEDURE proc_get_service_period_left (in_staff_id NUMBER) IS
  vd_dob DATE;
BEGIN
  SELECT date_of_birth INTO vd_dob FROM staff WHERE staff_id = in_staff_id;
  DBMS_OUTPUT.PUT_LINE('-> ' || func_calculate_years_left(vd_dob) || ' years left to retire');
END proc_get_service_period_left;
/

-- trigger(s)

CREATE OR REPLACE TRIGGER trig_proc_func
AFTER INSERT OR UPDATE OR DELETE ON staff
FOR EACH ROW
BEGIN
  IF INSERTING THEN
    DBMS_OUTPUT.PUT_LINE('-> You are adding ' || :NEW.firstname || ' and age is ' || func_calculate_age(:NEW.date_of_birth));
  ELSIF UPDATING THEN
    DBMS_OUTPUT.PUT_LINE('-> ' || :OLD.firstname || ' has ' || func_calculate_years_left(:NEW.date_of_birth) || ' years left to retire');
  ELSIF DELETING THEN
    DBMS_OUTPUT.PUT_LINE('-> You are deleting ' || :OLD.firstname);
  END IF;
END trig_proc_func;
/

SHOW ERRORS;

-- test
INSERT INTO staff VALUES (1003, 'DAN', 'DANIELS', 'DDAN', 'WORKER BEE','12-JUN-1983');
UPDATE staff SET date_of_birth = '12-JUN-1958' WHERE staff_id = 1003;
DELETE FROM staff WHERE staff_id = 1003;

--  DROP
DROP TRIGGER trig_proc_func;
DROP PROCEDURE proc_get_service_period_left;
DROP FUNCTION func_calculate_years_left;
DROP FUNCTION func_calculate_age;
