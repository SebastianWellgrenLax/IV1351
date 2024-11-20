-- Insert into discount
INSERT INTO discount (type, percent) VALUES
('Sibling Discount', 15.0);

-- Insert into instrument_type
INSERT INTO instrument_type (type) VALUES
('Guitar'),
('Piano'),
('Violin'),
('Drums');

-- Insert into person
INSERT INTO person (first_name, last_name, person_number, address, email, phone_number) VALUES
('Alice', 'Smith', '123456789012', '123 Main St', 'alice@example.com', '555-1234'),
('Bob', 'Jones', '987654321098', '456 Elm St', 'bob@example.com', '555-5678'),
('Arthur', 'Morgan', '987000321098', '1 Elm St', 'rdr2@idk.com', '555-5990'),
('Grognak', 'The Destroyer', '444444444444', 'Valhallavägen 2', 'Grog@live.com', '555-3215'),
('Charlie', 'Brown', '555555555555', '789 Oak St', 'charlie@example.com', '555-8765');

-- Insert into rentable_instruments
INSERT INTO rentable_instruments (instrument_type_id, fee, brand, quantity, name) VALUES
(1, 25, 'Yamaha', 5, 'Acoustic'),
(2, 50, 'Steinway', 2, 'Grand'),
(3, 15, 'Stradivarius', 10, 'Violin'),
(4, 30, 'Roland', 3, 'DrumKit');

-- Insert into rule
INSERT INTO rule (description, name) VALUES
('No student can rent more than two instruments at a time.', 'Rent Policy'),
('Rented instruments have a lease of up to 12 months.', 'Lease Maximum');

-- Insert into skill_level
INSERT INTO skill_level (level) VALUES
('Beginner'),
('Intermediate'),
('Advanced');

-- Insert into student
INSERT INTO student (id, skill_level_id, enrolled_id) VALUES
(1, 1, 'ENR001'),
(2, 2, 'ENR002'),
(5, 3, 'ENR003');

-- Insert into student_rental
INSERT INTO student_rental (student_id, rentable_instruments_id, booking_date) VALUES
(1, 1, '2024-01-10'),
(2, 3, '2024-01-15'),
(5, 2, '2024-01-20');

-- Insert into contact_person
INSERT INTO contact_person (student_id, role, first_name, last_name, phone_number) VALUES
(1, 'Parent', 'John', 'Smith', '555-1122'),
(2, 'Guardian', 'Mary', 'Jones', '555-3344'),
(5, 'Parent', 'Paul', 'Brown', '555-5566');

-- Insert into instructor
INSERT INTO instructor (id, is_ensemble_instructor, employment_id) VALUES
(3, b'1', 'EMP002'),
(4, b'0', 'EMP003');

-- Insert into instructor_instrument
INSERT INTO instructor_instrument (instructor_id, instrument_type_id) VALUES
(3, 1),
(3, 2),
(4, 3);

-- Insert into price_table
INSERT INTO price_table (lesson_type, price, skill_level_id, date_added) VALUES
('Individual', 30, 1, '2024-01-01'),
('Individual', 40, 2, '2024-01-01'),
('Individual', 50, 3, '2024-01-01'),
('Individual', 40, 1, '2024-11-01'),
('Individual', 50, 2, '2024-11-01'),
('Individual', 60, 3, '2024-11-01'),
('Group', 20, 1, '2024-01-01'),
('Group', 30, 2, '2024-01-01'),
('Group', 40, 3, '2024-01-01'),
('Ensemble', 15, 1, '2024-01-01'),
('Ensemble', 20, 2, '2024-01-01'),
('Ensemble', 25, 3, '2024-01-01');

-- Insert into sibling
INSERT INTO sibling (student_id, sibling_id) VALUES
(1, 2),
(2, 1);

-- Insert into time_table
INSERT INTO time_table (start_time, date, instructor_id, end_time) VALUES
('10:00:00', '2024-01-10', 3, '15:00:00'),
('12:00:00', '2024-01-11', 4, '15:00:00');

-- Insert into lesson
INSERT INTO lesson (skill_level_id, time_slot, address, instructor_id, price_table_id) VALUES
(1, '2024-01-10 10:00:00', '143 Main St', 3, 10),
(2, '2024-01-11 12:00:00', '456 Elmo St', 4, 8),
(3, '2024-01-11 13:00:00', '143 Main St', 3, 3);

-- Insert into lesson_instrument
INSERT INTO lesson_instrument (instrument_type_id, lesson_id) VALUES
(1, 1),
(2, 2);

-- Insert into student_booking
INSERT INTO student_booking (student_id, lesson_id) VALUES
(1, 1),
(5, 1),
(2, 1),
(2, 2),
(5, 2),
(5, 3);

-- Insert into group_lesson
INSERT INTO group_lesson (id, maximum_participicants, minimum_participicants) VALUES
(1, 10, 3),
(2, 8, 2);

-- Insert into ensemble
INSERT INTO ensemble (id, genre) VALUES
(1, 'Classical');
