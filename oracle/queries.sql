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

--2)Retrieve all universities and their rankings for the year 2023:
SELECT university_name, ranking_2023, QSWorldRanking_2023
FROM universities;

--3)Find all alumni who graduated from a specific university:
SELECT a.full_name, a.degree_earned, a.location, a.batch
FROM alumni a
JOIN universities u ON a.university_id = u.university_id
WHERE u.university_name = 'Your University Name';

--4) Get the subject rankings for a specific university:
SELECT s.sub_name, sr.ranking
FROM subject_rankings sr
JOIN subjects s ON sr.sub_id = s.sub_id
JOIN universities u ON sr.university_id = u.university_id
WHERE u.university_name = 'Your University Name';

--5)Retrieve information about professors at a specific university:
SELECT p.full_name, p.Designation, p.email
FROM professors p
JOIN universities u ON p.university_id = u.university_id
WHERE u.university_name = 'University_Name';

--6)List facilities and their weights for a particular university:
SELECT f.facility_name, f.facility_weight
FROM facilities f
JOIN universities u ON f.university_id = u.university_id
WHERE u.university_name = 'University_Name';

--7)Find awards received by a specific professor or alumni:
SELECT a.award_name, a.year
FROM awards a
JOIN professors p ON a.recipient_id = p.professor_id
WHERE p.full_name = 'Satyendra Nath Bose';
--7.1)search by university
SELECT aw.award_name, aw.year
FROM awards aw
JOIN professors p ON aw.recipient_id = p.professor_id
JOIN universities u ON p.university_id = u.university_id
WHERE u.university_name = 'University_Name';

--8) Get financial metrics for a particular university:
SELECT um.metric_name, um.value, um.year
FROM university_metrics um
JOIN universities u ON um.university_id = u.university_id
WHERE u.university_name = 'University_Name';
