select
    training_budget,
    ceil(training_budget) as ceil,
    floor(training_budget) as floor,
    round(training_budget) as round,
    trunc(training_budget) as trunc
from companies
;

select
    ceil(m.training_budget) as ceil,
    floor(m.training_budget) as floor,
    round(m.training_budget) as round,
    trunc(m.training_budget) as trunc
from (select max(training_budget) as training_budget from companies) m
;

select
    concat(
        'Good morning ',
        concat(substr(student_firstname, 1, 2), substr(student_surname, 1, 5))
    ) as greeting
from students
;

select
    lower(
        concat(substr(student_firstname, 1, 2), substr(student_surname, 1, 5))
    ) as username
from students
;

select c.company_name, round(c.training_budget) as round, m.max_training_budget as max
from companies c, (select max(training_budget) as max_training_budget from companies) m
order by c.training_budget desc
;
