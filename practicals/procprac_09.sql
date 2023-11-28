-- DROP PROCEDURE proc_username;
-- DROP PROCEDURE proc_delete_company;
SET SERVEROUTPUT ON;

-- username procedure
CREATE OR REPLACE PROCEDURE proc_username (out_result OUT VARCHAR2) IS
  vc_username VARCHAR2(20);
  vc_firstname students.student_firstname%TYPE;
  vc_surname students.student_surname%TYPE;
BEGIN
  SELECT student_firstname, student_surname INTO vc_firstname, vc_surname FROM students WHERE student_id = 6901;
  vc_username := SUBSTR(vc_firstname, 1, 2) || SUBSTR(vc_surname, 1, 5);

  DBMS_OUTPUT.PUT_LINE('The username is ' || vc_username);

  out_result := vc_username;
END proc_username;
/

SHOW ERRORS;

-- test proc_username
DECLARE
  vc_expected_username VARCHAR2(20);
  out_username VARCHAR2(20);
BEGIN
  SELECT SUBSTR(student_firstname, 1, 2) || SUBSTR(student_surname, 1, 5) 
    INTO vc_expected_username
  FROM students 
  WHERE student_id = 6901;

  proc_username(out_username);

  IF out_username = vc_expected_username THEN
    DBMS_OUTPUT.PUT_LINE('The procedure works fine');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Expected: ' || vc_expected_username || ' Got: ' || out_username);
  END IF;
END;
/


-- delete_company procedure
CREATE OR REPLACE PROCEDURE proc_delete_company IS
  vc_company_id companies.company_id%TYPE;
BEGIN
  SELECT MAX(company_id) INTO vc_company_id FROM companies;
  -- remove all invoices for this company
  DELETE FROM invoices WHERE company_id = vc_company_id;

  -- unlink all students from this company
  UPDATE students SET company_id = NULL WHERE company_id = vc_company_id;

  -- delete the company itself
  DELETE FROM companies WHERE company_id = vc_company_id;

  DBMS_OUTPUT.PUT_LINE('Deleted company with ID ' || vc_company_id);
END proc_delete_company;
/
