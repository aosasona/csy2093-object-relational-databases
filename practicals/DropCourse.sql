/* DropCourse */
/*

@/Users/macintosh/school/ord/practicals/DropCourse.sql
@/Users/macintosh/school/ord/practicals/CreateCourse.sql
@/Users/macintosh/school/ord/practicals/AlterCourse.sql
@/Users/macintosh/school/ord/practicals/InsertCourse.sql

*/
DROP TABLE invoices;
DROP TABLE attendance;
DROP TABLE offerings;
DROP TABLE courses;
DROP TABLE instructors;
DROP TABLE subject_areas;
DROP TABLE students;
DROP TABLE sites;
DROP TABLE addresses;
DROP TABLE companies;

DROP TYPE address_type;
DROP TYPE invoice_item_table_type;
DROP TYPE invoice_item_type;
DROP TYPE classroom_varray_type;
DROP TYPE classroom_type;

purge recyclebin
;
column object_name format a30
;
column object_type format a12
;
select object_name, object_type
from user_objects
;

-- SELECT * FROM tab;
-- SELECT * FROM user_types;
-- SELECT * FROM user_constraints;

