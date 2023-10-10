-- @/Users/macintosh/school/ord/practicals/09_object_inserting.sql
INSERT INTO bill_addresses (street, city, country) VALUES ('54 FESTIVE ROAD', 'NORTHAMPTON', 'UK');
INSERT INTO bill_addresses (street, city, country) VALUES ('30 ENGLISH STREET', 'BEDFORD', 'UK');

INSERT INTO customers (customer_id, customer_name, invoice_address)
  SELECT 1, 'MANDY MORRELL', REF(b) FROM bill_addresses b WHERE b.street = '54 FESTIVE ROAD';

INSERT INTO states (state, country) VALUES ('BIHAR', 'INDIA');

UPDATE sites s
SET s.state = (SELECT REF(st) FROM states st WHERE st.state = 'BIHAR')
WHERE s.site_id = 1;

INSERT INTO customers (customer_id, customer_name, invoice_address)
  VALUES(2, 'CAROLE MORRELL', invoice_address_type('1 MY WAY', 'LUTON', 'UK'));

INSERT INTO states (state, country) VALUES ('ALBERTA', 'CANADA');
INSERT INTO states (state, country) VALUES ('VICTORIA', 'AUSTRALIA');
INSERT INTO states (state, country) VALUES ('QUEENSLAND', 'AUSTRALIA');
INSERT INTO states (state, country) VALUES ('DELHI', 'INDIA');

INSERT INTO sites (site_id, address, state)
  SELECT 10, address_type('20 BOURNE STREET', 'VICTORIA', 'AUSTRALIA'), REF(st)
FROM states st 
WHERE st.state = 'QUEENSLAND';

INSERT INTO prospective_customers (prospective_customer_id, company_name, contact_name, social_media_available)
VALUES (80000, 'ACME', 'JOHN DOE', social_media_varray_type(
  social_media_type('FACEBOOK', 'JOHN SMITH'),
  social_media_type('TWITTER', '@JOHNSMITH'),
  social_media_type('TIKTOK', 'JDMAN')
));
INSERT INTO prospective_customers (prospective_customer_id, company_name, contact_name, social_media_available)
VALUES (80001, 'KINGSMAN', 'MARY SMITH', social_media_varray_type(
  social_media_type('INSTAGRAM', 'MARY SMITH'),
  social_media_type('TWITTER', '@MARYSMITH'),
  social_media_type('SNAPCHAT', 'MARYSMITHY')
));

INSERT INTO adverts (advert_id, advert_title, description, social_media_used)
VALUES (90000, 'CLEARANCE SALE', '25% OFF ON ALL ITEMS', social_media_table_type(
  social_media_type('FACEBOOK', 'GLEAM STORE'),
  social_media_type('TWITTER', '@GLEAMSTORE'),
  social_media_type('LINKEDIN', 'GLEAM STORE')
));


INSERT INTO sites (site_id, address, classroom, location, state)
VALUES (9, address_type('20 BOURNE STREET', 'VICTORIA', 'AUSTRALIA'), 
  classroom_varray_type(
    classroom_type('A11', 40, '1ST FLOOR'),
    classroom_type('A12', 40, '1ST FLOOR'),
    classroom_type('Q13', 60, '4TH FLOOR')
  ),
  'VICTORIA',
  (SELECT REF(st) FROM states st WHERE st.state = 'VICTORIA')
);

INSERT INTO sites (site_id, address, location, state)
  SELECT 11, address_type('20 BOURNE STREET', 'VICTORIA', 'AUSTRALIA'), 'VICTORIA', REF(st) 
  FROM states st 
  WHERE st.state = 'VICTORIA';

UPDATE sites SET classroom = classroom_varray_type(
    classroom_type('B12', 40, '1ST FLOOR'),
    classroom_type('D19', 30, '2ND FLOOR'),
    classroom_type('Q16', 60, '4TH FLOOR')
  )
WHERE site_id = 11;
