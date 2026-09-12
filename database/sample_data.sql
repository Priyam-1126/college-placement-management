USE college_placement;
INSERT INTO departments (department_name) VALUES
('Computer Science and Engineering'),('Information Technology'),('Electronics and Communication Engineering'),('Mechanical Engineering');
INSERT INTO students (roll_no,student_name,email,phone,department_id,graduation_year,cgpa) VALUES
('CSE001','Rahul Sharma','rahul@example.com','9876543210',1,2026,8.40),
('CSE002','Priya Das','priya@example.com','9876543211',1,2026,9.10),
('IT001','Aman Patel','aman@example.com','9876543212',2,2026,7.80),
('ECE001','Neha Singh','neha@example.com','9876543213',3,2026,8.70),
('CSE003','Vikas Kumar','vikas@example.com','9876543214',1,2026,6.90),
('IT002','Anjali Verma','anjali@example.com','9876543215',2,2026,8.20);
INSERT INTO companies (company_name,location,website) VALUES
('TechNova Solutions','Bengaluru','https://example.com/technova'),
('DataBridge Systems','Hyderabad','https://example.com/databridge'),
('CloudWorks India','Pune','https://example.com/cloudworks'),
('FinEdge Technologies','Bengaluru','https://example.com/finedge');
INSERT INTO job_postings (company_id,job_title,job_location,min_cgpa,package_lpa,openings,application_deadline) VALUES
(1,'Software Developer','Bengaluru',7.50,6.50,5,'2026-01-15'),
(2,'Data Analyst','Hyderabad',7.00,5.80,3,'2026-01-20'),
(3,'Cloud Engineer','Pune',8.00,7.20,2,'2026-01-25'),
(4,'Backend Developer','Bengaluru',8.00,8.00,2,'2026-02-05');
INSERT INTO applications (student_id,job_id,application_date,status) VALUES
(1,1,'2026-01-05','SELECTED'),(2,1,'2026-01-06','SHORTLISTED'),(3,2,'2026-01-07','SELECTED'),
(4,3,'2026-01-08','SELECTED'),(5,1,'2026-01-08','REJECTED'),(6,4,'2026-01-20','SELECTED'),(2,3,'2026-01-21','APPLIED');
INSERT INTO interviews (application_id,interview_date,round_name,result) VALUES
(1,'2026-01-10','Technical Round','CLEARED'),(1,'2026-01-13','HR Round','CLEARED'),
(2,'2026-01-14','Technical Round','CLEARED'),(3,'2026-01-15','Technical Round','CLEARED'),
(4,'2026-01-16','Technical Round','CLEARED'),(6,'2026-01-28','Technical Round','CLEARED'),(6,'2026-01-30','HR Round','CLEARED');
INSERT INTO placements (student_id,company_id,job_id,placement_date,package_lpa) VALUES
(1,1,1,'2026-01-15',6.50),(3,2,2,'2026-01-22',5.80),(4,3,3,'2026-01-26',7.20),(6,4,4,'2026-02-10',8.00);
