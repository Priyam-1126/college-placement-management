DROP DATABASE IF EXISTS college_placement;
CREATE DATABASE college_placement;
USE college_placement;

CREATE TABLE departments (
 department_id INT PRIMARY KEY AUTO_INCREMENT,
 department_name VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE students (
 student_id INT PRIMARY KEY AUTO_INCREMENT,
 roll_no VARCHAR(30) NOT NULL UNIQUE,
 student_name VARCHAR(100) NOT NULL,
 email VARCHAR(120) NOT NULL UNIQUE,
 phone VARCHAR(15),
 department_id INT NOT NULL,
 graduation_year YEAR NOT NULL,
 cgpa DECIMAL(4,2) NOT NULL,
 FOREIGN KEY (department_id) REFERENCES departments(department_id),
 CHECK (cgpa >= 0 AND cgpa <= 10)
);
CREATE TABLE companies (
 company_id INT PRIMARY KEY AUTO_INCREMENT,
 company_name VARCHAR(120) NOT NULL UNIQUE,
 location VARCHAR(100),
 website VARCHAR(200)
);
CREATE TABLE job_postings (
 job_id INT PRIMARY KEY AUTO_INCREMENT,
 company_id INT NOT NULL,
 job_title VARCHAR(120) NOT NULL,
 job_location VARCHAR(100),
 min_cgpa DECIMAL(4,2) DEFAULT 0,
 package_lpa DECIMAL(6,2),
 openings INT NOT NULL DEFAULT 1,
 application_deadline DATE NOT NULL,
 FOREIGN KEY (company_id) REFERENCES companies(company_id),
 CHECK (min_cgpa >= 0 AND min_cgpa <= 10),
 CHECK (package_lpa >= 0),
 CHECK (openings > 0)
);
CREATE TABLE applications (
 application_id INT PRIMARY KEY AUTO_INCREMENT,
 student_id INT NOT NULL,
 job_id INT NOT NULL,
 application_date DATE NOT NULL,
 status ENUM('APPLIED','SHORTLISTED','REJECTED','SELECTED') NOT NULL DEFAULT 'APPLIED',
 UNIQUE (student_id, job_id),
 FOREIGN KEY (student_id) REFERENCES students(student_id),
 FOREIGN KEY (job_id) REFERENCES job_postings(job_id)
);
CREATE TABLE interviews (
 interview_id INT PRIMARY KEY AUTO_INCREMENT,
 application_id INT NOT NULL,
 interview_date DATE NOT NULL,
 round_name VARCHAR(80) NOT NULL,
 result ENUM('PENDING','CLEARED','REJECTED') NOT NULL DEFAULT 'PENDING',
 FOREIGN KEY (application_id) REFERENCES applications(application_id)
);
CREATE TABLE placements (
 placement_id INT PRIMARY KEY AUTO_INCREMENT,
 student_id INT NOT NULL UNIQUE,
 company_id INT NOT NULL,
 job_id INT NOT NULL,
 placement_date DATE NOT NULL,
 package_lpa DECIMAL(6,2) NOT NULL,
 FOREIGN KEY (student_id) REFERENCES students(student_id),
 FOREIGN KEY (company_id) REFERENCES companies(company_id),
 FOREIGN KEY (job_id) REFERENCES job_postings(job_id),
 CHECK (package_lpa >= 0)
);
