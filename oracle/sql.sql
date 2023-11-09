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
    current_employer VARCHAR2(255),
    current_designation VARCHAR2(255),
    location VARCHAR2(255),
    batch NUMBER,
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

-- Create Financial Data Table
CREATE TABLE university_metrics (
    metric_id NUMBER PRIMARY KEY,
    university_id NUMBER,
    metric_name VARCHAR2(100),
    value NUMBER,  -- Assuming it's a numeric value
    year NUMBER,  -- Assuming it's a numeric value
    FOREIGN KEY (university_id) REFERENCES universities(university_id)
);
