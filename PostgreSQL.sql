--Task 1
--A
select title from course
where credits = 3 and 
dept_name ='Comp. Sci.';

--B
--Enstein ismi yoqligiga boshqa ism oldim 
select *from student
 inner join instructor on instructor.dept_name = student.dept_name 
and instructor.name = 'Hau';

--C
SELECT *
FROM instructor
ORDER BY salary DESC
LIMIT 1;

--D
SELECT *
FROM instructor
ORDER BY salary DESC

 
--E
select *from section
where semester = 'Fall' and year = 2007;

--F
SELECT s.course_id, s.sec_id, s.semester, s.year, COUNT(t.ID) as enrollment
FROM section s
LEFT JOIN takes t ON s.course_id = t.course_id
                 AND s.sec_id = t.sec_id
                 AND s.semester = t.semester
                 AND s.year = t.year
WHERE s.semester = 'Fall' AND s.year = 2017
GROUP BY s.course_id, s.sec_id, s.semester, s.year;

--G
SELECT MAX(enrollment) AS max_enrollment
FROM (
    SELECT COUNT(t.ID) AS enrollment
    FROM section s
    LEFT JOIN takes t ON s.course_id = t.course_id
                     AND s.sec_id = t.sec_id
                     AND s.semester = t.semester
                     AND s.year = t.year
    WHERE s.semester = 'Fall' AND s.year = 2007
    GROUP BY s.course_id, s.sec_id, s.semester, s.year
) AS section_enrollment;




-----Task 2

---A
select *from inctructor
update instructor 
set salary = salary *1.1
Where dept_name = 'Comp. Sci';


--B
DELETE FROM course
WHERE course_id NOT IN (SELECT DISTINCT course_id FROM section);

-- C
INSERT INTO instructor (ID, name, dept_name, salary)
SELECT ID, name, dept_name, 10000
FROM student
WHERE tot_cred > 100;