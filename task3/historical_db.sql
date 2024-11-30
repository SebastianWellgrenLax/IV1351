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


