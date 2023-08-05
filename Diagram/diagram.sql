Table universities {
  university_id INT [primary key]
  name VARCHAR(100)
  location VARCHAR(100)
  founded_year YEAR
  website VARCHAR(100)
}

Table programs {
  program_id INT [primary key]
  university_id INT [ref: > universities.university_id]
  name VARCHAR(100)
  degree_level VARCHAR(50)
  department VARCHAR(100)
  description TEXT
}

Table students {
  student_id INT [primary key]
  first_name VARCHAR(50)
  last_name VARCHAR(50)
  birthdate DATE
  email VARCHAR(100)
  enrollment_year YEAR
  graduation_year YEAR
}

Table courses {
  course_id INT [primary key]
  program_id INT [ref: > programs.program_id]
  name VARCHAR(100)
  code VARCHAR(20)
  instructor VARCHAR(100)
  credits INT
}

Table enrollments {
  enrollment_id INT [primary key]
  student_id INT [ref: > students.student_id]
  course_id INT [ref: > courses.course_id]
  enrollment_date DATE
  grade VARCHAR(5)
}

Table achievements {
  achievement_id INT [primary key]
  student_id INT [ref: > students.student_id]
  title VARCHAR(100)
  description TEXT
  date_achieved DATE
}

Table alumni {
  alumni_id INT [primary key]
  student_id INT [ref: > students.student_id]
  job_title VARCHAR(100)
  company VARCHAR(100)
  employment_start_date DATE
  employment_end_date DATE
}

Table faculty {
  faculty_id INT [primary key]
  university_id INT [ref: > universities.university_id]
  first_name VARCHAR(50)
  last_name VARCHAR(50)
  department VARCHAR(100)
  email VARCHAR(100)
  hire_date DATE
}

Table research_projects {
  project_id INT [primary key]
  faculty_id INT [ref: > faculty.faculty_id]
  title VARCHAR(100)
  description TEXT
  start_date DATE
  end_date DATE
}

Table publications {
  publication_id INT [primary key]
  faculty_id INT [ref: > faculty.faculty_id]
  title VARCHAR(200)
  co_authors TEXT
  publication_date DATE
}

Table events {
  event_id INT [primary key]
  event_name VARCHAR(100)
  event_date DATE
  location VARCHAR(100)
  description TEXT
}

Table student_events {
  student_id INT [ref: > students.student_id]
  event_id INT [ref: > events.event_id]
}

Table faculty_events {
  faculty_id INT [ref: > faculty.faculty_id]
  event_id INT [ref: > events.event_id]
}

Table university_metrics {
  metric_id INT [primary key]
  university_id INT [ref: > universities.university_id]
  metric_name VARCHAR(100)
  value FLOAT
  year YEAR
}
