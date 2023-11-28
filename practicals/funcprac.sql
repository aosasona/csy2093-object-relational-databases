DROP FUNCTION func_voucher_ct;
DROP PROCEDURE proc_using_func;


SELECT COUNT(*) FROM students WHERE voucher IS NOT NULL;

-- function to count students with voucher
CREATE OR REPLACE FUNCTION func_voucher_ct RETURN NUMBER IS
  vn_voucher_ct NUMBER(3);
BEGIN
  SELECT COUNT(*) INTO vn_voucher_ct FROM students WHERE voucher IS NOT NULL;
  RETURN vn_voucher_ct;
END func_voucher_ct;
/

SHOW ERRORS;

-- procedure to test func_voucher_ct function
CREATE OR REPLACE PROCEDURE proc_using_func IS
  vn_no_of_vouchers NUMBER(3);
BEGIN
  vn_no_of_vouchers  := func_voucher_ct;
  DBMS_OUTPUT.PUT_LINE('There are ' || vn_no_of_vouchers || ' student(s) who have vouchers');
END proc_using_func;
/

SHOW ERRORS;
