/* AlterCourse */
-- RunCommand @/Users/macintosh/school/ord/practicals/AlterCourse_09.sql
-- PKs
ALTER TABLE subject_areas
ADD CONSTRAINT pk_subject_areas
PRIMARY KEY (subject_id);

ALTER TABLE courses
ADD CONSTRAINT pk_courses
PRIMARY KEY (course_id);

ALTER TABLE instructors
ADD CONSTRAINT pk_instructors
PRIMARY KEY (instructor_id);

ALTER TABLE offerings
ADD CONSTRAINT pk_offerings
PRIMARY KEY (offering_id);

ALTER TABLE attendance
ADD CONSTRAINT pk_attendance
PRIMARY KEY (offering_id, student_id, start_date);

ALTER TABLE sites
ADD CONSTRAINT pk_sites
PRIMARY KEY (site_id);

ALTER TABLE students
ADD CONSTRAINT pk_students
PRIMARY KEY (student_id);

ALTER TABLE invoices
ADD CONSTRAINT pk_invoices
PRIMARY KEY (invoice_number); 

ALTER TABLE companies
ADD CONSTRAINT pk_companies
PRIMARY KEY (company_id);


-- FKs
ALTER TABLE courses
ADD CONSTRAINT fk_c_subject_areas
FOREIGN KEY (subject_id)
REFERENCES subject_areas(subject_id);

ALTER TABLE offerings
ADD CONSTRAINT fk_o_sites
FOREIGN KEY (site_id)
REFERENCES sites(site_id);

ALTER TABLE offerings
ADD CONSTRAINT fk_o_courses
FOREIGN KEY (course_id)
REFERENCES courses(course_id);

ALTER TABLE offerings
ADD CONSTRAINT fk_o_instructors
FOREIGN KEY (instructor_id)
REFERENCES instructors(instructor_id);

ALTER TABLE attendance
ADD CONSTRAINT fk_a_students
FOREIGN KEY (student_id)
REFERENCES students(student_id);

ALTER TABLE students
ADD CONSTRAINT fk_s_companies
FOREIGN KEY (company_id)
REFERENCES companies(company_id);

ALTER TABLE invoices
ADD CONSTRAINT fk_i_companies
FOREIGN KEY (company_id)
REFERENCES companies(company_id);

-- CHECK 
ALTER TABLE students
ADD CONSTRAINT ck_student_firstname
CHECK (student_firstname = upper(student_firstname));

ALTER TABLE students
ADD CONSTRAINT ck_student_surname
CHECK (student_surname = upper(student_surname));

ALTER TABLE courses
ADD CONSTRAINT ck_duration
CHECK (duration IN (3,5));
