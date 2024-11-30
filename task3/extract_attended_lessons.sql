--Main DB code to extract attended lessons in correct format
SELECT 
CASE 
	WHEN group_lesson.id IS NULL AND ensemble.id IS NULL THEN 'Individual'
    WHEN ensemble.id IS NULL THEN 'Group'
ELSE 
	'Ensemble'
END AS "lesson type",
genre,
STRING_AGG(type, ', ') AS "instrument",
price AS "lesson price",
CONCAT(first_name, ' ', Last_name) AS "student name",
email AS "student email"
FROM student_booking
JOIN student ON student_booking.student_id=student.id
JOIN person ON student.id=person.id
JOIN lesson ON student_booking.lesson_id=lesson.id
JOIN lesson_instrument ON lesson.id=lesson_instrument.lesson_id
JOIN price_table ON lesson.price_table_id=price_table.id
JOIN instrument_type ON lesson_instrument.instrument_type_id=instrument_type.id
LEFT JOIN group_lesson ON lesson.id=group_lesson.id
LEFT JOIN ensemble ON group_lesson.id=ensemble.id
GROUP BY "lesson type", genre, price, first_name, last_name, email


--Create DB code for historical DB
CREATE TABLE historical_lesson (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 lesson_type VARCHAR(100) NOT NULL,
 genre VARCHAR(100),
 instrument VARCHAR(100) NOT NULL,
 lesson_price INT NOT NULL,
 student_name VARCHAR(500) NOT NULL,
 student_mail VARCHAR(500) NOT NULL
);

ALTER TABLE historical_lesson ADD CONSTRAINT PK_historical_lesson PRIMARY KEY (id);

--Example insert code for historical DB
INSERT INTO historical_lesson (lesson_type,genre,instrument,lesson_price,student_name,student_mail) VALUES
('Ensemble','Classical','Violin, Piano',15,'Chanda Contreras','massa.non@aol.org');