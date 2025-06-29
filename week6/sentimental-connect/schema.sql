create database linkedin;
use linkedin;

CREATE TABLE Users(
    "id" INT AUTO_INCREMENT PRIMARY KEY,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL,
    "username" VARCHAR(255) UNIQUE NOT NULL,
    "password" CHAR(128),
    PRIMARY KEY("id")
);


CREATE TABLE Schools(
    "id" INT AUTO_INCREMENT,
    "name" VARCHAR(255) NOT NULL,
    "school_type" ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    "location" VARCHAR(255) NOT NULL,
    "founding_year" DATE,
    PRIMARY KEY("id")
);

CREATE TABLE Companies(
    "id" INT AUTO_INCREMENT,
    "name" VARCHAR(255) NOT NULL,
    "industry" ENUM('Technology', 'Education', 'Business') NOT NULL,
    "location" VARCHAR(255) NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE Connections(
    "user1_id" INT,
    "user2_id" INT,
    PRIMARY KEY ("user1_id", "user2_id"),
    FOREIGN KEY ("user1_id") REFERENCES Users("user_id"),
    FOREIGN KEY ("user2_id") REFERENCES Users("user_id")
);

CREATE TABLE UserSchools (
    user_id INT,
    school_id INT,
    start_date DATE,
    end_date DATE,
    degree VARCHAR(255),
    PRIMARY KEY (user_id, school_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (school_id) REFERENCES Schools(school_id)
);

CREATE TABLE UserCompanies (
    user_id INT,
    company_id INT,
    start_date DATE,
    end_date DATE,
    PRIMARY KEY (user_id, company_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (company_id) REFERENCES Companies(company_id)
);

