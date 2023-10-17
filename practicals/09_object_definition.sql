-- @/Users/macintosh/school/ord/practicals/09_object_definition.sql
CREATE OR REPLACE TYPE invoice_address_type AS OBJECT (
  street VARCHAR2(25),
  city VARCHAR2(25),
  country VARCHAR2(25)
);
/

CREATE TABLE customers (
  customer_id NUMBER(6),
  customer_name VARCHAR2(25),
  invoice_address invoice_address_type
);

CREATE TABLE bill_addresses OF invoice_address_type;

DROP TABLE customers;

CREATE TABLE customers (
  customer_id NUMBER(6),
  customer_name VARCHAR2(25),
  invoice_address REF invoice_address_type SCOPE IS bill_addresses
);

CREATE OR REPLACE TYPE state_type AS OBJECT (
  state VARCHAR2(25),
  country VARCHAR2(25)
);
/

CREATE TABLE states OF state_type;

ALTER TABLE sites ADD (
  state_ref REF state_type SCOPE IS states
);

select object_name, object_type
from user_objects
;

-- DROP TABLE states;
-- DROP TABLE bill_addresses;
-- DROP TABLE customers;
-- DROP TYPE state_type;
-- DROP TYPE invoice_address_type;
CREATE OR REPLACE TYPE social_media_type AS OBJECT (
  media_name VARCHAR2(25),
  contact VARCHAR2(50)
);
/

CREATE TYPE social_media_varray_type AS VARRAY(50) OF social_media_type;
/

CREATE TABLE prospective_customers (
  prospective_customer_id NUMBER(6),
  company_name VARCHAR2(50),
  contact_name VARCHAR2(25),
  social_media_available social_media_varray_type
);

CREATE TYPE social_media_table_type AS TABLE OF social_media_type;
/

CREATE TABLE adverts (
  advert_id NUMBER(6),
  advert_title VARCHAR2(50),
  description VARCHAR2(25),
  social_media_used social_media_table_type)
NESTED TABLE social_media_used STORE AS social_media_table;

-- DROP TABLE adverts;
-- DROP TABLE prospective_customers;
-- DROP TYPE social_media_table_type;
-- DROP TYPE social_media_varray_type;
-- DROP TYPE social_media_type;
