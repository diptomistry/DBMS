-- Create University Table
CREATE TABLE universities (
    university_id INT PRIMARY KEY AUTO_INCREMENT,
    university_name VARCHAR(255),
    founded_date DATE,
    location VARCHAR(255),
    website VARCHAR(255),
    ranking INT
);

-- Create Subject Table
CREATE TABLE subjects (
    sub_id INT PRIMARY KEY AUTO_INCREMENT,
    sub_name VARCHAR(255),
    university_id INT,
    FOREIGN KEY (university_id) REFERENCES universities(university_id)
);

-- Create Alumni Table
CREATE TABLE alumni (
    alumni_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255),
    graduation_year YEAR,
    degree_earned VARCHAR(255),
    employer VARCHAR(255),
    location VARCHAR(255),
    university_id INT,
    FOREIGN KEY (university_id) REFERENCES universities(university_id)
);

-- Create Overall Ranking Table
CREATE TABLE overall_rankings (
    overall_ranking_id INT PRIMARY KEY AUTO_INCREMENT,
    rank INT,
    year YEAR,
    university_id INT,
    FOREIGN KEY (university_id) REFERENCES universities(university_id)
);

-- Create Subject-wise Ranking Table
CREATE TABLE subject_rankings (
    sub_ranking_id INT PRIMARY KEY AUTO_INCREMENT,
    rank INT,
    year YEAR,
    sub_id INT,
    FOREIGN KEY (sub_id) REFERENCES subjects(sub_id)
);

-- Create Professors Table
CREATE TABLE professors (
    professor_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255),
    sub_id INT,
    FOREIGN KEY (sub_id) REFERENCES subjects(sub_id)
);

-- Create Facilities Table
CREATE TABLE facilities (
    facility_id INT PRIMARY KEY AUTO_INCREMENT,
    facility_name VARCHAR(255),
    location VARCHAR(255),
    university_id INT,
    FOREIGN KEY (university_id) REFERENCES universities(university_id)
);

-- Create Awards Table
CREATE TABLE awards (
    award_id INT PRIMARY KEY AUTO_INCREMENT,
    award_name VARCHAR(255),
    year YEAR,
    recipient_id INT,
    FOREIGN KEY (recipient_id) REFERENCES professors(professor_id) ON DELETE CASCADE,
    FOREIGN KEY (recipient_id) REFERENCES alumni(alumni_id) ON DELETE CASCADE
);

-- Create Financial Data Table
CREATE TABLE university_metrics (
    metric_id INT PRIMARY KEY AUTO_INCREMENT,
    university_id INT,
    metric_name VARCHAR(100),
    value FLOAT,
    year YEAR,
    FOREIGN KEY (university_id) REFERENCES universities(university_id)
);
