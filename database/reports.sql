USE college_placement;

SELECT s.roll_no,s.student_name,d.department_name,s.cgpa FROM students s JOIN departments d ON s.department_id=d.department_id ORDER BY s.cgpa DESC;
SELECT s.student_name,c.company_name,j.job_title,a.status FROM applications a JOIN students s ON a.student_id=s.student_id JOIN job_postings j ON a.job_id=j.job_id JOIN companies c ON j.company_id=c.company_id;
SELECT student_name,cgpa FROM students WHERE cgpa>(SELECT AVG(cgpa) FROM students) ORDER BY cgpa DESC;
SELECT c.company_name,COUNT(a.application_id) AS total_applications FROM companies c JOIN job_postings j ON c.company_id=j.company_id JOIN applications a ON j.job_id=a.job_id GROUP BY c.company_id,c.company_name HAVING COUNT(a.application_id)>=2;
SELECT s.student_name,CASE WHEN a.status='SELECTED' THEN 'Placed' WHEN a.status='SHORTLISTED' THEN 'In Process' WHEN a.status='REJECTED' THEN 'Not Selected' ELSE 'Applied' END AS application_result FROM applications a JOIN students s ON a.student_id=s.student_id;
SELECT COUNT(*) AS total_placements,ROUND(AVG(package_lpa),2) AS average_package,MAX(package_lpa) AS highest_package,MIN(package_lpa) AS lowest_package FROM placements;
WITH department_placements AS (SELECT d.department_name,COUNT(p.placement_id) AS placed_students FROM departments d LEFT JOIN students s ON d.department_id=s.department_id LEFT JOIN placements p ON s.student_id=p.student_id GROUP BY d.department_id,d.department_name) SELECT department_name,placed_students FROM department_placements ORDER BY placed_students DESC;
SELECT s.student_name,d.department_name,s.cgpa,RANK() OVER(PARTITION BY s.department_id ORDER BY s.cgpa DESC) AS department_rank FROM students s JOIN departments d ON s.department_id=d.department_id;
SELECT s.student_name,s.cgpa,j.job_title,c.company_name FROM students s CROSS JOIN job_postings j JOIN companies c ON j.company_id=c.company_id WHERE s.cgpa>=j.min_cgpa ORDER BY j.job_id,s.cgpa DESC;
SELECT c.company_name,MAX(p.package_lpa) AS highest_package FROM placements p JOIN companies c ON p.company_id=c.company_id GROUP BY c.company_id,c.company_name ORDER BY highest_package DESC;
