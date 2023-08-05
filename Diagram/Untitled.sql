CREATE TABLE `universities` (
  `university_id` INT PRIMARY KEY,
  `name` VARCHAR(100),
  `location` VARCHAR(100),
  `founded_year` YEAR,
  `website` VARCHAR(100)
);

CREATE TABLE `programs` (
  `program_id` INT PRIMARY KEY,
  `university_id` INT,
  `name` VARCHAR(100),
  `degree_level` VARCHAR(50),
  `department` VARCHAR(100),
  `description` TEXT
);

CREATE TABLE `students` (
  `student_id` INT PRIMARY KEY,
  `first_name` VARCHAR(50),
  `last_name` VARCHAR(50),
  `birthdate` DATE,
  `email` VARCHAR(100),
  `enrollment_year` YEAR,
  `graduation_year` YEAR
);

CREATE TABLE `courses` (
  `course_id` INT PRIMARY KEY,
  `program_id` INT,
  `name` VARCHAR(100),
  `code` VARCHAR(20),
  `instructor` VARCHAR(100),
  `credits` INT
);

CREATE TABLE `enrollments` (
  `enrollment_id` INT PRIMARY KEY,
  `student_id` INT,
  `course_id` INT,
  `enrollment_date` DATE,
  `grade` VARCHAR(5)
);

CREATE TABLE `achievements` (
  `achievement_id` INT PRIMARY KEY,
  `student_id` INT,
  `title` VARCHAR(100),
  `description` TEXT,
  `date_achieved` DATE
);

CREATE TABLE `alumni` (
  `alumni_id` INT PRIMARY KEY,
  `student_id` INT,
  `job_title` VARCHAR(100),
  `company` VARCHAR(100),
  `employment_start_date` DATE,
  `employment_end_date` DATE
);

CREATE TABLE `faculty` (
  `faculty_id` INT PRIMARY KEY,
  `university_id` INT,
  `first_name` VARCHAR(50),
  `last_name` VARCHAR(50),
  `department` VARCHAR(100),
  `email` VARCHAR(100),
  `hire_date` DATE
);

CREATE TABLE `research_projects` (
  `project_id` INT PRIMARY KEY,
  `faculty_id` INT,
  `title` VARCHAR(100),
  `description` TEXT,
  `start_date` DATE,
  `end_date` DATE
);

CREATE TABLE `publications` (
  `publication_id` INT PRIMARY KEY,
  `faculty_id` INT,
  `title` VARCHAR(200),
  `co_authors` TEXT,
  `publication_date` DATE
);

CREATE TABLE `events` (
  `event_id` INT PRIMARY KEY,
  `event_name` VARCHAR(100),
  `event_date` DATE,
  `location` VARCHAR(100),
  `description` TEXT
);

CREATE TABLE `student_events` (
  `student_id` INT,
  `event_id` INT
);

CREATE TABLE `faculty_events` (
  `faculty_id` INT,
  `event_id` INT
);

CREATE TABLE `university_metrics` (
  `metric_id` INT PRIMARY KEY,
  `university_id` INT,
  `metric_name` VARCHAR(100),
  `value` FLOAT,
  `year` YEAR
);

ALTER TABLE `programs` ADD FOREIGN KEY (`university_id`) REFERENCES `universities` (`university_id`);

ALTER TABLE `courses` ADD FOREIGN KEY (`program_id`) REFERENCES `programs` (`program_id`);

ALTER TABLE `enrollments` ADD FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

ALTER TABLE `enrollments` ADD FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

ALTER TABLE `achievements` ADD FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

ALTER TABLE `alumni` ADD FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

ALTER TABLE `faculty` ADD FOREIGN KEY (`university_id`) REFERENCES `universities` (`university_id`);

ALTER TABLE `research_projects` ADD FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`);

ALTER TABLE `publications` ADD FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`);

ALTER TABLE `student_events` ADD FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

ALTER TABLE `student_events` ADD FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`);

ALTER TABLE `faculty_events` ADD FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`);

ALTER TABLE `faculty_events` ADD FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`);

ALTER TABLE `university_metrics` ADD FOREIGN KEY (`university_id`) REFERENCES `universities` (`university_id`);
