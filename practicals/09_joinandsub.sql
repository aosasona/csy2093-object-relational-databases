select s.subject_name, c.course_id, c.title
from courses c
join subject_areas s on c.subject_id = s.subject_id
;

select c.course_id, o.offering_id, c.title, i.instructor_name
from courses c
join offerings o on c.course_id = o.course_id
join instructors i on i.instructor_id = o.instructor_id
;

column title format a16
;
select c.course_id, o.offering_id, c.title, c.cost, i.instructor_name
from courses c
join offerings o on c.course_id = o.course_id
join instructors i on i.instructor_id = o.instructor_id
order by c.cost asc
;

column has_attended_class format a20
;
select
    s.student_id,
    s.student_firstname as first_name,
    s.student_surname as last_name,
    (case when count(a.offering_id) > 0 then 'YES' else 'NO' end) as has_attended_class
from students s
left outer join attendance a on a.student_id = s.student_id
group by s.student_id, s.student_firstname, s.student_surname
order by first_name, last_name asc
;

-- using alt method
column has_attended_class format a20
;
select
    s.student_id,
    s.student_firstname as first_name,
    s.student_surname as last_name,
    (case when count(a.offering_id) > 0 then 'YES' else 'NO' end) as has_attended_class
from students s
right outer join attendance a on a.student_id = s.student_id
group by s.student_id, s.student_firstname, s.student_surname
order by first_name, last_name asc
;

select s.site_id, o.offering_id, c.course_id, c.title as course_title
from sites s
full outer join offerings o on s.site_id = o.site_id
full outer join courses c on c.course_id = o.course_id
order by s.site_id, o.offering_id, c.course_id asc
;

column sid format 999
;
select s.site_id as sid, s.location, c.title as course_title, sa.subject_name
from sites s
left join offerings o on s.site_id = o.site_id
left join courses c on c.course_id = o.course_id
left join subject_areas sa on sa.subject_id = c.subject_id
;

select student_surname as last_name
from students
where company_id in (select company_id from companies where city = 'AMSTERDAM')
;

select a.city
from addresses a
where
    a.city
    in (select s.address.city as city from sites s where s.address.country = 'USA')
    and a.city in (
        select i.address.city as city from instructors i where i.address.country = 'USA'
    )
;

select a.*
from addresses a
where a.street not in (select i.address.street from instructors i)
;
