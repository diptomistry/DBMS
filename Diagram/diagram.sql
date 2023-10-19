
TABLE universities {
    university_id INT [primary key]
    university_name VARCHAR(255)
    founded_date DATE
    location VARCHAR(255)
    website VARCHAR(255)
    ranking INT
}

TABLE subjects {
    sub_id INT [primary key]
    sub_name VARCHAR(255)
    university_id INT [ref: > universities.university_id]
}


TABLE alumni {
    alumni_id INT [primary key]
    full_name VARCHAR(255)
    graduation_year YEAR
    degree_earned VARCHAR(255)
    employer VARCHAR(255)
    location VARCHAR(255)
    university_id INT [ref: > universities.university_id]
}


TABLE overall_rankings {
    overall_ranking_id INT [primary key]
    rank INT
    year YEAR
    university_id INT [ref: > universities.university_id]
}


TABLE subject_rankings {
    sub_ranking_id INT [primary key]
    rank INT
    year YEAR
    sub_id INT [ref: > subjects.sub_id]
}


TABLE professors {
    professor_id INT [primary key]
    full_name VARCHAR(255)
    sub_id INT [ref: > subjects.sub_id]
}


TABLE facilities {
    facility_id INT [primary key]
    facility_name VARCHAR(255)
    location VARCHAR(255)
    university_id INT [ref: > universities.university_id]
}

TABLE awards {
    award_id INT [primary key]
    award_name VARCHAR(255)
    year YEAR
    recipient_id INT [ref: > professors.professor_id]
    //recipient_id INT [ref: > alumni.alumni_id]
                    
    
}



TABLE university_metrics {
    metric_id INT [primary key]
    university_id INT [ref: > universities.university_id]
    metric_name VARCHAR(100)
    value FLOAT
    year YEAR
}
