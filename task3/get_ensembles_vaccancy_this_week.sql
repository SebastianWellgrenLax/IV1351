CREATE VIEW ensemble_vaccancies_next_week AS
	SELECT 
		TO_CHAR(time_slot, 'Dy') AS "Day",
	    ensemble.genre AS "Genre",
		CASE 
			WHEN group_lesson.maximum_participicants - COUNT(student_booking.student_id) = 0 THEN 'No Seats'
			WHEN group_lesson.maximum_participicants - COUNT(student_booking.student_id) > 2 THEN 'Many Seats'
		ELSE 
			'1 or 2 Seats'
		END AS "No of Free Slots"
	FROM ensemble
	JOIN group_lesson ON ensemble.id = group_lesson.id
	JOIN lesson ON group_lesson.id = lesson.id
	LEFT JOIN student_booking ON lesson.id = student_booking.lesson_id
	WHERE 
	(
		DATE_PART('year', lesson.time_slot) = DATE_PART('year', CURRENT_DATE + interval '1 week')
		AND DATE_PART('week', lesson.time_slot) = DATE_PART('week', CURRENT_DATE + interval '1 week')
	)
	GROUP BY ensemble.id, group_lesson.maximum_participicants, lesson.time_slot;



SELECT * FROM ensemble_vaccancies_next_week;
