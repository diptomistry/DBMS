CREATE TABLE universities (
    university_id NUMBER PRIMARY KEY,
    university_name VARCHAR2(255),
    founded_date DATE,
    location VARCHAR2(255),
    website VARCHAR2(255),
    ranking_2023 NUMBER,
    type VARCHAR2(20),
    QSWorldRanking_2023 VARCHAR2(20)
);

CREATE TABLE subjects (
    sub_id NUMBER PRIMARY KEY,
    sub_name VARCHAR2(255),
    subject_type VARCHAR2(255)
);
CREATE TABLE alumni (
    alumni_id NUMBER PRIMARY KEY,
    sub_id NUMBER,
    full_name VARCHAR2(255),
    degree_earned VARCHAR2(255),
    Current_Employer VARCHAR2(255),
    Current_Designation VARCHAR2(255),
    location VARCHAR2(255),
    batch VARCHAR2(255),
    university_id NUMBER,
    FOREIGN KEY (university_id) REFERENCES universities(university_id),
    FOREIGN KEY (sub_id) REFERENCES subjects(sub_id)
);
CREATE TABLE subject_rankings (
    sub_ranking_id NUMBER PRIMARY KEY,
    ranking VARCHAR2(20),
    year NUMBER,  -- Assuming "year" is a numeric value, adjust accordingly if it's a date
    university_id NUMBER,
    sub_id NUMBER,
    FOREIGN KEY (university_id) REFERENCES universities(university_id),
    FOREIGN KEY (sub_id) REFERENCES subjects(sub_id)
);
CREATE TABLE professors (
    professor_id NUMBER PRIMARY KEY,
    full_name VARCHAR2(255),
    sub_id NUMBER,
    university_id NUMBER,
    Designation VARCHAR2(255),
    email VARCHAR2(255),
    FOREIGN KEY (sub_id) REFERENCES subjects(sub_id),
    FOREIGN KEY (university_id) REFERENCES universities(university_id)
);


-- Create Facilities Table
CREATE TABLE facilities (
    facility_id NUMBER PRIMARY KEY,
    facility_name VARCHAR2(255),
    facility_weight NUMBER,  -- Assuming it's a numeric value
    university_id NUMBER,
    FOREIGN KEY (university_id) REFERENCES universities(university_id)
);

-- Create Awards Table
CREATE TABLE awards (
    award_id NUMBER PRIMARY KEY,
    award_name VARCHAR2(255),
    year NUMBER,  -- Assuming it's a numeric value
    recipient_id NUMBER,
    FOREIGN KEY (recipient_id) REFERENCES professors(professor_id) ON DELETE CASCADE,
    FOREIGN KEY (recipient_id) REFERENCES alumni(alumni_id) ON DELETE CASCADE
);


CREATE TABLE university_metrics (
    university_id NUMBER,
    Enrollment NUMBER,
    Budget_in_crore NUMBER,
    FacultyToStudentRatio VARCHAR2(20),
    ResearchFunding_in_crore NUMBER,
    CampusSize_in_acre NUMBER,
    GraduationRate NUMBER,
    AcceptanceRate NUMBER,
    SatisfactionRating NUMBER,
    Endowment_in_crore NUMBER,
    ResearchPublications NUMBER,
    Year NUMBER,
    FOREIGN KEY (university_id) REFERENCES universities(university_id)
);


--trigger
create or replace TRIGGER trg_before_UniversityData_change
BEFORE INSERT OR DELETE OR UPDATE ON universities
FOR EACH ROW--operates on each row affected by the triggering statement 
DECLARE
    v_user VARCHAR2(20); --to store the username
BEGIN
    SELECT user INTO v_user From dual;
-- retrieves the current database user and assigns it to the v_user variable.
--DUAL is a dummy table in Oracle, and user is a pseudocolumn that represents the current user.
    IF INSERTING THEN

       DBMS_OUTPUT.PUT_LINE('New data is inserted in the UNIVERSITIES table by '||v_user);

    ELSIF DELETING THEN

        DBMS_OUTPUT.PUT_LINE('New data is deleteded from the UNIVERSITIES table by '||v_user );

    ELSIF UPDATING THEN

        DBMS_OUTPUT.PUT_LINE('New data is updated in the UNIVERSITIES table by '||v_user);

    END IF;

END;

SET SERVEROUTPUT ON; 


--making audit
create table university_audit(
new_name varchar2(30),
old_name varchar2(30),
user_name varchar(30),
entry_date varchar2(30),
operation varchar2(30)
);
CREATE OR REPLACE trigger university_audit
BEFORE INSERT OR DELETE OR UPDATE ON universities
FOR EACH ROW
ENABLE--will start working as soon as we compile
DECLARE
  v_user varchar2 (30);--to store username
  v_date  varchar2(30);--to store entry date
BEGIN--user is a pseudocolumn that returns the current database user.
  SELECT user, TO_CHAR(sysdate, 'DD/MON/YYYY HH24:MI:SS') INTO v_user, v_date  FROM dual;-- converts the sysdate (current date and time) into a specific string format
  IF INSERTING THEN
    INSERT INTO university_audit (new_name,old_name, user_name, entry_date, operation) 
    VALUES(:NEW.university_name, Null , v_user, v_date, 'Insert');  
  ELSIF DELETING THEN
    INSERT INTO university_audit (new_name,old_name, user_name, entry_date, operation)
    VALUES(NULL,:OLD.university_name, v_user, v_date, 'Delete');
  ELSIF UPDATING THEN
    INSERT INTO university_audit (new_name,old_name, user_name, entry_date, operation) 
    VALUES(:NEW.university_name, :OLD.university_name, v_user, v_date,'Update');
  END IF;
END;
--:NEW and :OLD are pseudorecords
/
 
CREATE TABLE schema_audit
  (
    ddl_date       DATE,
    ddl_user       VARCHAR2(15),
    object_created VARCHAR2(15),
    object_name    VARCHAR2(30),
    ddl_operation  VARCHAR2(15)
  );
CREATE OR REPLACE TRIGGER audit_tr 
AFTER DDL ON SCHEMA
BEGIN
    INSERT INTO schema_audit VALUES (
sysdate, --date
sys_context('USERENV','CURRENT_USER'), 
ora_dict_obj_type, -- type of the dictionary object(for example table)
ora_dict_obj_name, --obj name(table name)
ora_sysevent);--ddl name
END;
/


                              ----data inserted from csv file--
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
VALUES (1, 37018,913, '1/19', 50, 6002023,0.75, 0.15,0.95, 100, 2000,2023);
INSERT INTO university_metrics
VALUES (2, 6237,228.4, '1/13.2', 50,752023,0.95, 0.12,0.85, 100, 1000,2023);
INSERT INTO university_metrics (university_id, Budget_in_crore, Year)
VALUES (4,456.75, 2023);
INSERT INTO university_metrics (university_id, Budget_in_crore, Year)
VALUES (5,279.13, 2023);
INSERT INTO university_metrics (university_id, Budget_in_crore, Year)
VALUES (7,168.36, 2023);
INSERT INTO university_metrics (university_id, Budget_in_crore, Year)
VALUES (8,85.28, 2023);
INSERT INTO university_metrics (university_id, Budget_in_crore, Year)
VALUES (31,112.21, 2023);
INSERT INTO university_metrics (university_id, Budget_in_crore, Year)
VALUES (30,179.74, 2023);
