select s.address.city as city, s.address.country as country
from sites s
where s.address.country = 'USA'
union
select i.address.city as city, i.address.country as country
from instructors i
where i.address.country = 'USA'
;

select s.address.city as city, s.address.country as country
from sites s
where s.address.country = 'USA'
intersect
select i.address.city as city, i.address.country as country
from instructors i
where i.address.country = 'USA'
;

select s.address.city as city, s.address.country as country
from sites s
minus
select i.address.city as city, i.address.country as country
from instructors i
;

-- select all addresses
select a.street, a.city, a.country
from addresses a
minus
-- select addresses of students and instructors
(
    select st.address.street, st.address.city, st.address.country
    from students st
    union
    select i.address.street, i.address.city, i.address.country
    from instructors i
)
;

select instructor_name as name, salary
from instructors
where salary in (2000, 2500, 3000)
;

select instructor_id as id, instructor_name as name
from instructors
where instructor_name like 'S%'
;

select instructor_id as id, instructor_name as name
from instructors
where salary between 2000 and 3000
;

-- number of times students have attended classes
select count(offering_id) as total_attendance
from attendance
;

-- list student_id and  number of courses the student has attended
select student_id as id, count(student_id) as total_attendance
from attendance
group by student_id
;

-- get student(s) that has(ve) attended the most courses
select
    a.student_id as id,
    (s.student_firstname || ' ' || s.student_surname) as name,
    count(a.student_id) as total_attendance
from attendance a
join students s on a.student_id = s.student_id
group by a.student_id, s.student_firstname, s.student_surname
order by total_attendance desc
;

-- get students with student_id greater than 6000
select student_id as id, count(student_id) as total_attendance
from attendance
where student_id > 6000
group by student_id
;

-- get students with average evaluation at least 4
select a.student_id as id, avg(a.evaluation) as average_evaluation
from attendance a
group by a.student_id
having avg(a.evaluation) >= 4
;

-- get students with average evaluation at least 4, including the total number of
-- courses attended
select a.student_id as id, sum(amount_paid) as total_amount_paid
from attendance a
group by a.student_id
order by total_amount_paid desc
;

-- ------------ totally unnecessary, but just for fun - highest amount paid
select max(total_amount_paid) as highest_amount_paid
from
    (
        select sum(amount_paid) as total_amount_paid
        from attendance a
        group by a.student_id
    )
;

-- total amount paid for each offering
select a.offering_id as id, sum(a.amount_paid) as total_amount_paid
from attendance a
group by offering_id
order by total_amount_paid desc
;

-- min, max and average evaluation for each offering
select
    min(evaluation) as min_evaluation,
    avg(evaluation) as average_evaluation,
    max(evaluation) as max_evaluation
from attendance
group by offering_id
;

-- get offering(s) with min evaluation at most 2.5
select offering_id, min(evaluation) as min_evaluation
from attendance
group by offering_id
having min(evaluation) < 2.5
;
