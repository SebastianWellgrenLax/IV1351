CREATE MATERIALIZED VIEW lessons_per_month AS
	SELECT TO_CHAR(time_slot, 'YYYY') AS "Year",
		   TO_CHAR(time_slot, 'Mon') AS "Month",
		   COUNT(DATE_PART('month', time_slot)) AS "Total",
		   COUNT(lesson.id) FILTER (WHERE group_lesson.id IS NULL) AS "Individual",
		   COUNT(group_lesson.id) FILTER (WHERE ensemble.id IS NULL)AS "Group",
		   COUNT(ensemble.id) AS "Ensemble"
	FROM lesson
	FULL JOIN group_lesson ON lesson.id=group_lesson.id
	FULL JOIN ensemble ON group_lesson.id=ensemble.id
	GROUP BY DATE_PART('month', time_slot), "Month", DATE_PART('year', time_slot), "Year"
	ORDER BY DATE_PART('month', time_slot);



SELECT "Month","Total","Individual","Group","Ensemble" FROM lessons_per_month
WHERE "Year"='2024';