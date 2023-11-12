
TABLE universities {
        university_id NUMBER [PRIMARY KEY]
    university_name VARCHAR2(255)
    founded_date DATE
    location VARCHAR2(255)
    website VARCHAR2(255)
    ranking_2023 NUMBER
    type VARCHAR2(20)
    QSWorldRanking_2023 VARCHAR2(20)
}

TABLE subjects {
   sub_id NUMBER [PRIMARY KEY]
    sub_name VARCHAR2(255)
    subject_type VARCHAR2(255)
   
}


TABLE alumni {
    alumni_id NUMBER [PRIMARY KEY]

    full_name VARCHAR2(255)
    degree_earned VARCHAR2(255)
    Current_Employer VARCHAR2(255)
    Current_Designation VARCHAR2(255)
    location VARCHAR2(255)
    batch VARCHAR2(255)
   
    university_id NUMBER [ref: > universities.university_id]
    sub_id  NUMBER [ref: > subjects.sub_id]
}





TABLE subject_rankings {
   sub_ranking_id NUMBER [PRIMARY KEY]
    ranking VARCHAR2(20)
    year NUMBER

    
    sub_id NUMBER [ref: > subjects.sub_id]
    university_id NUMBER [ref: > universities.university_id]
}


TABLE professors {
     professor_id NUMBER [PRIMARY KEY]
    full_name VARCHAR2(255)
  
    
    Designation VARCHAR2(255)
    email VARCHAR2(255)
    university_id NUMBER [ref: > universities.university_id]

    sub_id NUMBER [ref: > subjects.sub_id]
}


TABLE facilities {
    facility_id NUMBER [PRIMARY KEY]
    facility_name VARCHAR2(255)
    facility_weight NUMBER 
   
    university_id NUMBER [ref: > universities.university_id]
}

TABLE awards {
     award_id NUMBER [PRIMARY KEY]
    award_name VARCHAR2(255)
    year NUMBER

    recipient_id NUMBER [ref: > professors.professor_id]
    //recipient_id INT [ref: > alumni.alumni_id]
                    
    
}



TABLE university_metrics {
    metric_id NUMBER [primary key]
   
    metric_name VARCHAR2(100)
    value NUMBER
    year NUMBER
    university_id NUMBER [ref: > universities.university_id]
}
