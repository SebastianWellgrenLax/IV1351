CREATE MATERIALIZED VIEW number_of_siblings AS
	SELECT no_of_siblings AS "No of Siblings",
	COUNT(no_of_siblings) AS "No of Students" 
	FROM(
		SELECT student.id, 
			COUNT(sibling_id) AS no_of_siblings 
		FROM sibling
		FULL JOIN student ON student.id=sibling.student_id
		GROUP BY student.id
	)
	GROUP BY no_of_siblings
	ORDER BY no_of_siblings;



SELECT * FROM number_of_siblings;