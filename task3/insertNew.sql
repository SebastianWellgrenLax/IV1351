-- Insert into instrument_type
INSERT INTO instrument_type (type) VALUES
('Guitar'),
('Piano'),
('Violin'),
('Drums');

-- Insert into skill_level
INSERT INTO skill_level (level) VALUES
('Beginner'),
('Intermediate'),
('Advanced');

INSERT INTO discount (type, percent) VALUES
('Sibling Discount', 15.0);

-- Insert into rule
INSERT INTO rule (description, name) VALUES
('No student can rent more than two instruments at a time.', 'Rent Policy'),
('Rented instruments have a lease of up to 12 months.', 'Lease Maximum');

-- Insert into price_table
INSERT INTO price_table (lesson_type, price, skill_level_id, date_added) VALUES
('Individual', 30, 1, '2024-01-01'),
('Individual', 40, 2, '2024-01-01'),
('Individual', 50, 3, '2024-01-01'),
('Group', 20, 1, '2024-01-01'),
('Group', 30, 2, '2024-01-01'),
('Group', 40, 3, '2024-01-01'),
('Ensemble', 15, 1, '2024-01-01'),
('Ensemble', 20, 2, '2024-01-01'),
('Ensemble', 25, 3, '2024-01-01'),
('Individual', 55, 3, '2024-01-02');

-- Insert into rentable_instruments
INSERT INTO rentable_instruments (instrument_type_id, fee, brand, quantity, name) VALUES
(1, 25, 'Yamaha', 5, 'FG820L'),
(2, 50, 'Steinway', 2, 'Model B'),
(3, 15, 'Stradivarius', 10, 'Scala Vilagio R.O. Stradivari Superieur Solo'),
(4, 30, 'Roland', 3, 'vad507');

-- Insert into person
INSERT INTO person (first_name,last_name,person_number,address,email,phone_number) VALUES
  ('Reagan','Kelley',3238730792,'P.O. Box 632, 5180 Pellentesque, St.','accumsan.laoreet.ipsum@outlook.com','1-648-659-6481'),
  ('Stuart','Kaufman',5527438331,'Ap #584-4124 Ac, St.','turpis.aliquam@outlook.ca','255-6912'),
  ('Nehru','Talley',5834453451,'P.O. Box 637, 2692 Amet Ave','felis.orci@protonmail.org','1-334-120-1803'),
  ('Keaton','Chen',9901754733,'Ap #564-4417 Ac Av.','ligula.donec.luctus@outlook.ca','1-397-518-6410'),
  ('Kuame','Yang',6870190835,'544-1042 Eget Ave','facilisis@google.com','286-0276'),
  ('Chanda','Contreras',9693705638,'500 Quis, Ave','massa.non@aol.org','505-8662'),
  ('Kevyn','Mcguire',2060959800,'Ap #505-5412 Aliquam Av.','consequat.lectus@protonmail.ca','876-2471'),
  ('Sheila','Guerra',7594604560,'P.O. Box 758, 9332 Dolor Av.','at.velit@hotmail.org','1-614-896-8753'),
  ('Bernard','Cline',6792196461,'299-7449 Montes, Street','metus.in@google.edu','1-603-847-1127'),
  ('McKenzie','Gonzales',729519711,'229-4834 Vitae Rd.','iaculis@icloud.net','512-3701'),
  ('Nolan','Vega',4268620992,'P.O. Box 971, 1488 Aliquet, Av.','suspendisse@aol.com','569-2423'),
  ('Zephr','Lara',5292909111,'P.O. Box 176, 5349 Orci Av.','nam@outlook.couk','1-470-638-8995'),
  ('Channing','Bernard',4186210041,'9138 Nunc. Avenue','suspendisse.sagittis@hotmail.couk','1-342-226-3631'),
  ('Wesley','Fitzpatrick',5215641753,'Ap #229-1091 Justo St.','phasellus.fermentum@aol.ca','1-376-824-6562'),
  ('Oliver','Montoya',8072672039,'304-7734 Integer Avenue','faucibus@yahoo.couk','371-8302'),
  ('Paul','Hess',4369417601,'P.O. Box 695, 1395 Justo Road','varius.ultrices.mauris@hotmail.org','543-5512'),
  ('Isaac','Roberson',9844156939,'646-649 Ac Rd.','tempus.eu@google.net','1-357-877-3833'),
  ('Wynter','Edwards',250807506,'P.O. Box 501, 7195 Integer Street','pede.ultrices.a@google.ca','548-7081'),
  ('Abraham','Flores',1336594635,'P.O. Box 544, 8301 Phasellus Ave','nec@aol.couk','855-9573'),
  ('Austin','Lang',2755452855,'Ap #437-1199 Integer Street','sem.molestie.sodales@google.couk','1-773-886-9841');

-- Insert into instructor
INSERT INTO instructor (id, is_ensemble_instructor, employment_id) VALUES
(1, b'1', 'EMP001'),
(2, b'0', 'EMP002'),
(7, b'1', 'EMP003'),
(10, b'0', 'EMP004');

-- Insert into instructor_instrument
INSERT INTO instructor_instrument (instructor_id, instrument_type_id) VALUES
(1, 2),
(1, 3),
(1, 4),
(2, 2),
(7, 1),
(7, 4),
(10, 3);

-- Insert into time_table
INSERT INTO time_table (start_time, date, instructor_id, end_time) VALUES
('10:00:00', '2024-01-01', 1, '15:00:00'),
('12:00:00', '2024-01-01', 2, '15:00:00'),
('10:00:00', '2024-01-01', 7, '13:00:00'),
('08:00:00', '2024-01-01', 10, '15:00:00'),
('12:00:00', '2024-01-02', 2, '17:00:00'),
('12:00:00', '2024-01-02', 7, '15:00:00');

-- Insert into student
INSERT INTO student (id, skill_level_id, enrolled_id) VALUES
(3, 1, 'ENR001'),
(4, 1, 'ENR002'),
(5, 3, 'ENR003'),
(6, 3, 'ENR004'),
(8, 2, 'ENR005'),
(9, 3, 'ENR006'),
(11, 2, 'ENR007'),
(12, 2, 'ENR008'),
(13, 1, 'ENR009'),
(14, 2, 'ENR0010'),
(15, 3, 'ENR0011'),
(16, 2, 'ENR0013'),
(17, 1, 'ENR0014'),
(18, 2, 'ENR0015'),
(19, 2, 'ENR0016'),
(20, 3, 'ENR0018');

-- Insert into sibling
INSERT INTO sibling (student_id, sibling_id) VALUES
(6, 8),
(6, 11),
(8, 6),
(8, 11),
(11, 6),
(11, 8),
(15, 16),
(16, 15);

-- Insert into student_rental
INSERT INTO student_rental (student_id, rentable_instruments_id, booking_date) VALUES
(6, 1, '2024-01-10'),
(12, 3, '2024-01-15'),
(19, 2, '2024-01-20');

-- Insert into contact_person
INSERT INTO contact_person (student_id, role, first_name, last_name, phone_number) VALUES
(9, 'Parent', 'John', 'Smith', '555-1122'),
(13, 'Guardian', 'Mary', 'Jones', '555-3344'),
(19, 'Parent', 'Paul', 'Brown', '555-5566');

-- Insert into lesson
INSERT INTO lesson (skill_level_id, time_slot, address, instructor_id, price_table_id) VALUES
(1, '2024-12-10 10:00:00', '143 Main St', 1, 7),
(2, '2024-01-02 10:00:00', '456 Elmo St', 10, 5),
(3, '2024-04-01 12:00:00', '143 Main St', 1, 3),
(1, '2024-06-02 13:00:00', '456 Elmo St', 2, 4),
(3, '2024-03-02 12:00:00', '143 Main St', 7, 10),
(3, '2024-12-19 04:00:00', 'P.O. Box 741, 8938 Vulputate Avenue', 1, 7),
(3, '2024-12-21 07:00:00', 'Ap #641-4517 Cum St.', 10, 5),
(2, '2024-02-04 15:00:00', '552-6343 Nisi Ave', 1, 3),
(2, '2024-03-17 21:00:00', 'Ap #672-3665 Tincidunt Rd.', 2, 4),
(2, '2024-11-12 13:00:00', '5165 Congue Ave', 7, 10),
(1, '2024-05-26 10:00:00', '143 Main St', 1, 7),
(2, '2024-01-09 10:00:00', '456 Elmo St', 10, 5),
(3, '2024-02-11 12:00:00', '143 Main St', 1, 3),
(1, '2024-10-02 13:00:00', '456 Elmo St', 2, 4),
(3, '2024-07-22 12:00:00', '143 Main St', 7, 10);

-- Insert into group_lesson
INSERT INTO group_lesson (id, maximum_participicants, minimum_participicants) VALUES
(1, 10, 3),
(2, 8, 2),
(4, 8, 2),
(6, 2, 1),
(7, 10, 3);

-- Insert into ensemble
INSERT INTO ensemble (id, genre) VALUES
(1, 'Classical'),
(6, 'Throat Sining'),
(7, 'Phonk');

-- Insert into lesson_instrument
INSERT INTO lesson_instrument (instrument_type_id, lesson_id) VALUES
(2, 1),
(3, 1),
(3, 2),
(2, 3),
(2, 4),
(4, 5);

-- Insert into student_booking
INSERT INTO student_booking (student_id, lesson_id) VALUES
(11, 1),
(15, 1),
(17, 1),
(6, 1),
(12, 1),
(9, 2),
(8, 2),
(15, 3),
(20, 4),
(16, 4),
(18, 4),
(6, 5);
