--1)To find the number of alumni of a particular university live in a particular location
SELECT COUNT(*) AS usa_alumni_count
FROM alumni a
JOIN universities u ON a.university_id = u.university_id
WHERE a.location = 'USA' 
AND u.university_name = 'University of Dhaka';
--1.1)to have their details:
SELECT a.full_name, a.Current_Employer, a.Current_Designation, a.batch
FROM alumni a
JOIN universities u ON a.university_id = u.university_id
WHERE a.location = 'USA' 
AND u.university_name = 'University of Dhaka';
