-- @/Users/macintosh/school/ord/practicals/09_prac1.sql
column name heading 'First Name|Last Name'
;
column gender format a8
;
column gender heading 'F/M/NB'
;
select student_firstname || ', ' || student_surname as name, gender, phone_number
from students
where gender = 'F'
order by student_surname
;
