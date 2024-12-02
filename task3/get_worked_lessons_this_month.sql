CREATE VIEW lessons_worked AS
	SELECT instructor.id AS "Instructor Id", 
		person.first_name AS "First Name", 
		person.last_name AS "Last Name", 
		COUNT(lesson.id) AS "No of Lessons"
	FROM instructor
	JOIN person ON instructor.id=person.id
	JOIN lesson ON instructor.id=lesson.instructor_id
	WHERE DATE_PART('month', lesson.time_slot)=DATE_PART('month',CURRENT_DATE) AND
		DATE_PART('year', lesson.time_slot)=DATE_PART('year',CURRENT_DATE)
	GROUP BY person.id, instructor.id;



SELECT * FROM lessons_worked
WHERE "No of Lessons" > 1;
