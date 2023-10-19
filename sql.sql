use db2020615644;
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
    sub_id INT PRIMARY KEY AUTO_INCREMENT,--starts from 5f
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


-- Create Overall Ranking Table
CREATE TABLE overall_rankings (
    overall_ranking_id INT PRIMARY KEY AUTO_INCREMENT,
    ranking INT,
    year YEAR,
    university_id INT,
    FOREIGN KEY (university_id) REFERENCES universities(university_id)
);

-- Create Subject-wise Ranking Table
CREATE TABLE subject_rankings (
    sub_ranking_id INT PRIMARY KEY AUTO_INCREMENT,
    ranking INT,
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
) AUTO_INCREMENT = 1; -- Set the starting value to 1


-- Insert data into University Table (corrected data)
INSERT INTO universities (university_name, founded_date, location, website, ranking)
VALUES
    ('Dhaka University', '1921-07-01', 'Dhaka', 'http://www.du.ac.bd', 1),
    ('Bangladesh University of Engineering and Technology', '1962-02-25', 'Dhaka', 'http://www.buet.ac.bd', 2),
    ('University of Chittagong', '1966-11-18', 'Chittagong', 'http://www.cu.ac.bd', 3),
    ('Rajshahi University', '1953-07-06', 'Rajshahi', 'http://www.ru.ac.bd', 4),
    ('Jahangirnagar University', '1970-01-12', 'Savar', 'http://www.juniv.edu', 5),
    ('Khulna University', '1991-09-30', 'Khulna', 'http://www.ku.ac.bd', 6),
    ('Shahjalal University of Science and Technology', '1987-11-01', 'Sylhet', 'http://www.sust.edu', 7),
    ('Chittagong University of Engineering and Technology', '2003-10-17', 'Chittagong', 'http://www.cuet.ac.bd', 8),
    ('Bangabandhu Sheikh Mujibur Rahman Science and Technology University', '1991-07-01', 'Gopalganj', 'http://www.bsmrstu.edu.bd', 9),
    ('Bangladesh Agricultural University', '1961-09-03', 'Mymensingh', 'http://www.bau.edu.bd', 10);



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
  ('S. M. Shaiful Alam', 'BSc 18th', 'University of Texas at San Antonio', 'USA', 'Research Assistant', 'BSc', 1),
  ('Saidur Rahman', 'BSc 18th', 'George Mason University', 'USA', 'Graduate Teaching Assistant', 'BSc', 1),
  ('Sanad Saha', 'BSc 18th', 'National University of Singapore', 'Singapore', 'PhD Student', 'BSc', 1),
  ('Syeda Fatema Mazumder', 'BSc 18th', 'Traveloka', 'Singapore', 'Software Engineer', 'BSc', 1),
  ('Kazi Rashedul Islam', 'BSc 18th', 'Wipro Bangladesh Limited', 'Bangladesh', 'Senior Java EE Engineer', 'BSc', 1),
  ('Faria Noor', 'BSc 19th', 'Georgia Institute of Technology', 'USA', 'Research Assistant', 'BSc', 1),
  ('M. Tahsin Anwar (Akif)', 'BSc 19th', 'Infolytx Bangladesh Limited', 'Bangladesh', 'Senior Software Engineer', 'BSc', 1),
  ('Mahfujur Rahman Asif', 'BSc 19th', 'Bangladesh Bank', 'Bangladesh', 'Assistant Maintenance Engineer (AD)', 'BSc', 1),
  ('Mazedul Islam Mazid', 'BSc 19th', 'Eskimi', 'Bangladesh', 'Senior Scala Engineer', 'BSc', 1),
  ('Md Muidul Alam', 'BSc 19th', 'BRAC Bank Ltd', 'Bangladesh', 'Associate Manager', 'BSc', 1),
  ('Md Zahin Jawad', 'BSc 19th', 'Monstar Lab Bangladesh Ltd', 'Bangladesh', 'Senior Software Engineer', 'BSc', 1),
  ('Md. Saiful Islam', 'BSc 19th', 'Therap', 'Software Bangladesh', 'Engineer', 'BSc', 1),
  ('Mohammad Mazedul Islam Mazid', 'BSc 19th', 'East West University', 'Bangladesh', 'Lecturer', 'BSc', 1),
  ('Mohammad Washeef Ibn Waliur', 'BSc 19th', 'Stony Brook University', 'USA', 'PhD Student', 'BSc', 1),
  ('Muhammad Jawad Iqbal', 'BSc 19th', 'Dhaka International University', 'Bangladesh', 'Lecturer', 'BSc', 1),
  ('Rakib Ahsan', 'BSc 19th', 'Bangladesh University of Business & Technology (BUBT)', 'Bangladesh', 'Lecturer', 'BSc', 1),
  ('Tamim Addari', 'BSc 19th', 'Daffodil International University', 'Bangladesh', 'Lecturer', 'BSc', 1),
  ('Apu Kumar Chakroborti', 'BSc 20th', 'University of South Alabama', 'USA', 'Research Assistant', 'BSc', 1),
  ('Azizul Hakim', 'BSc 20th', 'IPvision Soft Ltd.', 'Bangladesh', 'Software Engineer', 'BSc', 1),
  ('Golam Azrin', 'BSc 20th', 'Eskimi', 'Bangladesh', 'Scala Engineer', 'BSc', 1),
  ('Hosneara Ahmed', 'BSc 20th', 'University of Texas, Arlington', 'null', 'GTA', 'BSc', 1),
  ('Md Tahsin Tausif', 'BSc 20th', 'Pathao Ltd.', 'null', 'Software Engineer', 'BSc', 1),
  ('Md. Al- Zihad', 'BSc 20th', 'Sonali Polaris Financial Technology Limited', 'Bangladesh', 'Junior Consultant(R&D)', 'BSc', 1)
;

-- Add as many records as needed, following the same format.




