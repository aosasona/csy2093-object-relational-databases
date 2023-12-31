/* CreateCourse */
-- RunCommand @/Users/macintosh/school/ord/practicals/CreateCourse_09.sql
CREATE OR REPLACE TYPE address_type AS OBJECT (
street           VARCHAR2(25),
city             VARCHAR2(25),
country          VARCHAR2(20))
/

CREATE TABLE addresses OF address_type;

CREATE TABLE students (
student_id              NUMBER(6),
student_firstname   VARCHAR2(20)        NOT NULL,
student_surname     VARCHAR2(20)        NOT NULL,
address             REF address_type SCOPE IS addresses,
phone_number        VARCHAR2(15),
gender              CHAR(2),
date_of_birth       DATE,
description         VARCHAR2(250),
preferred_language  VARCHAR2(2),
voucher             CHAR,
company_id          NUMBER(6));


CREATE TABLE instructors (
instructor_id   NUMBER(6),
instructor_name VARCHAR2(15)        NOT NULL,
address         REF address_type SCOPE IS addresses,
salary          NUMBER(10,2),
commission      NUMBER(10,2),
mentor_id       NUMBER(6),
date_hired      DATE,
profile         CLOB);

CREATE TABLE courses (
course_id       NUMBER(6),
title           VARCHAR2(30),
duration        NUMBER(6),
cost            NUMBER(10,2),
subject_id      NUMBER(6),
brochure        BFILE);

CREATE TABLE subject_areas (
subject_id      NUMBER(6),
subject_name    VARCHAR2(30));

CREATE TABLE offerings (
offering_id     NUMBER(6),
course_id       NUMBER(6)       NOT NULL,
site_id         NUMBER(6)       NOT NULL,
instructor_id   NUMBER(6),
start_date      DATE,
max_no_students NUMBER(6));

CREATE TYPE classroom_type AS OBJECT(
room_number VARCHAR2(6),
capacity NUMBER(6),
description VARCHAR2(200));
/

CREATE TYPE classroom_varray_type AS VARRAY(50) OF classroom_type;
/

CREATE TABLE sites (
site_id         NUMBER(6),
address         address_type,
classroom       classroom_varray_type,
location        VARCHAR2(12));

CREATE TABLE attendance (
offering_id     NUMBER(6),
student_id      NUMBER(6)       NOT NULL,
start_date      DATE,
evaluation      NUMBER(6,2),
amount_paid     NUMBER(10,2));

CREATE OR REPLACE TYPE invoice_item_type AS OBJECT(
student_surname         VARCHAR2(15),
course_title            VARCHAR2(30), 
start_date              DATE,
end_date                DATE, 
amount                  NUMBER(10,2));
/

CREATE TYPE invoice_item_table_type AS TABLE OF invoice_item_type;
/

CREATE TABLE invoices(
invoice_number      NUMBER(6),
company_id          NUMBER(6) NOT NULL,
billing_date        DATE NOT NULL,
due_date            DATE,
invoice_item        invoice_item_table_type)
NESTED TABLE invoice_item STORE AS invoice_item_table;

CREATE TABLE companies (
  company_id NUMBER(6),
  company_name VARCHAR2(15),
  city VARCHAR2(12),
  industry VARCHAR2(15),
  no_employees NUMBER(5),
  revenue NUMBER(12,2),
  training_budget NUMBER(12, 2)
);
