SET SERVEROUTPUT ON;

DECLARE
	vn_counter NUMBER(2) := 1;
	vc_firstname VARCHAR2(20) := 'Ayodeji';
	vc_surname VARCHAR2(20) := 'Osasona';
	vn_length NUMBER(3) := LENGTH(vc_firstname);
BEGIN
	LOOP
		EXIT WHEN vn_counter > vn_length;

		DBMS_OUTPUT.PUT_LINE(SUBSTR(vc_firstname, vn_counter, 1));
		vn_counter := vn_counter + 1;
	END LOOP;
	DBMS_OUTPUT.PUT_LINE(vc_surname);
END;
/

-- using while loop
DECLARE
	vn_counter NUMBER(2) := 1;
	vc_firstname VARCHAR2(20) := 'Ayodeji';
	vc_surname VARCHAR2(20) := 'Osasona';
	vn_length NUMBER(3) := LENGTH(vc_firstname);
BEGIN
	WHILE vn_counter <= vn_length LOOP
		DBMS_OUTPUT.PUT_LINE(SUBSTR(vc_firstname, vn_counter, 1));
		vn_counter := vn_counter + 1;
	END LOOP;
	DBMS_OUTPUT.PUT_LINE(vc_surname);
END;
/

-- using a FOR-IN loop
DECLARE
	vn_counter NUMBER(2) := 1;
	vc_firstname VARCHAR2(20) := 'Ayodeji';
	vc_surname VARCHAR2(20) := 'Osasona';
	vn_length NUMBER(3) := LENGTH(vc_firstname);
BEGIN
	FOR vn_counter IN 1..vn_length LOOP
		DBMS_OUTPUT.PUT_LINE(SUBSTR(vc_firstname, vn_counter, 1));
	END LOOP;
	DBMS_OUTPUT.PUT_LINE(vc_surname);
END;
/

-- bonus activity 1
DECLARE
	vc_firstname VARCHAR2(20) := 'Ayodeji';
	vc_middlename VARCHAR2(20) := 'Jesudarasimi';
	vc_surname VARCHAR2(20) := 'Osasona';
	vn_counter NUMBER(2) := 1;
	vn_length NUMBER(3) := LENGTH(vc_firstname);
BEGIN
	DBMS_OUTPUT.PUT_LINE('--- firstname ---');
	LOOP
		EXIT WHEN vn_counter > vn_length;

		DBMS_OUTPUT.PUT_LINE(SUBSTR(vc_firstname, vn_counter, 1));
		vn_counter := vn_counter + 1;
	END LOOP;

	vn_counter := 1;
	vn_length := LENGTH(vc_middlename);

	DBMS_OUTPUT.PUT_LINE('--- middlename ---');
	WHILE vn_counter <= vn_length LOOP
		DBMS_OUTPUT.PUT_LINE(SUBSTR(vc_middlename, vn_counter, 1));
		vn_counter := vn_counter + 1;
	END LOOP;

	vn_counter := 1;
	vn_length := LENGTH(vc_surname);

	DBMS_OUTPUT.PUT_LINE('--- surname ---');
	FOR vn_counter IN 1..vn_length LOOP
		DBMS_OUTPUT.PUT_LINE(SUBSTR(vc_surname, vn_counter, 1));
	END LOOP;
END;
/

-- bonus activity 2
DECLARE
	vc_letters VARCHAR2(5) := 'ABCDE';
	vn_numbers VARCHAR2(4) := '1234';
BEGIN
	FOR i IN 1..LENGTH(vc_letters) LOOP
		DBMS_OUTPUT.PUT_LINE(SUBSTR(vc_letters, i, 1));
		FOR j IN 1..LENGTH(vn_numbers) LOOP
			DBMS_OUTPUT.PUT_LINE(SUBSTR(vn_numbers, j, 1));
		END LOOP;
	END LOOP;
END;
/