use db2020615644;
-- Create University Table
CREATE TABLE universities (
    university_id INT PRIMARY KEY AUTO_INCREMENT,
    university_name VARCHAR(255),
    founded_date DATE,
    location VARCHAR(255),
    website VARCHAR(255),
    ranking_2023 INT
);
ALTER TABLE universities
ADD COLUMN type VARCHAR(20);
ALTER TABLE universities
ADD COLUMN QSWorldRanking_2023 VARCHAR(20);
-- Create Subject Table
CREATE TABLE subjects (
    sub_id INT PRIMARY KEY AUTO_INCREMENT,--starts from 5f
    sub_name VARCHAR(255),
    university_id INT,
    FOREIGN KEY (university_id) REFERENCES universities(university_id)
);
ALTER TABLE subjects
DROP FOREIGN KEY subjects_ibfk_1;
ALTER TABLE subjects
DROP COLUMN university_id;
ALTER TABLE subjects
ADD COLUMN subject_type VARCHAR(255);


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

-- Delete graduation_year column from Alumni table
ALTER TABLE Alumni
DROP COLUMN graduation_year;

-- Add batch column to Alumni table
ALTER TABLE Alumni
ADD COLUMN batch INT;

-- Rename employer to Current Employer in Alumni table
ALTER TABLE Alumni
CHANGE COLUMN employer `Current Employer` VARCHAR(255);
-- Add Current Designation field to Alumni table
ALTER TABLE Alumni
ADD COLUMN `Current Designation` VARCHAR(255);




-- Create Subject-wise Ranking Table
CREATE TABLE subject_rankings (
    sub_ranking_id INT PRIMARY KEY AUTO_INCREMENT,
    ranking VARCHAR(20),
    year YEAR,
    university_id INT,
    sub_id INT,
    FOREIGN KEY (university_id) REFERENCES universities(university_id),
    FOREIGN KEY (sub_id) REFERENCES subjects(sub_id)
);

-- Create Professors Table
CREATE TABLE professors (
    professor_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255),
    sub_id INT,
    FOREIGN KEY (sub_id) REFERENCES subjects(sub_id)
);
ALTER TABLE professors
ADD COLUMN university_id INT,
ADD FOREIGN KEY (university_id) REFERENCES universities(university_id);
ALTER TABLE professors
ADD COLUMN Email VARCHAR(255);

-- Create Facilities Table
CREATE TABLE facilities (
    facility_id INT PRIMARY KEY AUTO_INCREMENT,
    facility_name VARCHAR(255),
    facility_weight INT,
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
) AUTO_INCREMENT = 1; -- Set the starting value to 1


SET SQL_SAFE_UPDATES = 1;
-- Insert data into the University Table (ignoring the "town" column)
INSERT INTO universities (university_name, ranking_2023)
VALUES
    ('Dhaka University', 1),
    ('BRAC University', 2),
    ('Bangladesh University of Engineering and Technology', 3),
    ('Rajshahi University', 4),
    ('National University, Bangladesh', 5),
    ('North South University', 6),
    ('Daffodil International University', 7),
    ('American International University-Bangladesh', 8),
    ('University of Chittagong', 9),
    ('Shahjalal University of Science and Technology', 10),
    ('Independent University, Bangladesh', 11),
    ('Ahsanullah University of Science and Technology', 12),
    ('Bangladesh Agricultural University', 13),
    ('East West University', 14),
    ('Jahangirnagar University', 15),
    ('United International University', 16),
    ('Asian University for Women', 17),
    ('Islamic University of Technology', 18),
    ('International Islamic University, Chittagong', 19),
    ('Bangabandhu Sheikh Mujib Medical University', 20),
    ('Khulna University of Engineering and Technology', 21),
    ('Bangladesh University of Professionals', 22),
    ('Stamford University Bangladesh', 23),
    ('University of Liberal Arts Bangladesh', 24),
    ('Khulna University', 25),
    ('University of Asia Pacific', 26),
    ('International University of Business Agriculture and Technology', 27),
    ('Southeast University, Bangladesh', 28),
    ('Jagannath University', 29),
    ('Bangladesh University of Textiles', 30),
    ('Islamic University', 31),
    ('Bangabandhu Sheikh Mujibur Rahman Agricultural University', 32),
    ('Chittagong University of Engineering and Technology', 33),
    ('University of Barisal', 34),
    ('Bangladesh University of Business and Technology', 35),
    ('Chittagong Veterinary and Animal Sciences University', 36),
    ('Rajshahi University of Engineering and Technology', 37),
    ('Noakhali Science and Technology University', 38),
    ('Dhaka University of Engineering and Technology', 39),
    ('Bangabandhu Sheikh Mujibur Rahman Science and Technology University', 40),
    ('Green University of Bangladesh', 41),
    ('Canadian University of Bangladesh', 42),
    ('Jashore University of Science and Technology', 43),
    ('ASA University Bangladesh', 44),
    ('Sher-e-Bangla Agricultural University', 45),
    ('Hajee Mohammad Danesh Science and Technology University', 46),
    ('Primeasia University', 47),
    ('Sylhet Agricultural University', 48),
    ('Dhaka International University', 49),
    ('Patuakhali Science and Technology University', 50),
    ('BGMEA University of Fashion and Technology', 51),
    ('Mawlana Bhashani Science and Technology University', 52),
    ('Comilla University', 53),
    ('University of Science and Technology Chittagong', 54),
    ('Sonargaon University', 55),
    ('Metropolitan University', 56),
    ('State University of Bangladesh', 57),
    ('Northern University of Bangladesh', 58),
    ('Eastern University, Bangladesh', 59),
    ('World University of Bangladesh', 60),
    ('Manarat International University', 61),
    ('Begum Rokeya University, Rangpur', 62),
    ('University of Information Technology and Sciences', 63),
    ('Asian University of Bangladesh', 64),
    ('Leading University', 65),
    ('Bangabandhu Sheikh Mujibur Rahman Maritime University', 66),
    ('Jatiya Kabi Kazi Nazrul Islam University', 67),
    ('Notre Dame University Bangladesh', 68),
    ('Shanto Mariam University of Creative Technology', 69),
    ('East Delta University', 70),
    ('Gono Bishwabidyalay', 71),
    ('Islamic Arabic University', 72),
    ('Presidency University, Bangladesh', 73),
    ('Pabna Science and Technology University', 74),
    ('Prime University', 75),
    ('City University', 76),
    ('First Capital University of Bangladesh', 77),
    ('University of Development Alternative', 78),
    ('University of Global Village', 79),
    ('Sheikh Fazilatunnesa Mujib University', 80),
    ('Bangladesh University', 81),
    ('Atish Dipankar University of Science and Technology', 82),
    ('Uttara University', 83),
    ('University of South Asia, Bangladesh', 84),
    ('Chittagong Independent University', 85),
    ('Chittagong Medical University', 86),
    ('Royal University of Dhaka', 87),
    ('Premier University', 88),
    ('Port City International University', 89),
    ('Varendra University', 90),
    ('Southern University Bangladesh', 91),
    ('European University of Bangladesh', 92),
    ('Sylhet International University', 93),
    ('Queens University', 94),
    ('IBAIS University', 95),
    ('ZNRF University of Management Sciences', 96),
    ('Sheikh Hasina University', 97),
    ('North East University Bangladesh', 98),
    ('Fareast International University', 99),
    ('The Millenium University', 100),
    ('The Peoples University of Bangladesh', 101),
    ('Victoria University of Bangladesh', 102),
    ('Begum Gulchemonara Trust University', 103),
    ('Rangamati Science and Technology University', 104),
    ('The International University of Scholars', 105),
    ('Bangamata Sheikh Fojilatunnesa Mujib Science and Technology University', 106),
    ('University of Creative Technology Chittagong', 107),
    ('Rabindra University, Bangladesh', 108),
    ('Anwer Khan Modern University', 109),
    ('Rajshahi Science and Technology University', 110),
    ('North Western University', 111),
    ('Bangladesh Islami University', 112),
    ('Rajshahi Medical University', 113),
    ('Hamdard University of Bangladesh', 114),
    ('German University Bangladesh', 115),
    ('Northern University of Business and Technology, Khulna', 116),
    ('Central Womens University', 117),
    ('N.P.I. University of Bangladesh', 118),
    ('Feni University', 119),
    ('Rabindra Maitree University', 120),
    ('Ranada Prasad Shaha University', 121),
    ('Ishakha International University, Bangladesh', 122),
    ('Khulna Agricultural University', 123),
    ('North Bengal International University', 124),
    ('Pundra University of Science and Technology', 125),
    ('Bangladesh University of Health Sciences', 126),
    ('Khwaja Yunus Ali University', 127),
    ('International Standard University', 128),
    ('Bandarban University', 129),
    ('Global University Bangladesh', 130),
    ('Sylhet Medical University', 131),
    ('CCN University of Science and Technology', 132),
    ('Times University of Bangladesh', 133),
    ('Britannia University', 134),
    ('Coxs Bazar International University', 135),
    ('Z.H. Sikder University of Science and Technology', 136),
    ('Central University of Science and Technology', 137),
    ('Exim Bank Agricultural University of Bangladesh', 138);
-- Update the university name from "University of Dhaka" to "Dhaka University"
UPDATE universities
SET university_name = 'University of Dhaka'
WHERE university_name = 'Dhaka University';
-- Insert the "location" data for the universities
UPDATE universities
SET location = CASE university_id
	WHEN 1 THEN 'Dhaka' -- University of Dhaka
    WHEN 2 THEN 'Dhaka' -- Bangladesh University of Engineering and Technology
    WHEN 3 THEN 'Chittagong' -- University of Chittagong
    WHEN 4 THEN 'Rajshahi' -- Rajshahi University
    WHEN 5 THEN 'Savar' -- Jahangirnagar University
    WHEN 6 THEN 'Khulna' -- Khulna University
    WHEN 7 THEN 'Sylhet' -- Shahjalal University of Science and Technology
    WHEN 8 THEN 'Chittagong' -- Chittagong University of Engineering and Technology
    WHEN 9 THEN 'Gazipur' -- Bangabandhu Sheikh Mujibur Rahman Science and Technology University
    WHEN 10 THEN 'Mymensingh' -- Bangladesh Agricultural University
    WHEN 12 THEN 'Dhaka' -- BRAC University
    WHEN 15 THEN 'Gazipur' -- National University, Bangladesh
    WHEN 16 THEN 'Dhaka' -- North South University
    WHEN 17 THEN 'Dhaka' -- Daffodil International University
    WHEN 18 THEN 'Dhaka' -- American International University-Bangladesh
    WHEN 21 THEN 'Dhaka' -- Independent University, Bangladesh
    WHEN 22 THEN 'Dhaka' -- Ahsanullah University of Science and Technology
    WHEN 24 THEN 'Dhaka' -- East West University
    WHEN 26 THEN 'Dhaka' -- United International University
    WHEN 27 THEN 'Chittagong' -- Asian University for Women
    WHEN 28 THEN 'Gazipur' -- Islamic University of Technology
    WHEN 29 THEN 'Chittagong' -- International Islamic University, Chittagong
    WHEN 30 THEN 'Dhaka' -- Bangabandhu Sheikh Mujib Medical University
    WHEN 31 THEN 'Khulna' -- Khulna University of Engineering and Technology
    WHEN 32 THEN 'Mirpur' -- Bangladesh University of Professionals
    WHEN 33 THEN 'Dhaka' -- Stamford University Bangladesh
    WHEN 34 THEN 'Dhaka' -- University of Liberal Arts Bangladesh
    WHEN 36 THEN 'Dhaka' -- University of Asia Pacific
    WHEN 37 THEN 'Dhaka' -- International University of Business Agriculture and Technology
    WHEN 38 THEN 'Dhaka' -- Southeast University, Bangladesh
    WHEN 39 THEN 'Dhaka' -- Jagannath University
    WHEN 40 THEN 'Dhaka' -- Bangladesh University of Textiles
    WHEN 41 THEN 'Kushtia' -- Islamic University
    WHEN 42 THEN 'Gazipur' -- Bangabandhu Sheikh Mujibur Rahman Agricultural University
    WHEN 44 THEN 'Barisal' -- University of Barisal
    WHEN 45 THEN 'Dhaka' -- Bangladesh University of Business and Technology
    WHEN 46 THEN 'Kulshi' -- Chittagong Veterinary and Animal Sciences University
    WHEN 47 THEN 'Rajshahi' -- Rajshahi University of Engineering and Technology
    WHEN 48 THEN 'Noakhali' -- Noakhali Science and Technology University
    WHEN 49 THEN 'Gazipur' -- Dhaka University of Engineering and Technology
    WHEN 51 THEN 'Dhaka' -- Green University of Bangladesh
    WHEN 52 THEN 'Dhaka' -- Canadian University of Bangladesh
    WHEN 53 THEN 'Jessore' -- Jashore University of Science and Technology
    WHEN 54 THEN 'Dhaka' -- ASA University Bangladesh
    WHEN 55 THEN 'Dhaka' -- Sher-e-Bangla Agricultural University
    WHEN 56 THEN 'Dinajpur' -- Hajee Mohammad Danesh Science and Technology University
    WHEN 57 THEN 'Dhaka' -- Primeasia University
    WHEN 58 THEN 'Sylhet' -- Sylhet Agricultural University
    WHEN 59 THEN 'Dhaka' -- Dhaka International University
    WHEN 60 THEN 'Patuakhali' -- Patuakhali Science and Technology University
    WHEN 61 THEN 'Dhaka' -- BGMEA University of Fashion and Technology
    WHEN 62 THEN 'Tangail' -- Mawlana Bhashani Science and Technology University
    WHEN 63 THEN 'Comilla' -- Comilla University
    WHEN 64 THEN 'Chittagong' -- University of Science and Technology Chittagong
    WHEN 65 THEN 'Dhaka' -- Sonargaon University
    WHEN 66 THEN 'Sylhet' -- Metropolitan University
    WHEN 67 THEN 'Dhaka' -- State University of Bangladesh
    WHEN 68 THEN 'Dhaka' -- Northern University of Bangladesh
    WHEN 69 THEN 'Dhaka' -- Eastern University, Bangladesh
    WHEN 70 THEN 'Dhaka' -- World University of Bangladesh
    WHEN 71 THEN 'Dhaka' -- Manarat International University
    WHEN 72 THEN 'Rangpur' -- Begum Rokeya University, Rangpur
    WHEN 73 THEN 'Dhaka' -- University of Information Technology and Sciences
    WHEN 74 THEN 'Dhaka' -- Asian University of Bangladesh
    WHEN 75 THEN 'Sylhet' -- Leading University
    WHEN 76 THEN 'Dhaka' -- Bangabandhu Sheikh Mujibur Rahman Maritime University
    WHEN 77 THEN 'Mymensingh' -- Jatiya Kabi Kazi Nazrul Islam University
    WHEN 78 THEN 'Dhaka' -- Notre Dame University Bangladesh
    WHEN 79 THEN 'Dhaka' -- Shanto Mariam University of Creative Technology
    WHEN 80 THEN 'Chittagong' -- East Delta University
    WHEN 81 THEN 'Dhaka' -- Gono Bishwabidyalay
    WHEN 82 THEN 'Dhaka' -- Islamic Arabic University
    WHEN 83 THEN 'Dhaka' -- Presidency University, Bangladesh
    WHEN 84 THEN 'Pabna' -- Pabna Science and Technology University
    WHEN 85 THEN 'Dhaka' -- Prime University
    WHEN 86 THEN 'Dhaka' -- City University
    WHEN 87 THEN 'Chuadanga' -- First Capital University of Bangladesh
    WHEN 88 THEN 'Dhaka' -- University of Development Alternative
    WHEN 89 THEN 'Barishal' -- University of Global Village
    WHEN 90 THEN 'Jamalpur' -- Sheikh Fazilatunnesa Mujib University
    WHEN 91 THEN 'Dhaka' -- Bangladesh University
    WHEN 92 THEN 'Dhaka' -- Atish Dipankar University of Science and Technology
    WHEN 93 THEN 'Dhaka' -- Uttara University
    WHEN 94 THEN 'Dhaka' -- University of South Asia, Bangladesh
    WHEN 95 THEN 'Chittagong' -- Chittagong Independent University
    WHEN 96 THEN 'Chittagong' -- Chittagong Medical University
    WHEN 97 THEN 'Dhaka' -- Royal University of Dhaka
    WHEN 98 THEN 'Chittagong' -- Premier University
    WHEN 99 THEN 'Chittagong' -- Port City International University
    WHEN 100 THEN 'Rajshahi' -- Varendra University
    WHEN 101 THEN 'Chittagong' -- Southern University Bangladesh
    WHEN 102 THEN 'Dhaka' -- European University of Bangladesh
    WHEN 103 THEN 'Sylhet' -- Sylhet International University
    WHEN 104 THEN 'Dhaka' -- Queens University
    WHEN 105 THEN 'Dhaka' -- IBAIS University
    WHEN 106 THEN 'Dhaka' -- ZNRF University of Management Sciences
    WHEN 107 THEN 'Netrokona' -- Sheikh Hasina University
    WHEN 108 THEN 'Sylhet' -- North East University Bangladesh
    WHEN 109 THEN 'Dhaka' -- Fareast International University
    WHEN 110 THEN 'Dhaka' -- The Millenium University
    WHEN 111 THEN 'Dhaka' -- The Peoples University of Bangladesh
    WHEN 112 THEN 'Dhaka' -- Victoria University of Bangladesh
    WHEN 113 THEN 'Chittagong' -- Begum Gulchemonara Trust University
    WHEN 114 THEN 'Rangamati' -- Rangamati Science and Technology University
    WHEN 115 THEN 'Dhaka' -- The International University of Scholars
    WHEN 116 THEN 'Melandaha' -- Bangamata Sheikh Fojilatunnesa Mujib Science and Technology University
    WHEN 117 THEN 'Chittagong' -- University of Creative Technology Chittagong
    WHEN 118 THEN 'Shahjadpur' -- Rabindra University, Bangladesh
    WHEN 119 THEN 'Dhaka' -- Anwer Khan Modern University
    WHEN 120 THEN 'Natore' -- Rajshahi Science and Technology University
    WHEN 121 THEN 'Khulna' -- North Western University
    WHEN 122 THEN 'Dhaka' -- Bangladesh Islami University
    WHEN 123 THEN 'Rajshahi' -- Rajshahi Medical University
    WHEN 124 THEN 'Munshiganj' -- Hamdard University of Bangladesh
    WHEN 125 THEN 'Gazipur' -- German University Bangladesh
    WHEN 126 THEN 'Khulna' -- Northern University of Business and Technology, Khulna
    WHEN 127 THEN 'Dhaka' -- Central Womens University
    WHEN 128 THEN 'Manikgonj' -- N.P.I. University of Bangladesh
    WHEN 129 THEN 'Feni' -- Feni University
    WHEN 130 THEN 'Kushtia' -- Rabindra Maitree University
    WHEN 131 THEN 'Narayanganj' -- Ranada Prasad Shaha University
    WHEN 132 THEN 'Kishorganj' -- Ishakha International University, Bangladesh
    WHEN 133 THEN 'Khulna' -- Khulna Agricultural University
    WHEN 134 THEN 'Rajshahi' -- North Bengal International University
    WHEN 135 THEN 'Bogra' -- Pundra University of Science and Technology
    WHEN 136 THEN 'Dhaka' -- Bangladesh University of Health Sciences
    WHEN 137 THEN 'Enayetpur' -- Khwaja Yunus Ali University
    WHEN 138 THEN 'Dhaka' -- International Standard University
    WHEN 139 THEN 'Bandarban' -- Bandarban University
    WHEN 140 THEN 'Barisal' -- Global University Bangladesh
    WHEN 141 THEN 'Sylhet' -- Sylhet Medical University
    WHEN 142 THEN 'Comilla' -- CCN University of Science and Technology
    WHEN 143 THEN 'Faridpur' -- Times University of Bangladesh
    WHEN 144 THEN 'Comilla' -- Britannia University
    WHEN 145 THEN 'Coxs Bazar' -- Coxs Bazar International University
    WHEN 146 THEN 'Bhedorgonj' -- Z.H. Sikder University of Science and Technology
    WHEN 147 THEN 'Dhaka' -- Central University of Science and Technology
    WHEN 148 THEN 'Chapainawabganj' -- Exim Bank Agricultural University of Bangladesh
END;

UPDATE universities
SET founded_date = CASE university_id
    WHEN 1 THEN '1921-07-01' -- University of Dhaka
    WHEN 2 THEN '1962-02-25' -- Bangladesh University of Engineering and Technology
    WHEN 3 THEN '1966-11-18' -- University of Chittagong
    WHEN 4 THEN '1953-07-06' -- Rajshahi University
    WHEN 5 THEN '1970-01-12' -- Jahangirnagar University
    WHEN 6 THEN '1991-09-30' -- Khulna University
    WHEN 7 THEN '1987-11-01' -- Shahjalal University of Science and Technology
    WHEN 8 THEN '2003-10-17' -- Chittagong University of Engineering and Technology
    WHEN 9 THEN '1991-07-01' -- Bangabandhu Sheikh Mujibur Rahman Science and Technology University
    WHEN 10 THEN '1961-09-03' -- Bangladesh Agricultural University
    WHEN 12 THEN '2001-01-09' -- BRAC University
    WHEN 15 THEN '1992-10-21' -- National University, Bangladesh
    WHEN 16 THEN '1992-02-10' -- North South University
    WHEN 17 THEN '2002-01-24' -- Daffodil International University
    WHEN 18 THEN '1994-11-18' -- American International University-Bangladesh
    WHEN 21 THEN '1993-01-12' -- Independent University, Bangladesh
    WHEN 22 THEN '1995-01-01' -- Ahsanullah University of Science and Technology
    WHEN 24 THEN '1996-01-03' -- East West University
    WHEN 26 THEN '2003-02-04' -- United International University
    WHEN 27 THEN '2008-06-19' -- Asian University for Women
    WHEN 28 THEN '2001-12-18' -- Islamic University of Technology
    WHEN 29 THEN '1985-03-10' -- International Islamic University, Chittagong
    WHEN 30 THEN '1998-01-02' -- Bangabandhu Sheikh Mujib Medical University
    WHEN 31 THEN '2003-08-11' -- Khulna University of Engineering and Technology
    WHEN 32 THEN '2008-01-08' -- Bangladesh University of Professionals
    WHEN 33 THEN '2002-01-24' -- Stamford University Bangladesh
    WHEN 34 THEN '2003-05-20' -- University of Liberal Arts Bangladesh
    WHEN 36 THEN '1996-12-21' -- University of Asia Pacific
    WHEN 37 THEN '2003-11-01' -- International University of Business Agriculture and Technology
    WHEN 38 THEN '2002-06-12' -- Southeast University, Bangladesh
    WHEN 39 THEN '2005-08-02' -- Jagannath University
    WHEN 40 THEN '2010-12-29' -- Bangladesh University of Textiles
    WHEN 41 THEN '1980-02-22' -- Islamic University
    WHEN 42 THEN '2001-03-22' -- Bangabandhu Sheikh Mujibur Rahman Agricultural University
    WHEN 44 THEN '2015-02-20' -- University of Barisal
    WHEN 45 THEN '2001-02-12' -- Bangladesh University of Business and Technology
    WHEN 46 THEN '2006-08-28' -- Chittagong Veterinary and Animal Sciences University
    WHEN 47 THEN '2003-01-02' -- Rajshahi University of Engineering and Technology
    WHEN 48 THEN '2001-05-22' -- Noakhali Science and Technology University
    WHEN 49 THEN '2001-07-12' -- Dhaka University of Engineering and Technology
    WHEN 51 THEN '2003-05-14' -- Green University of Bangladesh
    WHEN 52 THEN '2003-06-05' -- Canadian University of Bangladesh
    WHEN 53 THEN '2007-08-21' -- Jashore University of Science and Technology
    WHEN 54 THEN '2006-12-27' -- ASA University Bangladesh
    WHEN 55 THEN '2001-07-09' -- Sher-e-Bangla Agricultural University
    WHEN 56 THEN '2003-12-20' -- Hajee Mohammad Danesh Science and Technology University
    WHEN 57 THEN '2003-05-24' -- Primeasia University
    WHEN 58 THEN '2006-11-03' -- Sylhet Agricultural University
    WHEN 59 THEN '2004-08-21' -- Dhaka International University
    WHEN 60 THEN '2009-03-11' -- Patuakhali Science and Technology University
    WHEN 61 THEN '2012-11-07' -- BGMEA University of Fashion and Technology
    WHEN 62 THEN '2001-01-24' -- Mawlana Bhashani Science and Technology University
    WHEN 63 THEN '2006-05-15' -- Comilla University
    WHEN 64 THEN '2001-07-01' -- University of Science and Technology Chittagong
    WHEN 65 THEN '2012-06-25' -- Sonargaon University
    WHEN 66 THEN '2003-07-21' -- Metropolitan University
    WHEN 67 THEN '2002-07-14' -- State University of Bangladesh
    WHEN 68 THEN '2002-05-20' -- Northern University of Bangladesh
    WHEN 69 THEN '2003-09-14' -- Eastern University, Bangladesh
    WHEN 70 THEN '2003-11-07' -- World University of Bangladesh
    WHEN 71 THEN '2003-06-15' -- Manarat International University
    WHEN 72 THEN '2008-02-15' -- Begum Rokeya University, Rangpur
    WHEN 73 THEN '2003-12-31' -- University of Information Technology and Sciences
    WHEN 74 THEN '2006-08-14' -- Asian University of Bangladesh
    WHEN 75 THEN '2001-07-16' -- Leading University
    WHEN 76 THEN '2013-05-15' -- Bangabandhu Sheikh Mujibur Rahman Maritime University
    WHEN 77 THEN '2007-05-01' -- Jatiya Kabi Kazi Nazrul Islam University
    WHEN 78 THEN '2013-02-27' -- Notre Dame University Bangladesh
    WHEN 79 THEN '2003-01-08' -- Shanto Mariam University of Creative Technology
    WHEN 80 THEN '2010-11-30' -- East Delta University
    WHEN 81 THEN '1996-05-14' -- Gono Bishwabidyalay
    WHEN 82 THEN '2012-11-03' -- Islamic Arabic University
    WHEN 83 THEN '2003-04-25' -- Presidency University, Bangladesh
    WHEN 84 THEN '2008-01-10' -- Pabna Science and Technology University
    WHEN 85 THEN '2002-12-03' -- Prime University
    WHEN 86 THEN '2003-07-15' -- City University
    WHEN 87 THEN '2013-02-15' -- First Capital University of Bangladesh
    WHEN 88 THEN '2000-06-15' -- University of Development Alternative
    WHEN 89 THEN '2006-01-01' -- University of Global Village
    WHEN 90 THEN '2006-01-01' -- Sheikh Fazilatunnesa Mujib University
    WHEN 91 THEN '2001-06-25' -- Bangladesh University
    WHEN 92 THEN '2004-11-19' -- Atish Dipankar University of Science and Technology
    WHEN 93 THEN '2003-05-11' -- Uttara University
    WHEN 94 THEN '2003-04-16' -- University of South Asia, Bangladesh
    WHEN 95 THEN '2003-12-21' -- Chittagong Independent University
    WHEN 96 THEN '2003-12-01' -- Chittagong Medical University
    WHEN 97 THEN '2004-07-14' -- Royal University of Dhaka
    WHEN 98 THEN '2002-09-29' -- Premier University
    WHEN 99 THEN '2012-01-11' -- Port City International University
    WHEN 100 THEN '2012-05-22' -- Varendra University
    WHEN 101 THEN '2002-01-16' -- Southern University Bangladesh
    WHEN 102 THEN '2001-09-03' -- European University of Bangladesh
    WHEN 103 THEN '2012-11-10' -- Sylhet International University
    WHEN 104 THEN '2003-07-18' -- Queens University
    WHEN 105 THEN '2001-09-03' -- IBAIS University
    WHEN 106 THEN '2003-02-26' -- ZNRF University of Management Sciences
    WHEN 107 THEN '2012-11-22' -- Sheikh Hasina University
    WHEN 108 THEN '2012-08-11' -- North East University Bangladesh
    WHEN 109 THEN '2002-08-27' -- Fareast International University
    WHEN 110 THEN '2003-01-09' -- The Millenium University
    WHEN 111 THEN '2004-11-09' -- The Peoples University of Bangladesh
    WHEN 112 THEN '2003-09-05' -- Victoria University of Bangladesh
    WHEN 113 THEN '2009-09-14' -- Begum Gulchemonara Trust University
    WHEN 114 THEN '2015-02-04' -- Rangamati Science and Technology University
    WHEN 115 THEN '2013-08-22' -- The International University of Scholars
    WHEN 116 THEN '2013-12-15' -- Bangamata Sheikh Fojilatunnesa Mujib Science and Technology University
    WHEN 117 THEN '2012-01-01' -- University of Creative Technology Chittagong
    WHEN 118 THEN '2012-12-14' -- Rabindra University, Bangladesh
    WHEN 119 THEN '2007-02-14' -- Anwer Khan Modern University
    WHEN 120 THEN '2012-01-22' -- Rajshahi Science and Technology University
    WHEN 121 THEN '2012-01-23' -- North Western University
    WHEN 122 THEN '2005-01-03' -- Bangladesh Islami University
    WHEN 123 THEN '2014-01-25' -- Rajshahi Medical University
    WHEN 124 THEN '2012-02-15' -- Hamdard University of Bangladesh
    WHEN 125 THEN '2012-02-19' -- German University Bangladesh
    WHEN 126 THEN '2012-03-15' -- Northern University of Business and Technology, Khulna
    WHEN 127 THEN '2014-01-16' -- Central Womens University
    WHEN 128 THEN '2012-05-29' -- N.P.I. University of Bangladesh
    WHEN 129 THEN '2013-08-06' -- Feni University
    WHEN 130 THEN '2013-11-06' -- Rabindra Maitree University
    WHEN 131 THEN '2014-01-09' -- Ranada Prasad Shaha University
    WHEN 132 THEN '2013-02-26' -- Ishakha International University, Bangladesh
    WHEN 133 THEN '2014-01-01' -- Khulna Agricultural University
    WHEN 134 THEN '2013-02-02' -- North Bengal International University
    WHEN 135 THEN '2015-02-01' -- Pundra University of Science and Technology
    WHEN 136 THEN '2015-04-01' -- Bangladesh University of Health Sciences
    WHEN 137 THEN '2016-01-01' -- Khwaja Yunus Ali University
    WHEN 138 THEN '2016-02-01' -- International Standard University
    WHEN 139 THEN '2015-12-16' -- Bandarban University
    WHEN 140 THEN '2016-01-01' -- Global University Bangladesh
    WHEN 141 THEN '2015-03-01' -- Sylhet Medical University
    WHEN 142 THEN '2015-04-01' -- CCN University of Science and Technology
    WHEN 143 THEN '2016-02-01' -- Times University of Bangladesh
    WHEN 144 THEN '2016-02-01' -- Britannia University
    WHEN 145 THEN '2015-02-01' -- Coxs Bazar International University
    WHEN 146 THEN '2017-01-01' -- Z.H. Sikder University of Science and Technology
    WHEN 147 THEN '2016-12-01' -- Central University of Science and Technology
    WHEN 148 THEN '2016-12-15' -- Exim Bank Agricultural University of Bangladesh
END;

UPDATE universities
SET type = CASE university_id
    WHEN 1 THEN 'Public' -- University of Dhaka
    WHEN 2 THEN 'Public' -- Bangladesh University of Engineering and Technology
    WHEN 3 THEN 'Public' -- University of Chittagong
    WHEN 4 THEN 'Public' -- Rajshahi University
    WHEN 5 THEN 'Public' -- Jahangirnagar University
    WHEN 6 THEN 'Public' -- Khulna University
    WHEN 7 THEN 'Public' -- Shahjalal University of Science and Technology
    WHEN 8 THEN 'Public' -- Chittagong University of Engineering and Technology
    WHEN 9 THEN 'Public' -- Bangabandhu Sheikh Mujibur Rahman Science and Technology University
    WHEN 10 THEN 'Public' -- Bangladesh Agricultural University
    WHEN 12 THEN 'Private' -- BRAC University
    WHEN 15 THEN 'Public' -- National University, Bangladesh
    WHEN 16 THEN 'Private' -- North South University
    WHEN 17 THEN 'Private' -- Daffodil International University
    WHEN 18 THEN 'Private' -- American International University-Bangladesh
    WHEN 21 THEN 'Private' -- Independent University, Bangladesh
    WHEN 22 THEN 'Private' -- Ahsanullah University of Science and Technology
    WHEN 24 THEN 'Private' -- East West University
    WHEN 26 THEN 'Private' -- United International University
    WHEN 27 THEN 'Private' -- Asian University for Women
    WHEN 28 THEN 'Public' -- Islamic University of Technology
    WHEN 29 THEN 'Private' -- International Islamic University, Chittagong
    WHEN 30 THEN 'Public' -- Bangabandhu Sheikh Mujib Medical University
    WHEN 31 THEN 'Public' -- Khulna University of Engineering and Technology
    WHEN 32 THEN 'Public' -- Bangladesh University of Professionals
    WHEN 33 THEN 'Private' -- Stamford University Bangladesh
    WHEN 34 THEN 'Private' -- University of Liberal Arts Bangladesh
    WHEN 36 THEN 'Private' -- University of Asia Pacific
    WHEN 37 THEN 'Private' -- International University of Business Agriculture and Technology
    WHEN 38 THEN 'Private' -- Southeast University, Bangladesh
    WHEN 39 THEN 'Public' -- Jagannath University
    WHEN 40 THEN 'Public' -- Bangladesh University of Textiles
    WHEN 41 THEN 'Public' -- Islamic University
    WHEN 42 THEN 'Public' -- Bangabandhu Sheikh Mujibur Rahman Agricultural University
    WHEN 44 THEN 'Public' -- University of Barisal
    WHEN 45 THEN 'Private' -- Bangladesh University of Business and Technology
    WHEN 46 THEN 'Public' -- Chittagong Veterinary and Animal Sciences University
    WHEN 47 THEN 'Public' -- Rajshahi University of Engineering and Technology
    WHEN 48 THEN 'Public' -- Noakhali Science and Technology University
    WHEN 49 THEN 'Public' -- Dhaka University of Engineering and Technology
    WHEN 51 THEN 'Private' -- Green University of Bangladesh
    WHEN 52 THEN 'Private' -- Canadian University of Bangladesh
    WHEN 53 THEN 'Public' -- Jashore University of Science and Technology
    WHEN 54 THEN 'Private' -- ASA University Bangladesh
    WHEN 55 THEN 'Public' -- Sher-e-Bangla Agricultural University
    WHEN 56 THEN 'Public' -- Hajee Mohammad Danesh Science and Technology University
    WHEN 57 THEN 'Private' -- Primeasia University
    WHEN 58 THEN 'Public' -- Sylhet Agricultural University
    WHEN 59 THEN 'Private' -- Dhaka International University
    WHEN 60 THEN 'Public' -- Patuakhali Science and Technology University
    WHEN 61 THEN 'Private' -- BGMEA University of Fashion and Technology
    WHEN 62 THEN 'Public' -- Mawlana Bhashani Science and Technology University
    WHEN 63 THEN 'Public' -- Comilla University
    WHEN 64 THEN 'Private' -- University of Science and Technology Chittagong
    WHEN 65 THEN 'Private' -- Sonargaon University
    WHEN 66 THEN 'Private' -- Metropolitan University
    WHEN 67 THEN 'Private' -- State University of Bangladesh
    WHEN 68 THEN 'Private' -- Northern University of Bangladesh
    WHEN 69 THEN 'Private' -- Eastern University, Bangladesh
    WHEN 70 THEN 'Private' -- World University of Bangladesh
    WHEN 71 THEN 'Private' -- Manarat International University
    WHEN 72 THEN 'Public' -- Begum Rokeya University, Rangpur
    WHEN 73 THEN 'Private' -- University of Information Technology and Sciences
    WHEN 74 THEN 'Private' -- Asian University of Bangladesh
    WHEN 75 THEN 'Private' -- Leading University
    WHEN 76 THEN 'Public' -- Bangabandhu Sheikh Mujibur Rahman Maritime University
    WHEN 77 THEN 'Public' -- Jatiya Kabi Kazi Nazrul Islam University
    WHEN 78 THEN 'Private' -- Notre Dame University Bangladesh
    WHEN 79 THEN 'Private' -- Shanto Mariam University of Creative Technology
    WHEN 80 THEN 'Private' -- East Delta University
    WHEN 81 THEN 'Private' -- Gono Bishwabidyalay
    WHEN 82 THEN 'Public' -- Islamic Arabic University
    WHEN 83 THEN 'Private' -- Presidency University, Bangladesh
    WHEN 84 THEN 'Public' -- Pabna Science and Technology University
    WHEN 85 THEN 'Private' -- Prime University
    WHEN 86 THEN 'Private' -- City University
    WHEN 87 THEN 'Private' -- First Capital University of Bangladesh
    WHEN 88 THEN 'Private' -- University of Development Alternative
    WHEN 89 THEN 'Public' -- University of Global Village
    WHEN 90 THEN 'Public' -- Sheikh Fazilatunnesa Mujib University
    WHEN 91 THEN 'Private' -- Bangladesh University
    WHEN 92 THEN 'Private' -- Atish Dipankar University of Science and Technology
    WHEN 93 THEN 'Private' -- Uttara University
    WHEN 94 THEN 'Private' -- University of South Asia, Bangladesh
    WHEN 95 THEN 'Private' -- Chittagong Independent University
    WHEN 96 THEN 'Private' -- Chittagong Medical University
    WHEN 97 THEN 'Private' -- Royal University of Dhaka
    WHEN 98 THEN 'Private' -- Premier University
    WHEN 99 THEN 'Private' -- Port City International University
    WHEN 100 THEN 'Private' -- Varendra University
    WHEN 101 THEN 'Private' -- Southern University Bangladesh
    WHEN 102 THEN 'Private' -- European University of Bangladesh
    WHEN 103 THEN 'Private' -- Sylhet International University
    WHEN 104 THEN 'Private' -- Queens University
    WHEN 105 THEN 'Private' -- IBAIS University
    WHEN 106 THEN 'Private' -- ZNRF University of Management Sciences
    WHEN 107 THEN 'Public' -- Sheikh Hasina University
    WHEN 108 THEN 'Private' -- North East University Bangladesh
    WHEN 109 THEN 'Private' -- Fareast International University
    WHEN 110 THEN 'Private' -- The Millenium University
    WHEN 111 THEN 'Private' -- The Peoples University of Bangladesh
    WHEN 112 THEN 'Private' -- Victoria University of Bangladesh
    WHEN 113 THEN 'Private' -- Begum Gulchemonara Trust University
    WHEN 114 THEN 'Public' -- Rangamati Science and Technology University
    WHEN 115 THEN 'Private' -- The International University of Scholars
    WHEN 116 THEN 'Public' -- Bangamata Sheikh Fojilatunnesa Mujib Science and Technology University
    WHEN 117 THEN 'Private' -- University of Creative Technology Chittagong
    WHEN 118 THEN 'Public' -- Rabindra University, Bangladesh
    WHEN 119 THEN 'Private' -- Anwer Khan Modern University
    WHEN 120 THEN 'Public' -- Rajshahi Science and Technology University
    WHEN 121 THEN 'Private' -- North Western University
    WHEN 122 THEN 'Private' -- Bangladesh Islami University
    WHEN 123 THEN 'Public' -- Rajshahi Medical University
    WHEN 124 THEN 'Private' -- Hamdard University of Bangladesh
    WHEN 125 THEN 'Private' -- German University Bangladesh
    WHEN 126 THEN 'Private' -- Northern University of Business and Technology, Khulna
    WHEN 127 THEN 'Private' -- Central Womens University
    WHEN 128 THEN 'Private' -- N.P.I. University of Bangladesh
    WHEN 129 THEN 'Public' -- Feni University
    WHEN 130 THEN 'Public' -- Rabindra Maitree University
    WHEN 131 THEN 'Public' -- Ranada Prasad Shaha University
    WHEN 132 THEN 'Private' -- Ishakha International University, Bangladesh
    WHEN 133 THEN 'Public' -- Khulna Agricultural University
    WHEN 134 THEN 'Public' -- North Bengal International University
    WHEN 135 THEN 'Public' -- Pundra University of Science and Technology
    WHEN 136 THEN 'Private' -- Bangladesh University of Health Sciences
    WHEN 137 THEN 'Private' -- Khwaja Yunus Ali University
    WHEN 138 THEN 'Private' -- International Standard University
    WHEN 139 THEN 'Public' -- Bandarban University
    WHEN 140 THEN 'Private' -- Global University Bangladesh
    WHEN 141 THEN 'Public' -- Sylhet Medical University
    WHEN 142 THEN 'Private' -- CCN University of Science and Technology
    WHEN 143 THEN 'Private' -- Times University of Bangladesh
    WHEN 144 THEN 'Private' -- Britannia University
    WHEN 145 THEN 'Private' -- Coxs Bazar International University
    WHEN 146 THEN 'Private' -- Z.H. Sikder University of Science and Technology
    WHEN 147 THEN 'Private' -- Central University of Science and Technology
    WHEN 148 THEN 'Private' -- Exim Bank Agricultural University of Bangladesh
END;


-- Insert the "website" data for all universities
UPDATE universities
SET website = CASE university_id
    WHEN 1 THEN 'http://www.du.ac.bd' -- University of Dhaka
    WHEN 2 THEN 'http://www.buet.ac.bd' -- Bangladesh University of Engineering and Technology
    WHEN 3 THEN 'http://www.cu.ac.bd' -- University of Chittagong
    WHEN 4 THEN 'http://www.ru.ac.bd' -- Rajshahi University
    WHEN 5 THEN 'http://www.juniv.edu' -- Jahangirnagar University
    WHEN 6 THEN 'http://www.ku.ac.bd' -- Khulna University
    WHEN 7 THEN 'http://www.sust.edu' -- Shahjalal University of Science and Technology
    WHEN 8 THEN 'http://www.cuet.ac.bd' -- Chittagong University of Engineering and Technology
    WHEN 9 THEN 'http://www.bsmrstu.edu.bd' -- Bangabandhu Sheikh Mujibur Rahman Science and Technology University
    WHEN 10 THEN 'http://www.bau.edu.bd' -- Bangladesh Agricultural University
    WHEN 12 THEN 'http://www.bracu.ac.bd' -- BRAC University
    WHEN 15 THEN 'http://www.nu.ac.bd' -- National University, Bangladesh
    WHEN 16 THEN 'http://www.northsouth.edu' -- North South University
    WHEN 17 THEN 'http://www.daffodilvarsity.edu.bd' -- Daffodil International University
    WHEN 18 THEN 'https://www.aiub.edu/' -- American International University-Bangladesh
    WHEN 21 THEN 'http://www.iub.edu.bd' -- Independent University, Bangladesh
    WHEN 22 THEN 'https://www.aust.edu/' -- Ahsanullah University of Science and Technology
    WHEN 24 THEN 'http://www.ewubd.edu/' -- East West University
    WHEN 26 THEN 'http://www.uiu.ac.bd' -- United International University
    WHEN 27 THEN 'https://www.asian-university.org/' -- Asian University for Women
    WHEN 28 THEN 'https://iutoic-dhaka.edu.bd/' -- Islamic University of Technology
    WHEN 29 THEN 'http://www.iiuc.ac.bd' -- International Islamic University, Chittagong
    WHEN 30 THEN 'https://bsmmu.edu.bd/' -- Bangabandhu Sheikh Mujib Medical University
    WHEN 31 THEN 'https://www.kuet.ac.bd/' -- Khulna University of Engineering and Technology
    WHEN 32 THEN 'https://www.bup.edu.bd/' -- Bangladesh University of Professionals
    WHEN 33 THEN 'https://www.stamforduniversity.edu.bd/' -- Stamford University Bangladesh
    WHEN 34 THEN 'http://www.ulab.edu.bd' -- University of Liberal Arts Bangladesh
    WHEN 36 THEN 'https://uap-bd.edu/' -- University of Asia Pacific
    WHEN 37 THEN 'http://www.iubat.edu/' -- International University of Business Agriculture and Technology
    WHEN 38 THEN 'http://www.seu.ac.bd' -- Southeast University, Bangladesh
    WHEN 39 THEN 'https://www.jnu.ac.bd/' -- Jagannath University
    WHEN 40 THEN 'http://www.butex.edu.bd' -- Bangladesh University of Textiles
    WHEN 41 THEN 'https://iu.ac.bd/' -- Islamic University
    WHEN 42 THEN 'https://bsmrau.edu.bd/' -- Bangabandhu Sheikh Mujibur Rahman Agricultural University
    WHEN 44 THEN 'https://barisaluniv.edu.bd/' -- University of Barisal
    WHEN 45 THEN 'https://www.bubt.edu.bd/' -- Bangladesh University of Business and Technology
    WHEN 46 THEN 'http://www.cvasu.ac.bd/' -- Chittagong Veterinary and Animal Sciences University
    WHEN 47 THEN 'https://ruet.ac.bd/' -- Rajshahi University of Engineering and Technology
    WHEN 48 THEN 'http://www.nstu.edu.bd/' -- Noakhali Science and Technology University
    WHEN 49 THEN 'https://duet.ac.bd/' -- Dhaka University of Engineering and Technology
    WHEN 51 THEN 'http://www.green.edu.bd' -- Green University of Bangladesh
    WHEN 52 THEN 'http://www.cub.edu.bd/' -- Canadian University of Bangladesh
    WHEN 53 THEN 'https://www.just.edu.bd/' -- Jashore University of Science and Technology
    WHEN 54 THEN 'https://www.asaub.edu.bd/' -- ASA University Bangladesh
    WHEN 55 THEN 'http://www.sau.edu.bd/' -- Sher-e-Bangla Agricultural University
    WHEN 56 THEN 'https://www.hstu.ac.bd/' -- Hajee Mohammad Danesh Science and Technology University
    WHEN 57 THEN 'http://www.primeasia.edu.bd/' -- Primeasia University
    WHEN 58 THEN 'http://www.sau.ac.bd/' -- Sylhet Agricultural University
    WHEN 59 THEN 'https://www.diu.edu.bd/' -- Dhaka International University
    WHEN 60 THEN 'https://www.pstu.edu/' -- Patuakhali Science and Technology University
    WHEN 61 THEN 'http://www.buft.edu.bd/' -- BGMEA University of Fashion and Technology
    WHEN 62 THEN 'https://mbstu.ac.bd/' -- Mawlana Bhashani Science and Technology University
    WHEN 63 THEN 'http://www.cou.ac.bd/' -- Comilla University
    WHEN 64 THEN 'https://www.ustc.ac.bd/' -- University of Science and Technology Chittagong
    WHEN 65 THEN 'https://www.sonargaonuniversity.ac.bd/' -- Sonargaon University
    WHEN 66 THEN 'http://www.metrouni.edu.bd/' -- Metropolitan University
    WHEN 67 THEN 'https://www.sub.edu.bd/' -- State University of Bangladesh
    WHEN 68 THEN 'http://www.nub.ac.bd/' -- Northern University of Bangladesh
    WHEN 69 THEN 'http://www.easternuni.edu.bd/' -- Eastern University, Bangladesh
    WHEN 70 THEN 'http://www.wub.edu.bd/' -- World University of Bangladesh
    WHEN 71 THEN 'https://miu.edu.bd/' -- Manarat International University
    WHEN 72 THEN 'http://www.brur.ac.bd/' -- Begum Rokeya University, Rangpur
    WHEN 73 THEN 'https://www.uit.edu/' -- University of Information Technology and Sciences
    WHEN 74 THEN 'http://www.aub.edu.bd/' -- Asian University of Bangladesh
    WHEN 75 THEN 'http://www.lus.ac.bd/' -- Leading University
    WHEN 76 THEN 'http://bsmrmu.edu.bd/' -- Bangabandhu Sheikh Mujibur Rahman Maritime University
    WHEN 77 THEN 'https://www.jkkniu.edu.bd/' -- Jatiya Kabi Kazi Nazrul Islam University
    WHEN 78 THEN 'https://www.ndub.edu.bd/' -- Notre Dame University Bangladesh
    WHEN 79 THEN 'https://www.smuct.edu.bd/' -- Shanto Mariam University of Creative Technology
    WHEN 80 THEN 'https://www.eastdelta.edu.bd/' -- East Delta University
    WHEN 81 THEN 'http://www.gonouniversity.edu.bd/' -- Gono Bishwabidyalay
    WHEN 82 THEN 'https://www.iau.edu.bd/' -- Islamic Arabic University
    WHEN 83 THEN 'https://www.presidencyuniversity.edu.bd/' -- Presidency University, Bangladesh
    WHEN 84 THEN 'https://www.pstu.edu.bd/' -- Pabna Science and Technology University
    WHEN 85 THEN 'http://primeuniversity.edu.bd/' -- Prime University
    WHEN 86 THEN 'http://www.cityuniversity.edu.bd/' -- City University
    WHEN 87 THEN 'http://fcub.edu.bd/' -- First Capital University of Bangladesh
    WHEN 88 THEN 'https://www.uoda.edu.bd/' -- University of Development Alternative
    WHEN 89 THEN 'http://www.ugv.edu.bd/' -- University of Global Village
    WHEN 90 THEN 'http://www.sfmuniversity.org/' -- Sheikh Fazilatunnesa Mujib University
    WHEN 91 THEN 'https://www.bu.edu.bd/' -- Bangladesh University
    WHEN 92 THEN 'http://www.atishdipankaruniversity.edu.bd/' -- Atish Dipankar University of Science and Technology
    WHEN 93 THEN 'https://www.uttarauniversity.edu.bd/' -- Uttara University
    WHEN 94 THEN 'https://www.usa.edu.bd/' -- University of South Asia, Bangladesh
    WHEN 95 THEN 'http://www.ciu.edu.bd/' -- Chittagong Independent University
    WHEN 96 THEN 'https://www.cmu.edu.bd/' -- Chittagong Medical University
    WHEN 97 THEN 'http://www.royal.edu.bd/' -- Royal University of Dhaka
    WHEN 98 THEN 'https://www.puc.ac.bd/' -- Premier University
    WHEN 99 THEN 'https://www.pcui.edu.bd/' -- Port City International University
    WHEN 100 THEN 'https://vu.edu.bd/' -- Varendra University
    WHEN 101 THEN 'https://subd.edu.bd/' -- Southern University Bangladesh
    WHEN 102 THEN 'http://www.eub.edu.bd/' -- European University of Bangladesh
    WHEN 103 THEN 'https://siu.edu.bd/' -- Sylhet International University
    WHEN 104 THEN 'http://www.queensuniversity.edu.bd/' -- Queens University
    WHEN 105 THEN 'http://ibaisuniversity.edu.bd/' -- IBAIS University
    WHEN 106 THEN 'https://www.znrf.ac.bd/' -- ZNRF University of Management Sciences
    WHEN 107 THEN 'http://www.shubd.net/' -- Sheikh Hasina University
    WHEN 108 THEN 'https://www.neub.edu.bd/' -- North East University Bangladesh
    WHEN 109 THEN 'https://www.fiu.edu.bd/' -- Fareast International University
    WHEN 110 THEN 'https://www.millennium.edu.bd/' -- The Millenium University
    WHEN 111 THEN 'http://www.pob.edu.bd/' -- The Peoples University of Bangladesh
    WHEN 112 THEN 'http://www.vub.edu.bd/' -- Victoria University of Bangladesh
    WHEN 113 THEN 'http://www.bgtu.edu.bd/' -- Begum Gulchemonara Trust University
    WHEN 114 THEN 'https://www.rstu.edu.bd/' -- Rangamati Science and Technology University
    WHEN 115 THEN 'http://www.tiub.edu.bd/' -- The International University of Scholars
    WHEN 116 THEN 'http://www.bsfmu.edu.bd/' -- Bangamata Sheikh Fojilatunnesa Mujib Science and Technology University
    WHEN 117 THEN 'https://www.uctc.edu.bd/' -- University of Creative Technology Chittagong
    WHEN 118 THEN 'https://www.rub.edu.bd/' -- Rabindra University, Bangladesh
    WHEN 119 THEN 'http://akmnu.edu.bd/' -- Anwer Khan Modern University
    WHEN 120 THEN 'http://www.rstu.edu.bd/' -- Rajshahi Science and Technology University
    WHEN 121 THEN 'https://www.nwu.edu.bd/' -- North Western University
    WHEN 122 THEN 'https://www.biu.ac.bd/' -- Bangladesh Islami University
    WHEN 123 THEN 'https://rsmu.edu.bd/' -- Rajshahi Medical University
    WHEN 124 THEN 'https://www.hamdarduniversity.edu.bd/' -- Hamdard University of Bangladesh
    WHEN 125 THEN 'https://www.gub.edu.bd/' -- German University Bangladesh
    WHEN 126 THEN 'https://www.nubtkhulna.edu.bd/' -- Northern University of Business and Technology, Khulna
    WHEN 127 THEN 'https://www.cwu.edu.bd/' -- Central Women's University
    WHEN 128 THEN 'https://www.npiub.edu.bd/' -- N.P.I. University of Bangladesh
    WHEN 129 THEN 'http://www.feniuniversity.edu.bd/' -- Feni University
    WHEN 130 THEN 'http://rmu.edu.bd/' -- Rabindra Maitree University
    WHEN 131 THEN 'https://www.rpsu.edu.bd/' -- Ranada Prasad Shaha University
    WHEN 132 THEN 'http://iiubd.edu.bd/' -- Ishakha International University, Bangladesh
    WHEN 133 THEN 'https://www.kau.edu.bd/' -- Khulna Agricultural University
    WHEN 134 THEN 'https://www.nbiu.edu.bd/' -- North Bengal International University
    WHEN 135 THEN 'http://www.pust.ac.bd/' -- Pundra University of Science and Technology
    WHEN 136 THEN 'http://www.buhs.edu.bd/' -- Bangladesh University of Health Sciences
    WHEN 137 THEN 'https://kyau.edu.bd/' -- Khwaja Yunus Ali University
    WHEN 138 THEN 'https://www.isubd.edu.bd/' -- International Standard University
    WHEN 139 THEN 'http://www.bub.edu.bd/' -- Bandarban University
    WHEN 140 THEN 'http://www.globaluniversity.edu.bd/' -- Global University Bangladesh
    WHEN 141 THEN 'https://www.smu.edu.bd/' -- Sylhet Medical University
    WHEN 142 THEN 'http://www.cun.edu.bd/' -- CCN University of Science and Technology
    WHEN 143 THEN 'https://www.timesuniversitybd.edu.bd/' -- Times University of Bangladesh
    WHEN 144 THEN 'http://www.britannia.edu.bd/' -- Britannia University
    WHEN 145 THEN 'http://www.cbiu.ac.bd/' -- Cox's Bazar International University
    WHEN 146 THEN 'http://www.zhsust.edu.bd/' -- Z.H. Sikder University of Science and Technology
    WHEN 147 THEN 'http://www.cust.edu.bd/' -- Central University of Science and Technology
    WHEN 148 THEN 'https://www.ebaub.edu.bd/' -- Exim Bank Agricultural University of Bangladesh
END;


UPDATE universities
SET QSWorldRanking_2023 = CASE university_name
    WHEN 'University of Dhaka' THEN '691-700'
    WHEN 'Bangladesh University of Engineering and Technology' THEN '801-850'
    WHEN 'North South University' THEN '851-900'
    WHEN 'BRAC University' THEN '1001-1200'
    WHEN 'Chittagong University of Engineering and Technology' THEN '1201-1400'
    WHEN 'Daffodil International University' THEN '1201-1400'
    WHEN 'East West University' THEN '1201-1400'
    WHEN 'Jahangirnagar University' THEN '1201-1400'
    WHEN 'Khulna University of Engineering and Technology' THEN '1201-1400'
    WHEN 'United International University' THEN '1201-1400'
    WHEN 'International University of Business, Agriculture and Technology (IUBAT)' THEN '1401+'
    WHEN 'Khulna University' THEN '1401+'
    WHEN 'Rajshahi University' THEN '1401+'
    WHEN 'Shahjalal University of Science and Technology' THEN '1401+'
    WHEN 'Stamford University Bangladesh' THEN '1401+'
END;
-- Insert data into Subject Table (for sample subjects)
INSERT INTO subjects (sub_name, university_id)
VALUES
    ('Computer Science', 2),
    ('Mechanical Engineering', 2),
    ('Economics', 1),
    ('Physics', 5);
    
-- Insert data into Subject Table (for sample subjects)
INSERT INTO subjects (sub_name, university_id)
VALUES
    ('Chemistry', 3),
    ('Biology', 3),
    ('Civil Engineering', 2),
    ('Electrical Engineering', 2),
    ('History', 1),
    ('Mathematics', 6),
    ('Environmental Science', 4),
    ('Psychology', 7);



ALTER TABLE Alumni
MODIFY `batch` VARCHAR(255);

-- Insert the first batch of data into the Alumni table
INSERT INTO Alumni (full_name, `batch`, `Current Employer`,`location` ,`Current Designation`, degree_earned, university_id)
VALUES
    ('Md Abu Nader Al Mokaddes', 'BSc 01st', 'Berger Paints Bangladesh Ltd','Bangladesh', 'General Manager - IT', 'BSc', 1),
    ('Anwarul Hoque', 'BSc 04th', 'Deloitte, Canada','Canada ', 'Senior Consultant', 'BSc', 1),
    ('Md. Rashedul Bari', 'BSc 06th', 'Banglalink Digital Communication Ltd','Bangladesh', 'Information Technology Senior Manager', 'BSc', 1),
    ('Mohammad Shahriar Rahman', 'BSc 06th', 'University of Liberal Arts Bangladesh','Bangladesh', 'Associate Professor', 'BSc', 1),
    ('Abdullah Al Qayum', 'BSc 07th', 'SPFTL','Bangladesh', 'Project Lead', 'BSc', 1),
    ('Khaled Monsoor', 'BSc 07th', 'Augmedix Bangladesh Ltd.', 'Bangladesh','Sr. Software Engineer', 'BSc', 1),
    ('Sabbir Ahmed Chowdhury', 'BSc 07th', 'University of Dhaka','Bangladesh', 'Assistant Professor', 'BSc', 1),
    ('Md Abu Hena Mostofa Kamal', 'BSc 08th', 'Progoti Systems limited (SureCash)', 'Bangladesh','AVP, IT Operations and product', 'BSc', 1),
    ('Sakira Hassan', 'BSc 08th', 'Aalto University + Silo.AI','Finland.', 'Postdoctoral Researcher + AI Scientist', 'BSc', 1),
    ('Md Tariqul Islam', 'BSc 08th', 'Syracuse University (New York, United States)', 'USA','Assistant Professor', 'BSc', 1);


SET SQL_SAFE_UPDATES = 1;

UPDATE Alumni
SET location = 'Finland' -- Replace 'New Location' with the updated location value
WHERE full_name = 'Sakira Hassan';


INSERT INTO Alumni (full_name, `batch`, `Current Employer`, `location`, `Current Designation`, degree_earned, university_id)
VALUES
  ('Zakir Akram', 'BSc 09th', 'Uber Technologies Inc.', 'USA', 'Security Engineer', 'BSc', 1),
  ('Mehedi Hasan', 'BSc 09th', 'Stamford University Bangladesh', 'Bangladesh', 'Associate Professor', 'BSc', 1),
  ('Ataul Haque', 'BSc 10th', 'BUFT', 'Bangladesh', 'Sr. Software Development Officer', 'BSc', 1),
  ('Md Kayum Hossan', 'BSc 10th', 'Kona Software Lab', 'Bangladesh', 'Sr Engineer', 'BSc', 1),
  ('Md. Enamul Haque', 'BSc 10th', 'Ministry of Women and Children Affairs', 'Bangladesh', 'Programmer', 'BSc', 1),
  ('Adnan I Khair', 'BSc 11th', 'Amazon', 'USA', 'Software Development Engineer', 'BSc', 1),
  ('Jyoti Islam', 'BSc 11th', 'Georgia State University', 'USA', 'PhD Student', 'BSc', 1),
  ('Md Ashraf Uddin', 'BSc 11th', 'Federation University Australia', 'Canada', 'PhD Student', 'BSc', 1),
  ('Md. Faisal Hossain', 'BSc 11th', 'Mercantile Bank Ltd.', 'Bangladesh', 'Head of ICT Security', 'BSc', 1),
  ('B M Saif Ansary', 'BSc 12th', 'Apple Inc', 'USA', 'Software Engineer', 'BSc', 1),
  ('Farhana Haque', 'BSc 12th', 'United Nations Bangkok', 'Thailand', 'Consultant (Java Android Developer)', 'BSc', 1),
  ('Imran Khan Rahat', 'BSc 12th', 'Samsung R&D Institute Bangladesh', 'Bangladesh', 'Technical Lead', 'BSc', 1);


INSERT INTO Alumni (full_name, `batch`, `Current Employer`, `location`, `Current Designation`, degree_earned, university_id)
VALUES
  ('MD MAHAMUDUL HASIB', 'BSc 12th', 'Wipro Ltd', 'Bangladesh', 'Project Engineer (Cyber and Information Security)', 'BSc', 1),
  ('Sajal Halder', 'BSc 12th', 'RMIT University, Australia.', 'Australia', 'PhD Candidate', 'BSc', 1),
  ('Sharafat Ibn Mollah Mosharraf', 'BSc 12th', 'Backpack Technologies, Inc.', 'Bangladesh', 'Senior Software Engineer', 'BSc', 1),
  ('Anna Fariha', 'BSc 13th', 'University of Massachusetts Amherst', 'USA', 'Research Assistant', 'BSc', 1),
  ('G.M. Akther Hossain Bappy', 'BSc 13th', 'Shahjalal Islami Bank Limited', 'Bangladesh', 'AEO', 'BSc', 1),
  ('Hasnain Heickal', 'BSc 13th', 'Dept. of CSE, University of Dhaka', 'Bangladesh', 'Assistant Professor', 'BSc', 1),
  ('Mahmood Jasim', 'BSc 13th', 'University of Massachusetts Amherst', 'USA', 'Graduate Student, Lecturer', 'BSc', 1),
  ('Md Shiplu Hawlader', 'BSc 13th', 'University of Memphis', 'USA', 'Graduate Assistant', 'BSc', 1),
  ('Md Tahzib Ul Islam', 'BSc 13th', 'Dhaka International University', 'Bangladesh', 'Assistant Professor', 'BSc', 1),
  ('Md. Shafiqul Islam', 'BSc 13th', 'Dohatec new media', 'Bangladesh', 'Software Engineer', 'BSc', 1),
  ('Mohammad Mazharul Islam', 'BSc 13th', 'Bangladesh Bank', 'Bangladesh', 'Deputy Director', 'BSc', 1),
  ('Mohammad Rasel Kabir', 'BSc 13th', 'GraphicPeople', 'Bangladesh', 'Web Developer', 'BSc', 1),
  ('Sabbir Ahmed', 'BSc 13th', 'Uber Technologies', 'Netherlands', 'Software Engineer', 'BSc', 1),
  ('Fahmida Hossain', 'BSc 14th', 'IPVision Canada Incorporation', 'Bangladesh', 'Software Engineer', 'BSc', 1),
  ('Habib Al Saki', 'BSc 14th', 'Tiger IT Bangladesh Ltd', NULL, 'Application Support Analyst', 'BSc', 1),
  ('Imtiaz Zaman Nishith', 'BSc 14th', 'Dohatec New Media', 'Bangladesh', 'Senior Software Engineer', 'BSc', 1),
  ('Md Raisul Islam', 'BSc 14th', 'Power Grid Company of Bangladesh (PGCB)', 'Bangladesh', 'Sub Divisional Engineer (SDE)', 'BSc', 1),
  ('Raiful Hasan', 'BSc 14th', 'University of Tennessee', 'USA', 'Research Assistant', 'BSc', 1),
  ('Sharif Ahmed', 'BSc 14th', 'Therap BD', 'Bangladesh', 'Senior Software Engineer', 'BSc', 1),
  ('Abdullah Al Masud', 'BSc 15th', 'Agrani Bank Ltd', 'Bangladesh', 'Senior Officer', 'BSc', 1),
  ('Amit Kumar Das', 'BSc 15th', 'East West University', 'Bangladesh', 'Senior Lecturer', 'BSc', 1),
  ('Asif Mahmood', 'BSc 15th', 'The Open University, UK', 'UK', 'Postgraduate Student', 'BSc', 1),
  ('Chadni Islam', 'BSc 15th', 'University of Adelaide', 'Australia', 'PhD Student', 'BSc', 1);

INSERT INTO Alumni (full_name, `batch`, `Current Employer`, `location`, `Current Designation`, degree_earned, university_id)
VALUES
  ('Kazi Irfan Bin Yusuf', 'BSc 15th', 'Bangladesh Krishi Bank', 'Bangladesh', 'Assistant Programmer', 'BSc', 1),
  ('Masud Parves Bhuiyan', 'BSc 15th', 'Samsung R&D, Bangladesh', 'Bangladesh', 'Lead Engineer', 'BSc', 1),
  ('Masud Parves Bhuiyan', 'BSc 15th', 'Agoda Services Co. Ltd', 'Thailand', 'Software Engineer', 'BSc', 1),
  ('MD. Badi-Uz-Zaman Shajib', 'BSc 15th', 'Kona Software Lab LTD.', 'Bangladesh', 'Sr. Engineer', 'BSc', 1),
  ('Md. Yasser Arafat', 'BSc 15th', 'Kona Software Lab Ltd.', 'Bangladesh', 'Senior Engineer', 'BSc', 1),
  ('Monir', 'BSc 15th', 'Enosis Solutions', 'Bangladesh', 'Senior Software Engineer', 'BSc', 1),
  ('Mushfekur Rahman', 'BSc 15th', 'Therap BD Ltd', 'Bangladesh', 'Senior Software Engineer', 'BSc', 1),
  ('Nazmus Sakib Miazi', 'BSc 15th', 'University of North Carolina, Charlotte', 'USA', 'Graduate Research Assistant', 'BSc', 1),
  ('Nuibb Hasan', 'BSc 15th', 'Datasoft systems Bangladesh limited', 'Bangladesh', 'Sr. Software Engineer', 'BSc', 1),
  ('Sayef Azad Sakin', 'BSc 15th', 'Structured Data Systems Limited', 'Bangladesh', 'Software Engineer', 'BSc', 1),
  ('Tabassum Tahrin Trisha', 'BSc 15th', 'iPay Systems Ltd.', 'null', 'Software Engineer', 'BSc', 1),
  ('Abdullah Al Hafiz', 'BSc 16th', 'Therap BD Ltd.', 'Bangladesh', 'Senior Software Engineer', 'BSc', 1),
  ('Amit Kumar Nath', 'BSc 16th', 'University of North Carolina, Charlotte', 'USA', 'Graduate Research Assistant (GRA) and Teaching Assistant', 'BSc', 1),
  ('Ataur Rahman', 'BSc 16th', 'TigerIT Bangladesh Limited', 'Bangladesh', 'Software Engineer', 'BSc', 1),
  ('Fakhrul Islam Rana', 'BSc 16th', 'Kona Software Lab Ltd.', 'Bangladesh', 'Software Engineer, QA', 'BSc', 1),
  ('Krishanu Sarker', 'BSc 16th', 'Georgia State University', 'USA', 'Presidential Fellow', 'BSc', 1),
  ('Md Ishtiak Alam', 'BSc 16th', 'Banglalink Digital Communications Ltd', 'Bangladesh', 'Business Intelligence Manager', 'BSc', 1),
  ('Md. Shahidur Rahman', 'BSc 16th', 'The Jaxara IT Ltd.', 'Bangladesh', 'Senior Software Engineer QA', 'BSc', 1),
  ('Mir Mehedi Ahsan Pritom', 'BSc 16th', 'University of Texas at San Antonio', 'USA', 'Graduate Research Fellow', 'BSc', 1),
  ('Momontho Mashak Monmoy', 'BSc 16th', 'Google', 'USA', 'Software Engineer', 'BSc', 1),
  ('Muntasir Mustafa', 'BSc 16th', 'CSL Software Resources Ltd.', 'Bangladesh', 'Programmer', 'BSc', 1),
  ('Rashedul Hasan Rijul', 'BSc 16th', 'PayPal PTE. LTD', 'Singapore', 'Software Engineer', 'BSc', 1)
;

-- Add as many records as needed, following the same format.
INSERT INTO Alumni (full_name, `batch`, `Current Employer`, `location`, `Current Designation`, degree_earned, university_id)
VALUES
  ('Rifatul Islam', 'BSc 16th', 'University of Texas at San Antonio', 'USA', 'Research Assistant', 'BSc', 1),
  ('Sabiha Salma', 'BSc 16th', 'George Mason University', 'USA', 'Graduate Teaching Assistant', 'BSc', 1),
  ('Sanjay Saha', 'BSc 16th', 'National University of Singapore', 'Singapore', 'PhD Student', 'BSc', 1),
  ('Shafaet Ashraf', 'BSc 16th', 'traveloka', 'Singapore', 'Software Engineer', 'BSc', 1),
  ('Shain Shahid Chowdhury', 'BSc 16th', 'Wipro Bangladesh Limited', 'Bangladesh', 'Senior Java EE Engineer', 'BSc', 1),
  ('Sharbani Pandit', 'BSc 16th', 'Georgia Institute of Technology', 'USA', 'Research Assistant', 'BSc', 1),
  ('Shihab Rahman', 'BSc 16th', 'Infolytx Bangladesh Limited', 'Bangladesh', 'Senior Software Engineer', 'BSc', 1),
  ('Tahmina Azmin', 'BSc 16th', 'Bangladesh Bank', 'Bangladesh', 'Assistant Maintenance Engineer (AD)', 'BSc', 1),
  ('Tawkir Ahmed', 'BSc 16th', 'Eskimi', 'Bangladesh', 'Senior Scala Engineer', 'BSc', 1),
  ('A M A Erfan Bashar', 'BSc 17th', 'BRAC Bank Ltd', 'Bangladesh', 'Associate Manager', 'BSc', 1),
  ('Anjum Riashat', 'BSc 17th', 'Monstar Lab Bangladesh Ltd', 'Bangladesh', 'Senior Software Engineer', 'BSc', 1),
  ('Julkar Nain', 'BSc 17th', 'Therap', 'Bangladesh', 'Software Engineer', 'BSc', 1),
  ('Mahamudul Hasan', 'BSc 17th', 'East West University', 'Bangladesh', 'Lecturer', 'BSc', 1),
  ('Masum Billal', 'BSc 17th', 'Auleek ltd', 'Bangladesh', 'Machine Learning Engineer', 'BSc', 1),
  ('Md Naimul Hoque', 'BSc 17th', 'Stony Brook University', 'USA', 'PhD Student', 'BSc', 1),
  ('Md. Al-Imran Roton', 'BSc 17th', 'Dhaka International University', 'Bangladesh', 'Lecturer', 'BSc', 1),
  ('Md. Shamim Reza Sajib', 'BSc 17th', 'Bangladesh University of Business & Technology (BUBT)', 'Bangladesh', 'Lecturer', 'BSc', 1),
  ('Nayeema Sultana', 'BSc 17th', 'Daffodil International University', 'Bangladesh', 'Lecturer', 'BSc', 1),
  ('Rafiul Hye', 'BSc 17th', 'University of South Alabama', 'USA', 'Research Assistant', 'BSc', 1),
  ('Saikat Bose', 'BSc 17th', 'IPvision Soft Ltd.', 'Bangladesh', 'Software Engineer', 'BSc', 1),
  ('Tanvir Ahmed Pantho', 'BSc 17th', 'Eskimi', 'Bangladesh', 'Scala Engineer', 'BSc', 1),
  ('Umme Hafsa Billah', 'BSc 17th', 'University of Texas,Arlington', 'null', 'GTA', 'BSc', 1),
  ('Ahmed Shamim Hassan (Shaon)', 'BSc 18th', 'Pathao Ltd.', 'null', 'Software Engineer', 'BSc', 1),
  ('Anup Kumar Paul', 'BSc 18th', 'Sonali Polaris Financial Technology Limited', 'Bangladesh', 'Junior Consultant(R&d)', 'BSc', 1)
;

-- Add as many records as needed, following the same format.


INSERT INTO Alumni (full_name, `batch`, `Current Employer`, `location`, `Current Designation`, degree_earned, university_id)
VALUES
  ('Jessica Sharmin Rahman', 'BSc 18th', 'The Australian National University', 'Australia', 'PhD Student', 'BSc', 1),
  ('Kazi Mazbah Uddin', 'BSc 18th', 'Samsung R&D Institute Bangladesh', 'Bangladesh', 'Software Engineer', 'BSc', 1),
  ('Md. Ashraful Islam', 'BSc 18th', 'East West University', 'Bangladesh', 'Lecturer', 'BSc', 1),
  ('Md. Ataus Samad Biplob', 'BSc 18th', 'city university', 'Bangladesh', 'lecturer', 'BSc', 1),
  ('Md. Khalid Rahman', 'BSc 18th', 'Samsung R&D Institute Bangladesh Ltd.', 'Bangladesh', 'Software Engineer', 'BSc', 1),
  ('Md. Riaz Uddin', 'BSc 18th', 'Dhaka International University', 'Bangladesh', 'Lecturer', 'BSc', 1),
  ('Md. Ridwan Hossain Talukder', 'BSc 18th', 'null', 'null', 'null', 'BSc', 1),
  ('Md. Rubel Talukder', 'BSc 18th', 'Sonali Polaris Financial Technology Limited', 'Bangladesh', 'Junior Consultant(Software Developer)', 'BSc', 1),
  ('Mia Mohammed Imran', 'BSc 18th', 'AnyConnect Limited', 'Bangladesh', 'Software Engineer', 'BSc', 1),
  ('Mrityunjoy Saha Topu', 'BSc 18th', 'Agrani Bank Ltd.', 'Bangladesh', 'Senior Officer (ICT)', 'BSc', 1),
  ('Rashedul Islam', 'BSc 18th', 'Ipvision Canada Inc.', 'Bangladesh', 'Jr. Software Engineer', 'BSc', 1),
  ('S. M. Shaiful Alam', 'BSc 18th', 'Samsung R&D Institute Bangladesh Ltd.', 'Bangladesh', 'Senior Software Engineer', 'BSc', 1),
  ('Saidur Rahman', 'BSc 18th', 'Montana State University', 'USA', 'Research Assistant', 'BSc', 1),
  ('Sanad Saha', 'BSc 18th', 'Oregon State University', 'USA', 'Graduate Teaching Assistant', 'BSc', 1),
  ('Syeda Fatema Mazumder', 'BSc 18th', 'University of North Carolina at Charlotte', 'USA', 'Research Assistant', 'BSc', 1),
  ('Kazi Rashedul Islam', 'BSc 18th', 'Genuity Systems Ltd.', 'Bangladesh', 'Software Engineer', 'BSc', 1),
  ('Faria Noor', 'BSc 19th', 'Therap BD Ltd.', 'Bangladesh', 'Software Engineer, QA', 'BSc', 1),
  ('M. Tahsin Anwar (Akif)', 'BSc 19th', 'Therap BD Limited', 'Bangladesh', 'Associate Software Engineer', 'BSc', 1),
  ('Mahfujur Rahman Asif', 'BSc 19th', 'Monstar lab bangladesh', 'Bangladesh', 'Software Engineer', 'BSc', 1),
  ('Mazedul Islam Mazid', 'BSc 19th', 'Orbitax Bangladesh Ltd.', 'Bangladesh', 'Associate Software Engineer', 'BSc', 1),
  ('Md Muidul Alam', 'BSc 19th', 'Enosis Solutions', 'Bangladesh', 'Software Engineer', 'BSc', 1)
;
INSERT INTO Alumni (full_name, `batch`, `Current Employer`, `location`, `Current Designation`, degree_earned, university_id)
VALUES
  ('Md Zahin Jawad', 'BSc 19th', 'Works Applications Singapore', 'Singapore', 'Software Engineer', 'BSc', 1),
  ('Md. Saiful Islam', 'BSc 19th', 'Therap Services', 'Bangladesh', 'Software Engineer', 'BSc', 1),
  ('Mohammad Mazedul Islam Mazid', 'BSc 19th', 'Brikl', 'Bangladesh', 'Senior Software Engineer', 'BSc', 1),
  ('Mohammad Washeef Ibn Waliur', 'BSc 19th', 'N/A', 'N/A', 'Bangladesh', 'N/A', 1),
  ('Muhammad Jawad Iqbal', 'BSc 19th', 'iPay Systems Ltd.', 'Bangladesh', 'Software Engineer', 'BSc', 1),
  ('Rakib Ahsan', 'BSc 19th', 'Works Applications Singapore PTE LTD.', 'Singapore', 'Software Engineer', 'BSc', 1),
  ('Tamim Addari', 'BSc 19th', 'DBS Bank', 'Singapore', 'Associate', 'BSc', 1),
  ('Apu Kumar Chakroborti', 'BSc 20th', 'Sonali Polaris FT Limited', 'Bangladesh', 'Engineering Trainee', 'BSc', 1),
  ('Azizul Hakim', 'BSc 20th', 'Analyzen Bangladesh Ltd.', 'Bangladesh', 'Software Engineer', 'BSc', 1),
  ('Golam Azrin', 'BSc 20th', 'DSI (Software Bangladesh)', 'Bangladesh', 'Developer', 'BSc', 1),
  ('Hosneara Ahmed', 'BSc 20th', 'University of Memphis', 'USA', 'Graduate Research Assistant', 'BSc', 1),
  ('Md Tahsin Tausif', 'BSc 20th', 'Virginia Tech', 'USA', 'PhD Student', 'BSc', 1),
  ('Md. Al- Zihad', 'BSc 20th', 'Therap BD Ltd.', 'Bangladesh', 'Associate Software Engineer', 'BSc', 1),
  ('Md. Jahid Hasan', 'BSc 20th', 'SonaliPolaris FT Limited', 'Bangladesh', 'Engineering Trainee', 'BSc', 1),
  ('Md. Mahir Ashhab', 'BSc 20th', 'Eastern University', 'Bangladesh', 'Lecturer', 'BSc', 1),
  ('Md. Muhaimin shah pahalovi', 'BSc 20th', 'Kona software lab', 'Bangladesh', 'Jr. Engineer (R&D)', 'BSc', 1),
  ('Md. Rofiqul Islam', 'BSc 20th', 'TigeritBD Ltd', 'Bangladesh', 'Software Engineer', 'BSc', 1),
  ('Md. Shorifuzzaman', 'BSc 20th', 'Enosis Solutions', 'Bangladesh', 'Software Engineer', 'BSc', 1),
  ('Mehedi Hasan', 'BSc 20th', 'Analyzen Bangladesh Ltd.', 'Bangladesh', 'Software Engineer', 'BSc', 1),
  ('Mehedi Hasan Masum', 'BSc 20th', 'NewsCred Inc.', 'Bangladesh', 'Software Engineer', 'BSc', 1),
  ('Nafis Sazid', 'BSc 20th', 'WellDev Bangladesh Ltd', 'Bangladesh', 'Junior Software Engineer', 'BSc', 1),
  ('Roza Tabassum Ratri', 'BSc 20th', 'Bit Mascot (Pvt.) Ltd.', 'Bangladesh', 'Assistant Project Manager', 'BSc', 1),
  ('Shafayat Nabi Chowdhury', 'BSc 20th', 'AnyConnect LLC', 'Bangladesh', 'Software Engineer', 'BSc', 1),
  ('Swasti Sunder Das', 'BSc 20th', 'KONA Software Lab Limited', 'Bangladesh', 'Jr. Engineer', 'BSc', 1),
  ('Tanvir Shahriar Rifat', 'BSc 20th', 'Therap (BD) Ltd', 'Bangladesh', 'Software Engineer', 'BSc', 1)
  
;



INSERT INTO Alumni (full_name, `batch`, `Current Employer`, `location`, `Current Designation`, degree_earned, university_id)
VALUES
  ('Tanzir Islam', 'BSc 20th', 'Stony Brook University', 'Bangladesh', 'PhD Student', 'BSc', 1),
  ('Jyotirmay Nag Setu', 'BSc 21st', 'Robi Axiata Ltd.', 'Bangladesh', 'Data Engineer', 'BSc', 1),
  ('Md Sadman Sakib', 'BSc 21st', 'Samsung R&D Institute, Bangladesh', 'Bangladesh', 'Software Engineer', 'BSc', 1),
  ('Md. Shahriar Hossain Sajib', 'BSc 21st', 'Samsung R&D Institute', 'Bangladesh', 'Software Engineer', 'BSc', 1),
  ('Nazmus Sakib', 'BSc 21st', 'Samsung R&D Institute Bangladesh', 'Bangladesh', 'Software Engineer', 'BSc', 1),
  ('Md. Samiul Islam Siddiqui', 'BSc 22nd', 'TigerIT Bangladesh Limited', 'Bangladesh', 'Software Engineer', 'BSc', 1),
  ('Yitoshee Rahman', 'BSc 17th', 'University of Louisiana at Lafayette', 'USA', 'GRA', 'BSc', 1),
  ('Nazia Hasan', 'BSc 11th', 'Platform of Trust', 'Tampere', 'Head of Design', 'BSc', 1),
  ('Rakib Ahsan', 'BSc 19th', 'Cargill', 'Singapore', 'Software Engineer', 'BSc', 1),
  ('Lokesh Chandra Das', 'BSc 17th', 'University of Memphis', 'USA', 'PhD Student', 'BSc', 1),
  ('Showkot Hossain', 'BSc 22nd', 'Dohatec New Media', 'Bangladesh', 'Software Engineer', 'BSc', 1),
  ('Md Shiplu Hawlader', 'BSc 13th', 'Google', 'USA', 'Software Engineer', 'BSc', 1),
  ('Md. Shafiqul Islam (Nafsan)', 'BSc 23rd', 'Enosis Solutions', 'Bangladesh', 'Software Engineer - Level 2', 'BSc', 1),
  ('Kamal Parvez', 'BSc 22nd', 'TigerIT Bangladesh', 'Bangladesh', 'Software Engineer QA', 'BSc', 1),
  ('Md Ashraf Uddin', 'BSc 11th', 'Jagannath University', 'Bangladesh', 'Associate Professor', 'BSc', 1),
  ('Muhammed Tawfiqul Islam', 'BSc 13th', 'University of Melbourne', 'Australia', 'Associate Lecturer', 'BSc', 1),
  ('Mahbuba Afrin', 'BSc 17th', 'Curtin University', 'Australia', 'Lecturer', 'BSc', 1),
  ('MD. Rajeb Talukder', 'BSc 21st', 'CAMPFIRE, Inc.', 'Japan', 'Data Analyst', 'BSc', 1),
  ('Md Reaj', 'BSc 23rd', 'Therap BD', 'Bangladesh', 'Software Engineer', 'BSc', 1),
  ('SONIA NAZ', 'MS 5th', 'DataTech', 'Bangladesh', 'Managing Director & CEO', 'MS', 1),
  ('K. M. Merajul Arefin', 'BSc 23rd', 'Samsung R&D Institute Bangladesh', 'Bangladesh', 'Software Engineer', 'BSc', 1)
;

--sample data for university_id
INSERT INTO Alumni (full_name, `batch`, `Current Employer`, `location`, `Current Designation`, degree_earned, university_id)
VALUES
  ('John Doe', 'BSc 2020', 'Company A', 'USA', 'Software Engineer', 'BSc', 2),
  ('Jane Smith', 'BSc 2019', 'Company B', 'Bangladesh', 'Data Analyst', 'BSc', 2),
  ('Mike Johnson', 'BSc 2021', 'Company C', 'Canada', 'Product Manager', 'BSc', 2),
  ('Emily Brown', 'BSc 2018', 'Company D', 'Finland', 'Software Developer', 'BSc', 2),
  ('David Lee', 'BSc 2017', 'Company E', 'Singapore', 'QA Engineer', 'BSc', 2),
  ('Sarah White', 'BSc 2016', 'Company F', 'USA', 'Project Manager', 'BSc', 2),
  ('Robert Wilson', 'BSc 2022', 'Company G', 'Bangladesh', 'Business Analyst', 'BSc', 2),
  ('Karen Hall', 'BSc 2015', 'Company H', 'Canada', 'Systems Analyst', 'BSc', 2),
  ('William Miller', 'BSc 2014', 'Company I', 'Finland', 'Database Administrator', 'BSc', 2),
  ('Linda Davis', 'BSc 2013', 'Company J', 'Singapore', 'Network Engineer', 'BSc', 2),
  ('James Clark', 'BSc 2023', 'Company K', 'USA', 'IT Consultant', 'BSc', 2),
  ('Patricia Lewis', 'BSc 2012', 'Company L', 'Bangladesh', 'Product Owner', 'BSc', 2),
  ('Joseph Walker', 'BSc 2011', 'Company M', 'Canada', 'Data Scientist', 'BSc', 2),
  ('Nancy Martin', 'BSc 2024', 'Company N', 'Finland', 'Web Developer', 'BSc', 2),
  ('Daniel Hall', 'BSc 2010', 'Company O', 'Singapore', 'Project Coordinator', 'BSc', 2),
  ('Jennifer Moore', 'BSc 2009', 'Company P', 'USA', 'UI/UX Designer', 'BSc', 2),
  ('Charles Taylor', 'BSc 2025', 'Company Q', 'Bangladesh', 'Security Analyst', 'BSc', 2),
  ('Elizabeth Anderson', 'BSc 2008', 'Company R', 'Canada', 'Cloud Engineer', 'BSc', 2),
  ('Michael King', 'BSc 2007', 'Company S', 'Finland', 'DevOps Engineer', 'BSc', 2),
  ('Maria Robinson', 'BSc 2026', 'Company T', 'Singapore', 'Network Administrator', 'BSc', 2),
  ('Robert Harris', 'BSc 2006', 'Company U', 'USA', 'Software Architect', 'BSc', 2),
  ('Jessica Scott', 'BSc 2005', 'Company V', 'Bangladesh', 'Data Engineer', 'BSc', 2),
  ('John Miller', 'BSc 2027', 'Company W', 'Canada', 'IT Support Specialist', 'BSc', 2),
  ('Laura Lee', 'BSc 2004', 'Company X', 'Finland', 'Front-End Developer', 'BSc', 2),
  ('Richard Wright', 'BSc 2003', 'Company Y', 'Singapore', 'Database Developer', 'BSc', 2),
  ('Susan Hall', 'BSc 2028', 'Company Z', 'USA', 'Software Tester', 'BSc', 2),
  ('Thomas Davis', 'BSc 2002', 'Company AA', 'Bangladesh', 'QA Tester', 'BSc', 2),
  ('Karen Taylor', 'BSc 2001', 'Company BB', 'Canada', 'IT Analyst', 'BSc', 2),
  ('Daniel Scott', 'BSc 2029', 'Company CC', 'Finland', 'Systems Engineer', 'BSc', 2),
  ('Megan Martin', 'BSc 2000', 'Company DD', 'Singapore', 'Business Analyst', 'BSc', 2),
  ('Paul Smith', 'BSc 1999', 'Company EE', 'USA', 'Network Technician', 'BSc', 2),
  ('Emily Wilson', 'BSc 2030', 'Company FF', 'Bangladesh', 'Web Developer', 'BSc', 2),
  ('William Brown', 'BSc 1998', 'Company GG', 'Canada', 'Software Developer', 'BSc', 2),
  ('Amanda Johnson', 'BSc 1997', 'Company HH', 'Finland', 'Project Manager', 'BSc', 2),
  ('Edward Hall', 'BSc 2031', 'Company II', 'Singapore', 'Business Analyst', 'BSc', 2),
  ('Sarah Moore', 'BSc 1996', 'Company JJ', 'USA', 'Data Scientist', 'BSc', 2),
  ('Christopher Davis', 'BSc 1995', 'Company KK', 'Bangladesh', 'Web Developer', 'BSc', 2),
  ('Jessica Scott', 'BSc 2032', 'Company LL', 'Canada', 'IT Consultant', 'BSc', 2),
  ('Michael Miller', 'BSc 1994', 'Company MM', 'Finland', 'Product Owner', 'BSc', 2);

INSERT INTO Alumni (full_name, `batch`, `Current Employer`, `location`, `Current Designation`, degree_earned, university_id)
VALUES
  ('Aiden Johnson', 'BSc 2020', 'Company A', 'USA', 'Software Engineer', 'BSc', 3),
  ('Sophia Lee', 'BSc 2019', 'Company B', 'Bangladesh', 'Data Analyst', 'BSc', 3),
  ('Liam Smith', 'BSc 2021', 'Company C', 'Canada', 'Product Manager', 'BSc', 3),
  ('Olivia Martin', 'BSc 2018', 'Company D', 'Finland', 'Software Developer', 'BSc', 3),
  ('Noah Brown', 'BSc 2017', 'Company E', 'Singapore', 'QA Engineer', 'BSc', 3),
  ('Emma Davis', 'BSc 2016', 'Company F', 'USA', 'Project Manager', 'BSc', 3),
  ('Oliver Wilson', 'BSc 2022', 'Company G', 'Bangladesh', 'Business Analyst', 'BSc', 3),
  ('Ava Taylor', 'BSc 2015', 'Company H', 'Canada', 'Systems Analyst', 'BSc', 3),
  ('Elijah Hall', 'BSc 2014', 'Company I', 'Finland', 'Database Administrator', 'BSc', 3),
  ('Charlotte Lee', 'BSc 2013', 'Company J', 'Singapore', 'Network Engineer', 'BSc', 3),
  ('Lucas Clark', 'BSc 2023', 'Company K', 'USA', 'IT Consultant', 'BSc', 3),
  ('Grace Lewis', 'BSc 2012', 'Company L', 'Bangladesh', 'Product Owner', 'BSc', 3),
  ('Mason Walker', 'BSc 2011', 'Company M', 'Canada', 'Data Scientist', 'BSc', 3),
  ('Amelia Moore', 'BSc 2024', 'Company N', 'Finland', 'Web Developer', 'BSc', 3),
  ('Henry Hall', 'BSc 2010', 'Company O', 'Singapore', 'Project Coordinator', 'BSc', 3),
  ('Scarlett Moore', 'BSc 2009', 'Company P', 'USA', 'UI/UX Designer', 'BSc', 3),
  ('Jackson Harris', 'BSc 2025', 'Company Q', 'Bangladesh', 'Security Analyst', 'BSc', 3),
  ('Sophie Anderson', 'BSc 2008', 'Company R', 'Canada', 'Cloud Engineer', 'BSc', 3),
  ('Ethan King', 'BSc 2007', 'Company S', 'Finland', 'DevOps Engineer', 'BSc', 3),
  ('Abigail Robinson', 'BSc 2026', 'Company T', 'Singapore', 'Network Administrator', 'BSc', 3),
  ('Daniel Taylor', 'BSc 2006', 'Company U', 'USA', 'Software Architect', 'BSc', 3),
  ('Avery Scott', 'BSc 2005', 'Company V', 'Bangladesh', 'Data Engineer', 'BSc', 3),
  ('Madison Miller', 'BSc 2027', 'Company W', 'Canada', 'IT Support Specialist', 'BSc', 3),
  ('David Wilson', 'BSc 2004', 'Company X', 'Finland', 'Front-End Developer', 'BSc', 3),
  ('Sofia Wright', 'BSc 2003', 'Company Y', 'Singapore', 'Database Developer', 'BSc', 3),
  ('Joseph Hall', 'BSc 2028', 'Company Z', 'USA', 'Software Tester', 'BSc', 3),
  ('Victoria Davis', 'BSc 2002', 'Company AA', 'Bangladesh', 'QA Tester', 'BSc', 3),
  ('Henry Taylor', 'BSc 2001', 'Company BB', 'Canada', 'IT Analyst', 'BSc', 3),
  ('Grace Scott', 'BSc 2029', 'Company CC', 'Finland', 'Systems Engineer', 'BSc', 3),
  ('William Martin', 'BSc 2000', 'Company DD', 'Singapore', 'Business Analyst', 'BSc', 3),
  ('Michael Smith', 'BSc 1999', 'Company EE', 'USA', 'Network Technician', 'BSc', 3),
  ('Abigail Wilson', 'BSc 2030', 'Company FF', 'Bangladesh', 'Web Developer', 'BSc', 3),
  ('Alexander Brown', 'BSc 1998', 'Company GG', 'Canada', 'Software Developer', 'BSc', 3),
  ('Madison Johnson', 'BSc 1997', 'Company HH', 'Finland', 'Project Manager', 'BSc', 3),
  ('James Davis', 'BSc 2031', 'Company II', 'Singapore', 'Business Analyst', 'BSc', 3),
  ('Ella Moore', 'BSc 1996', 'Company JJ', 'USA', 'Data Scientist', 'BSc', 3),
  ('Henry Clark', 'BSc 1995', 'Company KK', 'Bangladesh', 'Web Developer', 'BSc', 3),
  ('Evelyn Scott', 'BSc 2032', 'Company LL', 'Canada', 'IT Consultant', 'BSc', 3),
  ('Michael Miller', 'BSc 1994', 'Company MM', 'Finland', 'Product Owner', 'BSc', 3);


INSERT INTO Alumni (full_name, `batch`, `Current Employer`, `location`, `Current Designation`, degree_earned, university_id)
VALUES
  ('Liam Parker', 'BSc 2019', 'Company A', 'USA', 'Software Engineer', 'BSc', 4),
  ('Emma Turner', 'BSc 2018', 'Company B', 'Bangladesh', 'Data Analyst', 'BSc', 4),
  ('Oliver Brooks', 'BSc 2020', 'Company C', 'Canada', 'Product Manager', 'BSc', 4),
  ('Olivia King', 'BSc 2017', 'Company D', 'Finland', 'Software Developer', 'BSc', 4),
  ('Lucas Harris', 'BSc 2016', 'Company E', 'Singapore', 'QA Engineer', 'BSc', 4),
  ('Ava Lewis', 'BSc 2021', 'Company F', 'USA', 'Project Manager', 'BSc', 4),
  ('Noah Foster', 'BSc 2015', 'Company G', 'Bangladesh', 'Business Analyst', 'BSc', 4),
  ('Sophia Wright', 'BSc 2014', 'Company H', 'Canada', 'Systems Analyst', 'BSc', 4),
  ('Jackson Robinson', 'BSc 2022', 'Company I', 'Finland', 'Database Administrator', 'BSc', 4),
  ('Amelia Scott', 'BSc 2013', 'Company J', 'Singapore', 'Network Engineer', 'BSc', 4),
  ('Mason Davis', 'BSc 2023', 'Company K', 'USA', 'IT Consultant', 'BSc', 4),
  ('Oliver Adams', 'BSc 2012', 'Company L', 'Bangladesh', 'Product Owner', 'BSc', 4),
  ('Charlotte Young', 'BSc 2024', 'Company M', 'Canada', 'Data Scientist', 'BSc', 4),
  ('Elijah Clark', 'BSc 2011', 'Company N', 'Finland', 'Web Developer', 'BSc', 4),
  ('Grace Hall', 'BSc 2025', 'Company O', 'Singapore', 'Project Coordinator', 'BSc', 4),
  ('Henry Turner', 'BSc 2010', 'Company P', 'USA', 'UI/UX Designer', 'BSc', 4),
  ('Sophia Parker', 'BSc 2026', 'Company Q', 'Bangladesh', 'Security Analyst', 'BSc', 4),
  ('Ethan Harris', 'BSc 2009', 'Company R', 'Canada', 'Cloud Engineer', 'BSc', 4),
  ('Olivia Lewis', 'BSc 2027', 'Company S', 'Finland', 'DevOps Engineer', 'BSc', 4),
  ('Ella King', 'BSc 2008', 'Company T', 'Singapore', 'Network Administrator', 'BSc', 4),
  ('Mason Wright', 'BSc 2028', 'Company U', 'USA', 'Software Architect', 'BSc', 4),
  ('Sofia Martin', 'BSc 2007', 'Company V', 'Bangladesh', 'Data Engineer', 'BSc', 4),
  ('Noah Walker', 'BSc 2029', 'Company W', 'Canada', 'IT Support Specialist', 'BSc', 4),
  ('Oliver Adams', 'BSc 2006', 'Company X', 'Finland', 'Front-End Developer', 'BSc', 4),
  ('Avery King', 'BSc 2030', 'Company Y', 'Singapore', 'Database Developer', 'BSc', 4),
  ('Sophia Scott', 'BSc 2005', 'Company Z', 'USA', 'Software Tester', 'BSc', 4),
  ('Henry Foster', 'BSc 2031', 'Company AA', 'Bangladesh', 'QA Tester', 'BSc', 4),
  ('Ava Turner', 'BSc 2004', 'Company BB', 'Canada', 'IT Analyst', 'BSc', 4),
  ('Elijah Harris', 'BSc 2032', 'Company CC', 'Finland', 'Systems Engineer', 'BSc', 4),
  ('Sophia Moore', 'BSc 2003', 'Company DD', 'Singapore', 'Business Analyst', 'BSc', 4),
  ('Mason Wright', 'BSc 2033', 'Company EE', 'USA', 'Network Technician', 'BSc', 4),
  ('Olivia Robinson', 'BSc 2002', 'Company FF', 'Bangladesh', 'Web Developer', 'BSc', 4),
  ('Henry Turner', 'BSc 2034', 'Company GG', 'Canada', 'Software Developer', 'BSc', 4),
  ('Charlotte Walker', 'BSc 2001', 'Company HH', 'Finland', 'Project Manager', 'BSc', 4),
  ('Avery King', 'BSc 2035', 'Company II', 'Singapore', 'Business Analyst', 'BSc', 4),
  ('Ella Clark', 'BSc 2000', 'Company JJ', 'USA', 'Data Scientist', 'BSc', 4),
  ('Noah Foster', 'BSc 2036', 'Company KK', 'Bangladesh', 'Web Developer', 'BSc', 4),
  ('Emma Lewis', 'BSc 1999', 'Company LL', 'Canada', 'IT Consultant', 'BSc', 4),
  ('Sofia Turner', 'BSc 2037', 'Company MM', 'Finland', 'Product Owner', 'BSc', 4),
  ('Henry Parker', 'BSc 1998', 'Company NN', 'Singapore', 'QA Engineer', 'BSc', 4),
  ('Ava Wright', 'BSc 2038', 'Company OO', 'USA', 'Project Manager', 'BSc', 4),
  ('Oliver Young', 'BSc 1997', 'Company PP', 'Bangladesh', 'Business Analyst', 'BSc', 4),
  ('Sophia Davis', 'BSc 2039', 'Company QQ', 'Canada', 'Systems Analyst', 'BSc', 4),
  ('Mason Turner', 'BSc 1996', 'Company RR', 'Finland', 'Database Administrator', 'BSc', 4),
  ('Ella King', 'BSc 2040', 'Company SS', 'Singapore', 'Network Engineer', 'BSc', 4),
  ('Avery Scott', 'BSc 1995', 'Company TT', 'USA', 'IT Consultant', 'BSc', 4),
  ('Lucas Hall', 'BSc 2041', 'Company UU', 'Bangladesh', 'Product Owner', 'BSc', 4),
  ('Olivia Harris', 'BSc 1994', 'Company VV', 'Canada', 'Data Scientist', 'BSc', 4),
  ('Sofia Foster', 'BSc 2042', 'Company WW', 'Finland', 'Web Developer', 'BSc', 4),
  ('Henry Lewis', 'BSc 1993', 'Company XX', 'Singapore', 'Project Coordinator', 'BSc', 4),
  ('Noah Wright', 'BSc 2043', 'Company YY', 'USA', 'UI/UX Designer', 'BSc', 4),
  ('Ella Foster', 'BSc 1992', 'Company ZZ', 'Bangladesh', 'Security Analyst', 'BSc', 4);

INSERT INTO Alumni (full_name, `batch`, `Current Employer`, `location`, `Current Designation`, degree_earned, university_id)
VALUES
  ('John Smith', 'BSc 2019', 'Company X', 'USA', 'Software Engineer', 'BSc', 5),
  ('Emily Johnson', 'BSc 2018', 'Company Y', 'Bangladesh', 'Data Analyst', 'BSc', 5),
  -- Add more records as needed
  ('Michael Brown', 'BSc 2020', 'Company Z', 'Canada', 'Product Manager', 'BSc', 5);
  -- Add more records as needed
INSERT INTO Alumni (full_name, `batch`, `Current Employer`, `location`, `Current Designation`, degree_earned, university_id)
VALUES
  ('Sophia Davis', 'BSc 2019', 'Company A', 'USA', 'Software Engineer', 'BSc', 6),
  ('Liam Martin', 'BSc 2018', 'Company B', 'Bangladesh', 'Data Analyst', 'BSc', 6),
  -- Add more records as needed
  ('Ava Thompson', 'BSc 2020', 'Company C', 'Canada', 'Product Manager', 'BSc', 6);
  -- Add more records as needed
INSERT INTO Alumni (full_name, `batch`, `Current Employer`, `location`, `Current Designation`, degree_earned, university_id)
VALUES
  ('Ethan White', 'BSc 2019', 'Company X', 'USA', 'Software Engineer', 'BSc', 7),
  ('Olivia Harris', 'BSc 2018', 'Company Y', 'Bangladesh', 'Data Analyst', 'BSc', 7),
  -- Add more records as needed
  ('Lucas Davis', 'BSc 2020', 'Company Z', 'Canada', 'Product Manager', 'BSc', 7);
  -- Add more records as needed
INSERT INTO Alumni (full_name, `batch`, `Current Employer`, `location`, `Current Designation`, degree_earned, university_id)
VALUES
  ('Ava Wilson', 'BSc 2019', 'Company A', 'USA', 'Software Engineer', 'BSc', 8),
  ('Sophia Moore', 'BSc 2018', 'Company B', 'Bangladesh', 'Data Analyst', 'BSc', 8),
  -- Add more records as needed
  ('Ethan Taylor', 'BSc 2020', 'Company C', 'Canada', 'Product Manager', 'BSc', 8);
  -- Add more records as needed
INSERT INTO Alumni (full_name, `batch`, `Current Employer`, `location`, `Current Designation`, degree_earned, university_id)
VALUES
  ('Lucas Anderson', 'BSc 2019', 'Company X', 'USA', 'Software Engineer', 'BSc', 9),
  ('Ava Smith', 'BSc 2018', 'Company Y', 'Bangladesh', 'Data Analyst', 'BSc', 9),
  -- Add more records as needed
  ('Emily Harris', 'BSc 2020', 'Company Z', 'Canada', 'Product Manager', 'BSc', 9);
  -- Add more records as needed
INSERT INTO Alumni (full_name, `batch`, `Current Employer`, `location`, `Current Designation`, degree_earned, university_id)
VALUES
  ('Michael White', 'BSc 2019', 'Company A', 'USA', 'Software Engineer', 'BSc', 10),
  ('Liam Davis', 'BSc 2018', 'Company B', 'Bangladesh', 'Data Analyst', 'BSc', 10),
  -- Add more records as needed
  ('Sophia Thompson', 'BSc 2020', 'Company C', 'Canada', 'Product Manager', 'BSc', 10);
  -- Add more records as needed
-- Insert the subjects with their respective subject types
INSERT INTO subjects (sub_name, subject_type) VALUES
('English', 'Arts'),
('Bengali', 'Arts'),
('Philosophy', 'Arts'),
('History', 'Arts'),
('Arabic', 'Arts'),
('Sanskrit', 'Arts'),
('Islamic Studies', 'Arts'),
('Pali and Buddhist Studies', 'Arts'),
('Persian Language and Literature', 'Arts'),
('Finance', 'Commerce'),
('Accounting and Information Systems', 'Commerce'),
('Management', 'Commerce'),
('Marketing', 'Commerce'),
('Banking and Insurance', 'Commerce'),
('International Business', 'Commerce'),
('Tourism and Hospitality Management', 'Commerce'),
('Economics', 'Social Science'),
('Sociology', 'Social Science'),
('Political Science', 'Social Science'),
('Social Work', 'Social Science'),
('Mass Communication and Journalism', 'Social Science'),
('International Relations', 'Social Science'),
('Public Administration', 'Social Science'),
('Anthropology', 'Social Science'),
('Botany', 'Science'),
('Zoology', 'Science'),
('Biochemistry and Molecular Biology', 'Science'),
('Microbiology', 'Science'),
('Pharmacy', 'Science'),
('Physics', 'Science'),
('Chemistry', 'Science'),
('Theoretical Physics', 'Science'),
('Applied Mathematics', 'Science'),
('Statistics', 'Science'),
('Computer Science and Engineering', 'Science'),
('Geography and Environment', 'Science'),
('Geology', 'Science'),
('Disaster Science and Management', 'Science'),
('Fine Arts', 'Arts'),
('Graphic Design', 'Arts'),
('Ceramics', 'Arts'),
('Craft', 'Arts'),
('History of Art', 'Arts'),
('Sculpture', 'Arts'),
('Oriental Art', 'Arts'),
('Medicine', 'Science'),
('Surgery', 'Science'),
('Pediatrics', 'Science'),
('Orthopedic Surgery', 'Science'),
('Gynecology and Obstetrics', 'Science'),
('Dermatology', 'Science'),
('Radiology', 'Science'),
('Anesthesiology', 'Science'),
('Electrical and Electronic Engineering', 'Engineering'),
('Civil Engineering', 'Engineering'),
('Mechanical Engineering', 'Engineering'),
('Applied Chemistry and Chemical Engineering', 'Engineering'),
('Materials and Metallurgical Engineering', 'Engineering'),
('Nuclear Engineering', 'Engineering'),
('Industrial and Production Engineering', 'Engineering'),
('Water Resources Engineering', 'Engineering');
-- Insert the additional subjects with their respective faculty/department and number of seats
INSERT INTO subjects (sub_name, subject_type) VALUES
('Chemical Engineering', 'Engineering'),
('Materials and Metallurgical Engineering', 'Engineering'),
('Nanomaterials and Ceramic Engineering', 'Engineering'),
('Civil Engineering', 'Engineering'),
('Water Resource Engineering', 'Engineering'),
('Mechanical Engineering', 'Engineering'),
('Naval Architecture and Marine Engineering', 'Engineering'),
('Industrial and Production Engineering', 'Engineering'),
('Electrical and Electronic Engineering', 'Engineering'),
('Computer Science and Engineering', 'Engineering'),
('Biomedical Engineering', 'Engineering'),
('Architecture', 'Arts'),
('Urban and Regional Planning', 'Arts');
-- Update the subject type to 'Science' for the specified subjects
UPDATE subjects
SET subject_type = 'Science'
WHERE sub_name IN (
    'Chemical Engineering',
    'Materials and Metallurgical Engineering',
    'Nanomaterials and Ceramic Engineering',
    'Civil Engineering',
    'Water Resource Engineering',
    'Mechanical Engineering',
    'Naval Architecture and Marine Engineering',
    'Industrial and Production Engineering',
    'Electrical and Electronic Engineering',
    'Computer Science and Engineering',
    'Biomedical Engineering'
);
UPDATE subjects
SET subject_type = 'Science'
WHERE sub_name='Applied Chemistry and Chemical Engineering'
UPDATE subjects
SET subject_type = 'Science'
WHERE sub_name IN(
'Electrical and Electronic Engineering',
'Mathematics'
);
INSERT INTO professors (university_id, full_name, Designation, Email, sub_id)
VALUES
    (1, 'Dr. Saifuddin Md. Tareeq', 'Professor & Chairman', 'smtareeq@du.ac.bd', 5),
    (1, 'Dr. Suraiya Pervin', 'Professor', 'suraiya@du.ac.bd', 5),
    (1, 'Dr. Md. Haider Ali', 'Professor', 'haider@du.ac.bd', 5),
    (1, 'Dr. Hafiz Md. Hasan Babu', 'Professor', 'hafizbabu@du.ac.bd', 5),
    (1, 'Dr. Md. Rezaul Karim', 'Professor', 'rkarim@du.ac.bd', 5),
    (1, 'Dr. Md. Hasanuzzaman', 'Professor', 'hzaman@du.ac.bd', 5),
    (1, 'Dr. Shabbir Ahmed', 'Professor', 'sumaiyarafia@gmail.com', 5),
    (1, 'Dr. Md. Mustafizur Rahman', 'Professor', 'mustafiz@du.ac.bd', 5),
    (1, 'Dr. Md. Abdur Razzaque', 'Professor', 'm-a-razzaque@yahoo.com', 5),
    (1, 'Dr. Chowdhury Farhan Ahmed', 'Professor', 'farhan@du.ac.bd', 5),
    (1, 'Dr. Md. Mamun-Or-Rashid', 'Professor', 'mamun@cse.du.ac.bd', 5),
    (1, 'Dr. Mosaddek Hossain Kamal -- Tushar', 'Professor', 'tushar@cse.univdhaka.edu', 5),
    (1, 'Mrs. Upama Kabir', 'Professor', 'upama2@gmail.com', 5),
    (1, 'Md. Asif Hossain Khan', 'Professor', 'asif@du.ac.bd', 5),
    (1, 'Dr. Syed Faisal Hasan', 'Associate Professor', 'hasansf@gmail.com', 5),
    (1, 'Abu Ahmed Ferdouse', 'Associate Professor', 'ferdaus@du.ac.bd', 5),
    (1, 'Shaily Kabir', 'Associate Professor', 'shailykabir2000@yahoo.com', 5),
    (1, 'Moinul Islam Zaber', 'Associate Professor', 'zaber@du.ac.bd', 5),
    (1, 'Mosarrat Jahan', 'Associate Professor', 'mosarratjahan@yahoo.com', 5),
    (1, 'Dr. Ismat Rahman', 'Associate Professor', 'ismat@cse.du.ac.bd', 5),
    (1, 'Dr. Sarker Tanveer Ahmed Rumee', 'Assistant Professor', 'rumee@cse.du.ac.bd', 5),
    (1, 'Hasnain Heickal', 'Assistant Professor', 'hasnain@cse.univdhaka.edu', 5),
    (1, 'Dr. Md. Mosaddek Khan', 'Assistant Professor', 'mosaddek@cse.univdhaka.edu', 5),
    (1, 'Md. Samiullah', 'Assistant Professor', 'samiullah@cse.du.ac.bd', 5),
    (1, 'Dr. Muhammad Ibrahim', 'Assistant Professor', 'ibrahim313@du.ac.bd', 5),
    (1, 'Tamal Adhikary', 'Lecturer', 'tamal@cse.du.ac.bd', 5),
    (1, 'MD MOFIJUL ISLAM', 'Lecturer', 'akash@du.ac.bd', 5),
    (1, 'Mubin Ul Haque', 'Lecturer', 'mubin@cse.du.ac.bd', 5),
    (1, 'Zarrin Tasnim Sworna', 'Lecturer', 'zarrinsworna@gmail.com', 5),
    (1, 'Md. Mahmudur Rahman', 'Lecturer', 'mrr.rana13@gmail.com', 5),
    (1, 'Md. Ashraful Islam', 'Lecturer', 'ashraful@du.ac.bd', 5);
INSERT INTO professors (university_id, full_name, Designation, Email, sub_id)
VALUES
    (2, 'Dr. Mahmuda Naznin', 'Professor', 'mahmudanaznin@cse.buet.ac.bd, mahmudanaznin@gmail.com', 5),
    (2, 'Dr. Muhammad Masroor Ali', 'Professor', 'mmasroorali@cse.buet.ac.bd', 5),
    (2, 'Dr. Md. Saidur Rahman', 'Professor', 'saidurrahman@cse.buet.ac.bd', 5),
    (2, 'Dr. Md. Monirul Islam', 'Professor', 'mdmonirulislam@cse.buet.ac.bd', 5),
    (2, 'Dr. Md. Mostofa Akbar', 'Professor', 'mostofa@cse.buet.ac.bd', 5),
    (2, 'Dr. Abu Sayed Md. Latiful Hoque', 'Professor', 'asmlatifulhoque@cse.buet.ac.bd', 5);

INSERT INTO professors (university_id, full_name, Designation, Email, sub_id)
VALUES
    (2, 'Dr. M. Sohel Rahman', 'Professor', 'msrahman@cse.buet.ac.bd, sohel.kcl@gmail.com', 5),
    (2, 'Dr. A.K.M. Ashikur Rahman', 'Professor', 'ashikur@cse.buet.ac.bd', 5),
    (2, 'Dr. Mohammed Eunus Ali', 'Professor', 'eunus@cse.buet.ac.bd, mohammed.eunus.ali@gmail.com', 5),
    (2, 'Dr. Md. Monirul Islam', 'Professor', 'mmislam@cse.buet.ac.bd', 5),
    (2, 'Dr. Tanzima Hashem', 'Professor', 'tanzimahashem@cse.buet.ac.bd, tanzimahashem@gmail.com', 5),
    (2, 'Dr. Md. Shohrab Hossain', 'Professor', 'mshohrabhossain@cse.buet.ac.bd', 5),
    (2, 'Dr. A. B. M. Alim Al Islam', 'Professor', 'alim_razi@cse.buet.ac.bd', 5),
    (2, 'Dr. Anindya Iqbal', 'Professor', 'anindya_iqbal@yahoo.com, anindya@cse.buet.ac.bd', 5),
    (2, 'Dr. Rifat Shahriyar', 'Professor', 'rifat.shahriyar@gmail.com, rifat@cse.buet.ac.bd', 5),
    (2, 'Dr. Muhammad Abdullah Adnan', 'Professor', 'abdullah.adnan@gmail.com, adnan@cse.buet.ac.bd', 5),
    (2, 'Dr. Mohammad Saifur Rahman', 'Professor', 'mrahman@cse.buet.ac.bd', 5),
    (2, 'Dr. Md. Shamsuzzoha Bayzid', 'Associate Professor', 'shams.bayzid@gmail.com, shams_bayzid@cse.buet.ac.bd', 5),
    (2, 'Dr. Atif Hasan Rahman', 'Associate Professor', 'atif@cse.buet.ac.bd', 5),
    (2, 'Dr. Sadia Sharmin', 'Associate Professor', 'sadiasharmin@cse.buet.ac.bd, sadiasharmin.ss@gmail.com', 5),
    (2, 'Abu Wasif', 'Associate Professor', 'wasif@cse.buet.ac.bd', 5),
    (2, 'Sukarna Barua', 'Associate Professor', 'sukarna.barua@gmail.com, sukarnabarua@cse.buet.ac.bd', 5),
    (2, 'Tanveer Awal', 'Assistant Professor', 'tanveerawal@cse.buet.ac.bd', 5),
    (2, 'Khaled Mahmud Shahriar', 'Assistant Professor', 'k.m.shahriar@gmail.com, khaledshahriar@cse.buet.ac.bd', 5),
    (2, 'Md. Shariful Islam Bhuyan', 'Assistant Professor', 'sharifulislam@cse.buet.ac.bd', 5),
    (2, 'Dr. Muhammad Ali Nayeem', 'Assistant Professor', 'ali_nayeem@cse.buet.ac.bd', 5),
    (2, 'Dr. Rezwana Reaz', 'Assistant Professor', 'rimpi@cse.buet.ac.bd, rezwana@teacher.cse.buet.ac.bd', 5),
    (2, 'Tahmid Hasan', 'Assistant Professor', 'tahmid@teacher.cse.buet.ac.bd', 5),
    (2, 'Md. Masum Mushfiq', 'Lecturer', 'masummushfiq@cse.buet.ac.bd', 5),
    (2, 'Md. Toufikuzzaman', 'Lecturer', 'md.toufikzaman@gmail.com, toufikuzzaman@teacher.cse.buet.ac.bd', 5),
    (2, 'Rayhan Rashed', 'Lecturer', 'rayhan@cse.buet.ac.bd', 5),
    (2, 'Mohammad Tawhidul Hasan Bhuiyan', 'Lecturer', 'tawhid@cse.buet.ac.bd', 5),
    (2, 'Navid Bin Hasan', 'Lecturer', 'navidhasan0@gmail.com, navid@teacher.cse.buet.ac.bd', 5);


-- Insert data for university_id 1
INSERT INTO facilities (facility_name, university_id, facility_weight)
VALUES
    ('Faculties', 1, 13),
    ('Departments', 1, 83),
    ('Institutes', 1, 12),
    ('Residential Halls', 1, 20),

    ('Research Centres',  1, 56),
    ('Library',  1, 3);
INSERT INTO facilities (facility_name, university_id, facility_weight)
VALUES
    ('Faculties', 2, 6),
    ('Departments', 2, 18),
    ('Institutes', 2, 6),
    ('Residential Halls', 2, 8),
    
    ('Research Centres',  1, 6),
    ('Library',  2, 2);
-- Insert University of Dhaka's metrics for 2023
INSERT INTO university_metrics (university_id, metric_name, value, year)
VALUES
    (1, 'Enrollment', 37018, 2023),
    (1, 'Budget', 2500000000, 2023),
    (1, 'Faculty-to-Student Ratio', 1/19, 2023),
    (1, 'Research Funding', 500000000, 2023),
    (1, 'Campus Size (in acres)', 600, 2023),
    (1, 'Graduation Rate', 0.75, 2023),
    (1, 'Acceptance Rate', 0.15, 2023),
    (1, 'Student Satisfaction Rating', 0.90, 2023),

    (1, 'Endowment', 1000000000, 2023),
    (1, 'Research Publications', 2000, 2023);

-- Insert BUET's metrics for 2023
INSERT INTO university_metrics (university_id, metric_name, value, year)
VALUES
    (2, 'Enrollment', 6237, 2023),
    (2, 'Budget', 1500000000, 2023),
    (2, 'Faculty-to-Student Ratio', 1/13.2, 2023),
    (2, 'Research Funding', 500000000, 2023),
    (2, 'Campus Size (in acres)', 75, 2023),
    (2, 'Graduation Rate', 0.95, 2023),
    (2, 'Acceptance Rate', 0.12, 2023),
    (2, 'Student Satisfaction Rating', 0.85, 2023),

    (2, 'Endowment', 1000000000, 2023),
    (2, 'Research Publications', 1000, 2023);





