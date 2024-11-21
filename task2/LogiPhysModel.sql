CREATE TABLE discount (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 type VARCHAR(500) NOT NULL,
 percent FLOAT(10) NOT NULL
);

ALTER TABLE discount ADD CONSTRAINT PK_discount PRIMARY KEY (id);


CREATE TABLE instrument_type (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 type VARCHAR(500) NOT NULL
);

ALTER TABLE instrument_type ADD CONSTRAINT PK_instrument_type PRIMARY KEY (id);


CREATE TABLE person (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 first_name VARCHAR(500) NOT NULL,
 last_name VARCHAR(500) NOT NULL,
 person_number VARCHAR(12) NOT NULL,
 address VARCHAR(500) NOT NULL,
 email VARCHAR(500) NOT NULL,
 phone_number VARCHAR(100) NOT NULL
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (id);


CREATE TABLE rentable_instruments (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_type_id INT NOT NULL,
 fee INT NOT NULL,
 brand VARCHAR(500) NOT NULL,
 quantity INT NOT NULL,
 name VARCHAR(500)
);

ALTER TABLE rentable_instruments ADD CONSTRAINT PK_rentable_instruments PRIMARY KEY (id);


CREATE TABLE rule (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 description VARCHAR(2000),
 name VARCHAR(500)
);

ALTER TABLE rule ADD CONSTRAINT PK_rule PRIMARY KEY (id);


CREATE TABLE skill_level (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 level VARCHAR(20) NOT NULL
);

ALTER TABLE skill_level ADD CONSTRAINT PK_skill_level PRIMARY KEY (id);


CREATE TABLE student (
 id INT NOT NULL,
 skill_level_id INT NOT NULL,
 enrolled_id VARCHAR(500) NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (id);


CREATE TABLE student_rental (
 student_id INT NOT NULL,
 rentable_instruments_id INT NOT NULL,
 booking_date DATE NOT NULL
);

ALTER TABLE student_rental ADD CONSTRAINT PK_student_rental PRIMARY KEY (student_id,rentable_instruments_id);


CREATE TABLE contact_person (
 student_id INT NOT NULL,
 role VARCHAR(20) NOT NULL,
 first_name VARCHAR(500) NOT NULL,
 last_name VARCHAR(500) NOT NULL,
 phone_number VARCHAR(100) NOT NULL
);

ALTER TABLE contact_person ADD CONSTRAINT PK_contact_person PRIMARY KEY (student_id);


CREATE TABLE instructor (
 id INT NOT NULL,
 is_ensemble_instructor BIT(1) NOT NULL,
 employment_id VARCHAR(500) NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (id);


CREATE TABLE instructor_instrument (
 instructor_id INT NOT NULL,
 instrument_type_id INT NOT NULL
);

ALTER TABLE instructor_instrument ADD CONSTRAINT PK_instructor_instrument PRIMARY KEY (instructor_id,instrument_type_id);


CREATE TABLE price_table (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 lesson_type VARCHAR(20) NOT NULL,
 price INT NOT NULL,
 skill_level_id INT NOT NULL,
 date_added TIMESTAMP(0)
);

ALTER TABLE price_table ADD CONSTRAINT PK_price_table PRIMARY KEY (id);


CREATE TABLE sibling (
 student_id INT NOT NULL,
 sibling_id INT NOT NULL
);

ALTER TABLE sibling ADD CONSTRAINT PK_sibling PRIMARY KEY (student_id,sibling_id);


CREATE TABLE time_table (
 start_time TIME(0) NOT NULL,
 date DATE NOT NULL,
 instructor_id INT NOT NULL,
 end_time TIME(0) NOT NULL
);

ALTER TABLE time_table ADD CONSTRAINT PK_time_table PRIMARY KEY (start_time,date,instructor_id);


CREATE TABLE lesson (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 skill_level_id INT NOT NULL,
 time_slot TIMESTAMP(0) NOT NULL,
 address VARCHAR(500) NOT NULL,
 instructor_id INT NOT NULL,
 price_table_id INT NOT NULL
);

ALTER TABLE lesson ADD CONSTRAINT PK_lesson PRIMARY KEY (id);


CREATE TABLE lesson_instrument (
 instrument_type_id INT NOT NULL,
 lesson_id INT NOT NULL
);

ALTER TABLE lesson_instrument ADD CONSTRAINT PK_lesson_instrument PRIMARY KEY (instrument_type_id,lesson_id);


CREATE TABLE student_booking (
 student_id INT NOT NULL,
 lesson_id INT NOT NULL
);

ALTER TABLE student_booking ADD CONSTRAINT PK_student_booking PRIMARY KEY (student_id,lesson_id);


CREATE TABLE group_lesson (
 id INT NOT NULL,
 maximum_participicants INT NOT NULL,
 minimum_participicants INT NOT NULL
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (id);


CREATE TABLE ensemble (
 id INT NOT NULL,
 genre VARCHAR(100) NOT NULL
);

ALTER TABLE ensemble ADD CONSTRAINT PK_ensemble PRIMARY KEY (id);


ALTER TABLE rentable_instruments ADD CONSTRAINT FK_rentable_instruments_0 FOREIGN KEY (instrument_type_id) REFERENCES instrument_type (id);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (id) REFERENCES person (id);
ALTER TABLE student ADD CONSTRAINT FK_student_1 FOREIGN KEY (skill_level_id) REFERENCES skill_level (id);


ALTER TABLE student_rental ADD CONSTRAINT FK_student_rental_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE student_rental ADD CONSTRAINT FK_student_rental_1 FOREIGN KEY (rentable_instruments_id) REFERENCES rentable_instruments (id);


ALTER TABLE contact_person ADD CONSTRAINT FK_contact_person_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (id) REFERENCES person (id);


ALTER TABLE instructor_instrument ADD CONSTRAINT FK_instructor_instrument_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);
ALTER TABLE instructor_instrument ADD CONSTRAINT FK_instructor_instrument_1 FOREIGN KEY (instrument_type_id) REFERENCES instrument_type (id);


ALTER TABLE price_table ADD CONSTRAINT FK_price_table_0 FOREIGN KEY (skill_level_id) REFERENCES skill_level (id);


ALTER TABLE sibling ADD CONSTRAINT FK_sibling_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE sibling ADD CONSTRAINT FK_sibling_1 FOREIGN KEY (sibling_id) REFERENCES student (id);


ALTER TABLE time_table ADD CONSTRAINT FK_time_table_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE lesson ADD CONSTRAINT FK_lesson_0 FOREIGN KEY (skill_level_id) REFERENCES skill_level (id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_1 FOREIGN KEY (instructor_id) REFERENCES instructor (id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_2 FOREIGN KEY (price_table_id) REFERENCES price_table (id);


ALTER TABLE lesson_instrument ADD CONSTRAINT FK_lesson_instrument_0 FOREIGN KEY (instrument_type_id) REFERENCES instrument_type (id);
ALTER TABLE lesson_instrument ADD CONSTRAINT FK_lesson_instrument_1 FOREIGN KEY (lesson_id) REFERENCES lesson (id);


ALTER TABLE student_booking ADD CONSTRAINT FK_student_booking_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE student_booking ADD CONSTRAINT FK_student_booking_1 FOREIGN KEY (lesson_id) REFERENCES lesson (id);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (id) REFERENCES lesson (id);


ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_0 FOREIGN KEY (id) REFERENCES group_lesson (id);


