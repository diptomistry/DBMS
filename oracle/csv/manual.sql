INSERT INTO subject_rankings (sub_ranking_id, ranking, year, university_id, sub_id)
VALUES
    (3, '651-680', 2023, 16, 5);

INSERT INTO subjects (sub_id, sub_name, subject_type)
SELECT 92, 'Soil, Water, and Environment Science', 'Social Science'
FROM dual--require a FROM clause, but the operation isn't related to any actual table data.
    --DUAL is a special table in Oracle that has a single row and single column and is commonly used as a dummy table
WHERE NOT EXISTS (
    SELECT 1
    FROM subjects
    WHERE sub_name = 'Soil, Water, and Environment Science'
);


INSERT INTO university_metrics
VALUES (1,1, 37018,913, '1/19', 50, 6002023,0.75, 0.15,0.95, 100, 2000,2023);
INSERT INTO university_metrics
VALUES (2,2, 6237,228.4, '1/13.2', 50,752023,0.95, 0.12,0.85, 100, 1000,2023);
INSERT INTO university_metrics (metric_id,university_id, Budget_in_crore, Year)
VALUES (3,4,456.75, 2023);
INSERT INTO university_metrics (metric_id,university_id, Budget_in_crore, Year)
VALUES (4,5,279.13, 2023);
INSERT INTO university_metrics (metric_id,university_id, Budget_in_crore, Year)
VALUES (5,7,168.36, 2023);
INSERT INTO university_metrics (metric_id,university_id, Budget_in_crore, Year)
VALUES (6,8,85.28, 2023);
INSERT INTO university_metrics (metric_id,university_id, Budget_in_crore, Year)
VALUES (7,31,112.21, 2023);
INSERT INTO university_metrics (metric_id,university_id, Budget_in_crore, Year)
VALUES (8,30,179.74, 2023);

UPDATE universities
SET ranking_2023 = 3  -- Replace [new_value] with the updated ranking value
WHERE university_id = 12;

UPDATE universities
SET ranking_2023 = 2  -- Replace [new_value] with the updated ranking value
WHERE university_id = 2;
INSERT INTO facilities (facility_id, Faculty_number, Departments_num, Institutes_num, Residential_Halls_num, Research_Centres, Library,  university_id)
VALUES (1, 13, 83, 12, 20, 56, 3,  1);
INSERT INTO facilities (facility_id, Faculty_number, Departments_num, Institutes_num, Residential_Halls_num, Research_Centres, Library,  university_id)
VALUES (2, 6, 18, 6, 8, 6, 2, 2);
