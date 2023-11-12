--1)To find the number of alumni of a particular university lives in a particular location
SELECT COUNT(*) AS usa_alumni_count
FROM alumni a
JOIN universities u ON a.university_id = u.university_id
WHERE a.location = 'USA' 
AND u.university_name = 'University of Dhaka';
