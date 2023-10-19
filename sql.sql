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
