select site_id, state_ref
from sites
;

select deref(state_ref), site_id
from sites s
where s.state_ref.country = 'INDIA'
;

select s.site_id as id, s.state_ref.country as country, s.state_ref.state as state
from sites s
where state_ref is not null
;

select s.site_id as id, s.state_ref.country as country, s.state_ref.state as state
from sites s
where s.state_ref.state = 'BIHAR'
;

select site_id, address
from sites
;

desc address_type
;

select
    site_id,
    (s.address.street || ', ' || s.address.city || ', ' || s.address.country) as address
from sites s
;

select
    site_id,
    (s.address.street || ', ' || s.address.city || ', ' || s.address.country) as address
from sites s
where s.address.street = '343 ELM STREET'
;

select instructor_name as name, i.address.city as city
from instructors i
where i.address.country = 'UK'
;

select site_id, classroom
from sites
;

desc classroom_type
;

select s.site_id as id, c.room_number, c.capacity, c.description
from sites s, table(s.classroom) c
where s.site_id = 1
;

desc invoices
;

select invoice_number, invoice_item
from invoices
;

select
    i.invoice_number as invoice_no,
    it.student_surname as last_name,
    it.course_title,
    it.start_date,
    it.end_date,
    it.amount
from invoices i, table(i.invoice_item) it
where i.invoice_number = 10007
;

select value(it)
from the(select invoice_item from invoices where invoice_number = 10007) it
;
