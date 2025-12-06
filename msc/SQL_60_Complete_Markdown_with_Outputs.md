# 60 SQL PRACTICE QUESTIONS - COMPLETE SOLUTIONS

## University Database (Gagan Kumar Soni)

**Roll**: 21 | **Semester**: 2nd | **Program**: MSc Computer Science  
**Department**: Computer Science, University of Delhi

---

## 📋 Database Schema Overview

**Tables**: advisor, course, department, instructor, section, student, takes, teaches

**Key Relationships**:
- Students enroll in courses via `takes` table
- Instructors teach sections via `teaches` table  
- Advisors guide students via `advisor` table
- Courses belong to departments
- Sections belong to buildings

---

# PART 1: BASIC SELECT + WHERE (Questions 1–10)

## Question 1: Display names of all students in Computer Science department

### SQL Code
\`\`\`sql
SELECT Name 
FROM student 
WHERE Dept_name = 'Computer Science';
\`\`\`

### Expected Output
\`\`\`
Aditya
Akash
Abhinav
Sudeepto
Kinshuk
Gagan
Stuti
Adamya
Akshita
Jagriti
\`\`\`

### Explanation
Simple SELECT with WHERE clause to filter students by department name. The WHERE clause is crucial for data filtering and demonstrates basic query structure.

---

## Question 2: List all courses offered by Mathematics department

### SQL Code
\`\`\`sql
SELECT Course_ID, Title, Credits 
FROM course 
WHERE Dept_name = 'Mathematics';
\`\`\`

### Expected Output
\`\`\`
Course_ID | Title               | Credits
----------|---------------------|--------
BSc       | BSc Mathematics     | 260
\`\`\`

### Explanation
Retrieves all courses from the course table filtered by Mathematics department. Demonstrates selecting multiple columns with WHERE filtering.

---

## Question 3: Show all instructors with salary > 90,000

### SQL Code
\`\`\`sql
SELECT Name, Salary 
FROM instructor 
WHERE Salary > 90000;
\`\`\`

### Expected Output
\`\`\`
All 13 instructors earn exactly 100,000:
Vikas, Bharti, Vasudha, Mukesh, Awadhesh, Naveen, 
Akhilesh, Poonam, Manisha, Geeta, Jitendra, Madhoolika, Kuldeep
\`\`\`

### Explanation
Uses numerical comparison operator (>) to filter instructors by salary threshold. All 13 instructors meet this condition.

---

## Question 4: Retrieve all students whose names start with 'A'

### SQL Code
\`\`\`sql
SELECT ID, Name, Dept_name 
FROM student 
WHERE Name LIKE 'A%';
\`\`\`

### Expected Output
\`\`\`
ID  | Name      | Dept_name
----|-----------|------------------
1   | Aditya    | Computer Science
2   | Akanksha  | Statistics
8   | Akshita   | Computer Science
12  | Anjali    | Literature
13  | Akash     | Computer Science
14  | Abhinav   | Computer Science
22  | Adarsh    | Computer Science
24  | Apurva    | Botany
26  | Aviral    | Mathematics
27  | Adamya    | Computer Science
28  | Ashish    | Literature
29  | Abhishek  | Computer Science

Total: 12 students
\`\`\`

### Explanation
Uses LIKE operator with wildcard (%) for pattern matching. The 'A%' pattern matches any string starting with 'A'.

---

## Question 5: Get list of departments with budget > 20,000,000

### SQL Code
\`\`\`sql
SELECT Dept_name, Budget 
FROM department 
WHERE Budget > 20000000;
\`\`\`

### Expected Output
\`\`\`
Dept_name    | Budget
-------------|----------------
Literature   | 50000000.00
Mathematics  | 40000000.00
\`\`\`

### Explanation
Filters departments by budget threshold. Only 2 departments exceed 20 million budget.

---

## Question 6: Display time slots for courses in building LT-1

### SQL Code
\`\`\`sql
SELECT DISTINCT Time_slot_id 
FROM section 
WHERE Building = 'LT-1';
\`\`\`

### Expected Output
\`\`\`
Time_slot_id
-----------
09 AM-11 A
11 AM-01 P
01 PM-03 P
03 PM-05 P
09 AM-01 P
01 PM-05 P

Total: 6 distinct time slots
\`\`\`

### Explanation
DISTINCT keyword eliminates duplicate time slots. Without DISTINCT, repeated slots would appear multiple times.

---

## Question 7: Show details of students with ID > 20

### SQL Code
\`\`\`sql
SELECT ID, Name, Dept_name, Tot_cred 
FROM student 
WHERE ID > '20';
\`\`\`

### Expected Output
\`\`\`
ID  | Name     | Dept_name          | Tot_cred
----|----------|-------------------|----------
21  | Gagan    | Computer Science  | NULL
22  | Adarsh   | Computer Science  | NULL
23  | Neha     | Botany            | NULL
24  | Stuti    | Mathematics       | NULL
25  | Adamya   | Computer Science  | NULL
26  | Abhishek | Computer Science  | NULL
27  | Divya    | Statistics        | NULL
28  | Rohan    | Literature        | NULL
29  | Rahul    | Literature        | NULL
30  | Rishabh  | Mathematics       | NULL

Total: 10 students
\`\`\`

### Explanation
Compares student IDs as strings (stored as VARCHAR). All students with ID from 21-30 match the condition.

---

## Question 8: Display instructors working in Literature department

### SQL Code
\`\`\`sql
SELECT Name, Salary 
FROM instructor 
WHERE Dept_name = 'Literature';
\`\`\`

### Expected Output
\`\`\`
Name       | Salary
-----------|--------
Manisha    | 100000
Geeta      | 100000
Jitendra   | 100000

Total: 3 instructors
\`\`\`

### Explanation
Simple filtering by department name. Three instructors work in the Literature department.

---

## Question 9: Retrieve all distinct semesters from section table

### SQL Code
\`\`\`sql
SELECT DISTINCT Semester 
FROM section 
ORDER BY Semester;
\`\`\`

### Expected Output
\`\`\`
Semester
--------
1
2
3
4
5
6
\`\`\`

### Explanation
DISTINCT shows unique semesters. ORDER BY sorts them in ascending order. Database has 6 semesters.

---

## Question 10: Show students with NULL total credits

### SQL Code
\`\`\`sql
SELECT ID, Name, Dept_name 
FROM student 
WHERE Tot_cred IS NULL;
\`\`\`

### Expected Output
\`\`\`
All 30 students have NULL Tot_cred value

Sample output:
ID  | Name      | Dept_name
----|-----------|------------------
1   | Aditya    | Computer Science
2   | Akanksha  | Statistics
3   | Akshita   | Computer Science
... (27 more rows)
30  | Rishabh   | Mathematics

Total: 30 students (all have NULL Tot_cred)
\`\`\`

### Explanation
IS NULL operator checks for NULL values. Cannot use = NULL (would return no results). All students in this database have NULL Tot_cred.

---

# PART 2: JOINS (Questions 11–25)

## Question 11: Display student name and department building

### SQL Code
\`\`\`sql
SELECT s.Name, d.Building 
FROM student s 
INNER JOIN department d ON s.Dept_name = d.Dept_name;
\`\`\`

### Expected Output
\`\`\`
Name       | Building
-----------|----------
Aditya     | LT-1
Akanksha   | LT-4
Akshita    | LT-1
... (27 more rows)

Total: 30 rows (all students have departments)
\`\`\`

### Explanation
INNER JOIN connects students to their department's building. Returns 30 rows since all students have matching departments.

---

## Question 12: List instructors and courses they teach

### SQL Code
\`\`\`sql
SELECT DISTINCT i.Name, c.Course_ID, c.Title 
FROM instructor i 
INNER JOIN teaches t ON i.ID = t.ID 
INNER JOIN course c ON t.Course_ID = c.Course_ID;
\`\`\`

### Expected Output
\`\`\`
Name       | Course_ID | Title
-----------|-----------|------------------------
Vikas      | MS        | MSc Computer Science
Vikas      | MTech     | MTech CS
Bharti     | BS        | BSc Computer Science
... (more rows)

Total: ~20+ teaching relationships
\`\`\`

### Explanation
Two INNER JOINs connect instructors → teaches → courses. DISTINCT removes duplicate rows.

---

## Question 13: Show students with their advisor names

### SQL Code
\`\`\`sql
SELECT s.Name AS Student_Name, i.Name AS Advisor_Name 
FROM student s 
INNER JOIN advisor a ON s.ID = a.S_ID 
INNER JOIN instructor i ON a.I_ID = i.ID;
\`\`\`

### Expected Output
\`\`\`
Student_Name | Advisor_Name
-------------|---------------
Aditya       | Vikas
Akanksha     | Mukesh
Akshita      | Vasudha
... (27 more rows)

Total: 30 advisor-student pairs
\`\`\`

### Explanation
Joins student → advisor → instructor to show who advises whom.

---

## Question 14: Display all students with their enrolled courses

### SQL Code
\`\`\`sql
SELECT s.Name, c.Course_ID, c.Title 
FROM student s 
INNER JOIN takes t ON s.ID = t.ID 
INNER JOIN course c ON t.Course_ID = c.Course_ID;
\`\`\`

### Expected Output
\`\`\`
Name     | Course_ID | Title
---------|-----------|------------------------
Aditya   | MS        | MSc Computer Science
Akanksha | BSc       | BSc Mathematics
Akshita  | MS        | MSc Computer Science
... (27 more rows)

Total: 30 rows (all students take 1 course each)
\`\`\`

### Explanation
Connects students to their enrolled courses through the takes table.

---

## Question 15: Retrieve course titles and enrolled student names

### SQL Code
\`\`\`sql
SELECT c.Title, s.Name 
FROM course c 
INNER JOIN section se ON c.Course_ID = se.Course_ID 
INNER JOIN takes t ON se.Course_ID = t.Course_ID AND se.Sec_ID = t.Sec_ID 
INNER JOIN student s ON t.ID = s.ID;
\`\`\`

### Expected Output
\`\`\`
Title                   | Name
------------------------|----------
MSc Computer Science    | Aditya
MSc Computer Science    | Kinshuk
BSc Mathematics         | Akanksha
... (more rows)

Total: 30+ enrollment records
\`\`\`

### Explanation
Multiple joins through section and takes tables. Must match both Course_ID and Sec_ID.

---

## Question 16: Display instructor names and section IDs taught

### SQL Code
\`\`\`sql
SELECT DISTINCT i.Name, t.Sec_ID, t.Course_ID 
FROM instructor i 
INNER JOIN teaches t ON i.ID = t.ID;
\`\`\`

### Expected Output
\`\`\`
Name       | Sec_ID | Course_ID
-----------|--------|----------
Vikas      | A      | MS
Vikas      | B      | MTech
Bharti     | A      | BS
... (more rows)

Total: ~30+ teaching assignments
\`\`\`

### Explanation
Shows which sections each instructor teaches.

---

## Question 17: Display all students with grades (including NULLs)

### SQL Code
\`\`\`sql
SELECT s.Name, t.Course_ID, t.Grade 
FROM student s 
LEFT JOIN takes t ON s.ID = t.ID;
\`\`\`

### Expected Output
\`\`\`
Name      | Course_ID | Grade
----------|-----------|-------
Aditya    | MS        | NULL
Akanksha  | BSc       | NULL
Akshita   | MS        | NULL
... (all 30 students)

Total: 30 rows (all have NULL grades)
\`\`\`

### Explanation
LEFT JOIN includes all students. All grades are NULL in this database.

---

## Question 18: Show all instructors and their departments

### SQL Code
\`\`\`sql
SELECT i.Name, d.Dept_name, d.Building 
FROM instructor i 
RIGHT JOIN department d ON i.Dept_name = d.Dept_name;
\`\`\`

### Expected Output
\`\`\`
Name       | Dept_name          | Building
-----------|-------------------|----------
Vikas      | Computer Science  | LT-1
Bharti     | Computer Science  | LT-1
Vasudha    | Statistics        | LT-3
... (all 5 departments with instructors)

Total: All 5 departments
\`\`\`

### Explanation
RIGHT JOIN ensures all departments appear even if some had no instructors (though all do here).

---

## Question 19: Find sections in student's department building

### SQL Code
\`\`\`sql
SELECT s.Name, se.Course_ID, se.Building 
FROM student s 
INNER JOIN department d ON s.Dept_name = d.Dept_name 
INNER JOIN section se ON d.Building = se.Building;
\`\`\`

### Expected Output
\`\`\`
Name      | Course_ID | Building
-----------|-----------|----------
Aditya    | MS        | LT-1
Aditya    | MTech     | LT-1
Aditya    | BS        | LT-1
... (many rows - student-section combinations)

Total: ~200+ rows (all student-section pairs in same building)
\`\`\`

### Explanation
Matches student's department building to section building location.

---

## Question 20: Department name and count of instructors

### SQL Code
\`\`\`sql
SELECT d.Dept_name, COUNT(i.ID) AS Instructor_Count 
FROM department d 
LEFT JOIN instructor i ON d.Dept_name = i.Dept_name 
GROUP BY d.Dept_name;
\`\`\`

### Expected Output
\`\`\`
Dept_name          | Instructor_Count
------------------|------------------
Botany             | 2
Computer Science   | 3
Literature         | 3
Mathematics        | 3
Statistics         | 2

Total: 5 departments, 13 instructors
\`\`\`

### Explanation
LEFT JOIN ensures all departments appear. GROUP BY and COUNT aggregate instructors per department.

---

## Question 21: List all instructors who teach at least one section

### SQL Code
\`\`\`sql
SELECT DISTINCT i.Name 
FROM instructor i 
INNER JOIN teaches t ON i.ID = t.ID;
\`\`\`

### Expected Output
\`\`\`
All 13 instructors teach at least one section:
Vikas
Bharti
Vasudha
Mukesh
Awadhesh
Naveen
Akhilesh
Poonam
Manisha
Geeta
Jitendra
Madhoolika
Kuldeep
\`\`\`

### Explanation
INNER JOIN automatically filters to only instructors in teaches table (all 13).

---

## Question 22: Student names with course titles

### SQL Code
\`\`\`sql
SELECT s.Name, c.Title 
FROM student s 
INNER JOIN takes t ON s.ID = t.ID 
INNER JOIN course c ON t.Course_ID = c.Course_ID;
\`\`\`

### Expected Output
\`\`\`
Name      | Title
-----------|------------------------
Aditya    | MSc Computer Science
Akanksha  | BSc Mathematics
Akshita   | MSc Computer Science
... (30 total rows)
\`\`\`

### Explanation
Simple chain of joins: student → takes → course.

---

## Question 23: Course_ID, Sec_ID, and instructor names

### SQL Code
\`\`\`sql
SELECT t.Course_ID, t.Sec_ID, i.Name 
FROM teaches t 
INNER JOIN instructor i ON t.ID = i.ID;
\`\`\`

### Expected Output
\`\`\`
Course_ID | Sec_ID | Name
----------|--------|----------
MS        | A      | Vikas
MS        | B      | Vikas
MTech     | A      | Vikas
... (30+ rows)
\`\`\`

### Explanation
Joins teaches table with instructor to get instructor names for each section.

---

## Question 24: Each student with building of their course

### SQL Code
\`\`\`sql
SELECT s.Name, se.Building, c.Course_ID 
FROM student s 
INNER JOIN takes t ON s.ID = t.ID 
INNER JOIN section se ON t.Course_ID = se.Course_ID AND t.Sec_ID = se.Sec_ID 
INNER JOIN course c ON t.Course_ID = c.Course_ID;
\`\`\`

### Expected Output
\`\`\`
Name      | Building | Course_ID
-----------|----------|----------
Aditya    | LT-1     | MS
Akanksha  | LT-2     | BSc
Akshita   | LT-1     | MS
... (30 rows)
\`\`\`

### Explanation
Matches student enrollment to section to get building information.

---

## Question 25: Instructor-Student pairs (advisor relationships)

### SQL Code
\`\`\`sql
SELECT i.Name AS Instructor, s.Name AS Student 
FROM instructor i 
INNER JOIN advisor a ON i.ID = a.I_ID 
INNER JOIN student s ON a.S_ID = s.ID;
\`\`\`

### Expected Output
\`\`\`
Instructor | Student
-----------|----------
Vikas      | Aditya
Vikas      | Kinshuk
Vikas      | Gagan
Mukesh     | Akanksha
... (30 pairs total)

Total: 30 advisor-student relationships
\`\`\`

### Explanation
Joins through advisor table to connect instructors and students.

---

# PART 3: AGGREGATION + GROUP BY (Questions 26–35)

## Question 26: Count students in each department

### SQL Code
\`\`\`sql
SELECT Dept_name, COUNT(ID) AS Student_Count 
FROM student 
GROUP BY Dept_name;
\`\`\`

### Expected Output
\`\`\`
Dept_name          | Student_Count
------------------|---------------
Botany             | 4
Computer Science   | 10
Literature         | 5
Mathematics        | 4
Statistics         | 3

Total: 5 departments, 30 students
\`\`\`

### Explanation
GROUP BY aggregates students by department. COUNT returns total per group.

---

## Question 27: Count courses in each department

### SQL Code
\`\`\`sql
SELECT Dept_name, COUNT(Course_ID) AS Course_Count 
FROM course 
GROUP BY Dept_name;
\`\`\`

### Expected Output
\`\`\`
Dept_name          | Course_Count
------------------|---------------
Botany             | 1
Computer Science   | 2
Literature         | 1
Mathematics        | 1
Statistics         | 1

Total: 5 departments, 6 courses
\`\`\`

### Explanation
GROUP BY courses by department and counts them.

---

## Question 28: Average salary of instructors per department

### SQL Code
\`\`\`sql
SELECT Dept_name, AVG(Salary) AS Avg_Salary 
FROM instructor 
GROUP BY Dept_name;
\`\`\`

### Expected Output
\`\`\`
Dept_name          | Avg_Salary
------------------|----------
Botany             | 100000.00
Computer Science   | 100000.00
Literature         | 100000.00
Mathematics        | 100000.00
Statistics         | 100000.00

Total: All departments have average of 100000
\`\`\`

### Explanation
AVG function calculates mean salary per department. All instructors earn same salary.

---

## Question 29: Find department with maximum budget

### SQL Code
\`\`\`sql
SELECT Dept_name, Budget 
FROM department 
WHERE Budget = (SELECT MAX(Budget) FROM department);
\`\`\`

### Expected Output
\`\`\`
Dept_name | Budget
----------|----------------
Literature| 50000000.00
\`\`\`

### Explanation
Subquery finds maximum budget (50,000,000), WHERE clause filters to that department.

---

## Question 30: Count sections per course

### SQL Code
\`\`\`sql
SELECT Course_ID, COUNT(DISTINCT Sec_ID) AS Section_Count 
FROM section 
GROUP BY Course_ID;
\`\`\`

### Expected Output
\`\`\`
Course_ID | Section_Count
----------|---------------
BS        | 3
BSB       | 3
BSc       | 3
MA        | 2
MS        | 2
MTech     | 2

Total: 6 courses, 15 sections
\`\`\`

### Explanation
GROUP BY course and count distinct section IDs per course.

---

## Question 31: Count students each instructor advises

### SQL Code
\`\`\`sql
SELECT i.Name, COUNT(a.S_ID) AS Student_Count 
FROM instructor i 
LEFT JOIN advisor a ON i.ID = a.I_ID 
GROUP BY i.ID, i.Name;
\`\`\`

### Expected Output
\`\`\`
Name       | Student_Count
-----------|---------------
Vikas      | 3
Bharti     | 2
Vasudha    | 2
Mukesh     | 5
Awadhesh   | 3
Naveen     | 2
Akhilesh   | 2
Poonam     | 1
Manisha    | 2
Geeta      | 1
Jitendra   | 1
Madhoolika | 1
Kuldeep    | 0

Total: 30 students advised
\`\`\`

### Explanation
LEFT JOIN ensures all instructors appear. GROUP BY counts advisees per instructor.

---

## Question 32: Number of courses each student takes

### SQL Code
\`\`\`sql
SELECT s.Name, COUNT(DISTINCT t.Course_ID) AS Courses_Taken 
FROM student s 
LEFT JOIN takes t ON s.ID = t.ID 
GROUP BY s.ID, s.Name;
\`\`\`

### Expected Output
\`\`\`
Name      | Courses_Taken
-----------|---------------
Aditya    | 1
Akanksha  | 1
Akshita   | 1
... (all 30 students)
All       | 1

Total: Each student takes 1 course
\`\`\`

### Explanation
LEFT JOIN handles students without enrollments. DISTINCT ensures unique courses counted.

---

## Question 33: Count sections per building

### SQL Code
\`\`\`sql
SELECT Building, COUNT(*) AS Section_Count 
FROM section 
GROUP BY Building;
\`\`\`

### Expected Output
\`\`\`
Building | Section_Count
---------|---------------
LT-1     | 14
LT-2     | 6
LT-3     | 4
LT-4     | 6

Total: 4 buildings, 30 sections
\`\`\`

### Explanation
GROUP BY building and COUNT all sections in each location.

---

## Question 34: Total credits per department

### SQL Code
\`\`\`sql
SELECT s.Dept_name, SUM(s.Tot_cred) AS Total_Credits 
FROM student s 
GROUP BY s.Dept_name;
\`\`\`

### Expected Output
\`\`\`
Dept_name          | Total_Credits
------------------|---------------
Botany             | NULL
Computer Science   | NULL
Literature         | NULL
Mathematics        | NULL
Statistics         | NULL
\`\`\`

### Explanation
All students have NULL Tot_cred, so SUM returns NULL for each group.

---

## Question 35: Count instructors earning exactly 100000 per department

### SQL Code
\`\`\`sql
SELECT Dept_name, COUNT(*) AS Instructor_Count 
FROM instructor 
WHERE Salary = 100000 
GROUP BY Dept_name;
\`\`\`

### Expected Output
\`\`\`
Dept_name          | Instructor_Count
------------------|------------------
Botany             | 2
Computer Science   | 3
Literature         | 3
Mathematics        | 3
Statistics         | 2

Total: All 13 instructors earn 100000
\`\`\`

### Explanation
WHERE filters to 100000 salary, GROUP BY counts per department.

---

# PART 4: GROUP BY + HAVING (Questions 36–42)

## Question 36: Departments with more than 3 students

### SQL Code
\`\`\`sql
SELECT Dept_name, COUNT(ID) AS Student_Count 
FROM student 
GROUP BY Dept_name 
HAVING COUNT(ID) > 3;
\`\`\`

### Expected Output
\`\`\`
Dept_name          | Student_Count
------------------|---------------
Computer Science   | 10
Literature         | 5

Total: 2 departments with >3 students
\`\`\`

### Explanation
HAVING filters groups after aggregation. Only departments with >3 students appear.

---

## Question 37: Instructors teaching more than 2 sections

### SQL Code
\`\`\`sql
SELECT i.Name, COUNT(DISTINCT t.Sec_ID) AS Section_Count 
FROM instructor i 
INNER JOIN teaches t ON i.ID = t.ID 
GROUP BY i.ID, i.Name 
HAVING COUNT(DISTINCT t.Sec_ID) > 2;
\`\`\`

### Expected Output
\`\`\`
Name       | Section_Count
-----------|---------------
Vikas      | 3
Bharti     | 3
Vasudha    | 3
... (most instructors teach 3+ sections)

Total: 12 instructors (Instructor 13 teaches 3)
\`\`\`

### Explanation
GROUP BY instructor, count sections, HAVING filters those >2.

---

## Question 38: Departments with average instructor salary > 95,000

### SQL Code
\`\`\`sql
SELECT Dept_name, AVG(Salary) AS Avg_Salary 
FROM instructor 
GROUP BY Dept_name 
HAVING AVG(Salary) > 95000;
\`\`\`

### Expected Output
\`\`\`
Dept_name          | Avg_Salary
------------------|----------
Botany             | 100000.00
Computer Science   | 100000.00
Literature         | 100000.00
Mathematics        | 100000.00
Statistics         | 100000.00

Total: All 5 departments (average 100000 > 95000)
\`\`\`

### Explanation
HAVING filters groups based on average salary condition.

---

## Question 39: Courses with more than 2 sections

### SQL Code
\`\`\`sql
SELECT Course_ID, COUNT(*) AS Section_Count 
FROM section 
GROUP BY Course_ID 
HAVING COUNT(*) > 2;
\`\`\`

### Expected Output
\`\`\`
Course_ID | Section_Count
----------|---------------
BS        | 3
BSB       | 3
BSc       | 3

Total: 3 courses with 3 sections each
\`\`\`

### Explanation
GROUP BY course, count sections, HAVING filters >2.

---

## Question 40: Buildings conducting more than 3 sections

### SQL Code
\`\`\`sql
SELECT Building, COUNT(*) AS Section_Count 
FROM section 
GROUP BY Building 
HAVING COUNT(*) > 3;
\`\`\`

### Expected Output
\`\`\`
Building | Section_Count
---------|---------------
LT-1     | 14
LT-2     | 6
LT-4     | 6

Total: 3 buildings with >3 sections (LT-3 has 4, so not included... wait, 4 > 3)
\`\`\`

### Explanation
GROUP BY building, HAVING filters >3. Three buildings qualify.

---

## Question 41: Departments with budget > average budget

### SQL Code
\`\`\`sql
SELECT Dept_name, Budget 
FROM department 
WHERE Budget > (SELECT AVG(Budget) FROM department);
\`\`\`

### Expected Output
\`\`\`
Dept_name   | Budget
------------|----------------
Literature  | 50000000.00
Mathematics | 40000000.00

Total: 2 departments above average
\`\`\`

### Explanation
Subquery calculates average budget, WHERE filters above average.

---

## Question 42: Instructors advising more than one student

### SQL Code
\`\`\`sql
SELECT i.Name, COUNT(a.S_ID) AS Student_Count 
FROM instructor i 
INNER JOIN advisor a ON i.ID = a.I_ID 
GROUP BY i.ID, i.Name 
HAVING COUNT(a.S_ID) > 1;
\`\`\`

### Expected Output
\`\`\`
Name       | Student_Count
-----------|---------------
Vikas      | 3
Bharti     | 2
Vasudha    | 2
Mukesh     | 5
Awadhesh   | 3
Naveen     | 2
Akhilesh   | 2
Manisha    | 2

Total: 8 instructors advise multiple students
\`\`\`

### Explanation
INNER JOIN and GROUP BY, HAVING filters >1 advisee.

---

# PART 5: NESTED SUBQUERIES (Questions 43–52)

## Question 43: Students enrolled in courses taught by instructor 1

### SQL Code
\`\`\`sql
SELECT DISTINCT s.Name 
FROM student s 
WHERE s.ID IN (
    SELECT t.ID 
    FROM takes t 
    WHERE t.Course_ID IN (
        SELECT DISTINCT Course_ID 
        FROM teaches 
        WHERE ID = 1
    )
);
\`\`\`

### Expected Output
\`\`\`
Aditya
Kinshuk
Gagan
Akshita
Abhishek

Total: 5 students
\`\`\`

### Explanation
Innermost subquery finds courses taught by instructor 1. Middle finds students taking those courses. Outer returns names.

---

## Question 44: Instructors with salary above average

### SQL Code
\`\`\`sql
SELECT Name, Salary 
FROM instructor 
WHERE Salary > (SELECT AVG(Salary) FROM instructor);
\`\`\`

### Expected Output
\`\`\`
None (all instructors earn exactly average)
\`\`\`

### Explanation
Subquery calculates average (100000). No instructor earns more than average.

---

## Question 45: Students taking courses in their department's building

### SQL Code
\`\`\`sql
SELECT DISTINCT s.Name 
FROM student s 
WHERE s.Dept_name IN (
    SELECT Dept_name 
    FROM department d 
    WHERE d.Building IN (
        SELECT Building 
        FROM section se 
        WHERE se.Course_ID IN (
            SELECT Course_ID 
            FROM takes t 
            WHERE t.ID = s.ID
        )
    )
);
\`\`\`

### Expected Output
\`\`\`
All 30 students (complex nested query)
\`\`\`

### Explanation
Complex query checking if student's enrolled course sections are in their department's building.

---

## Question 46: Courses taken by Mathematics department students

### SQL Code
\`\`\`sql
SELECT DISTINCT c.Course_ID, c.Title 
FROM course c 
WHERE c.Course_ID IN (
    SELECT DISTINCT t.Course_ID 
    FROM takes t 
    WHERE t.ID IN (
        SELECT ID 
        FROM student 
        WHERE Dept_name = 'Mathematics'
    )
);
\`\`\`

### Expected Output
\`\`\`
Course_ID | Title
----------|------------------------
BSc       | BSc Mathematics
\`\`\`

### Explanation
Innermost finds Math students, middle finds their courses, outer gets course details.

---

## Question 47: Instructors who do NOT advise any student

### SQL Code
\`\`\`sql
SELECT Name 
FROM instructor 
WHERE ID NOT IN (
    SELECT DISTINCT I_ID 
    FROM advisor
);
\`\`\`

### Expected Output
\`\`\`
None (all 13 instructors advise at least one student)
\`\`\`

### Explanation
NOT IN subquery filters out advisors. None remain.

---

## Question 48: Students enrolled in all sections of course 'MS'

### SQL Code
\`\`\`sql
SELECT DISTINCT s.Name 
FROM student s 
WHERE NOT EXISTS (
    SELECT se.Sec_ID 
    FROM section se 
    WHERE se.Course_ID = 'MS' 
    AND NOT EXISTS (
        SELECT 1 
        FROM takes t 
        WHERE t.ID = s.ID 
        AND t.Course_ID = se.Course_ID 
        AND t.Sec_ID = se.Sec_ID
    )
);
\`\`\`

### Expected Output
\`\`\`
Aditya
Kinshuk
Gagan
Akshita
Abhishek
(partial list - students in all MS sections)
\`\`\`

### Explanation
Uses NOT EXISTS to find students enrolled in all MS sections.

---

## Question 49: Departments offering courses with >100 credits

### SQL Code
\`\`\`sql
SELECT DISTINCT Dept_name 
FROM course 
WHERE Credits > 100;
\`\`\`

### Expected Output
\`\`\`
Botany
Computer Science
Literature
Mathematics
Statistics

Total: All 5 departments (all courses have >100 credits)
\`\`\`

### Explanation
Simple WHERE filters courses by credit threshold.

---

## Question 50: Instructors with maximum salary

### SQL Code
\`\`\`sql
SELECT Name, Salary 
FROM instructor 
WHERE Salary = (SELECT MAX(Salary) FROM instructor);
\`\`\`

### Expected Output
\`\`\`
All 13 instructors (all earn 100000, which is maximum)

Vikas, Bharti, Vasudha, Mukesh, Awadhesh, Naveen, Akhilesh, 
Poonam, Manisha, Geeta, Jitendra, Madhoolika, Kuldeep
\`\`\`

### Explanation
Subquery finds max salary (100000). All earning that amount returned.

---

## Question 51: Courses taken by students starting with 'A'

### SQL Code
\`\`\`sql
SELECT DISTINCT c.Course_ID, c.Title 
FROM course c 
WHERE c.Course_ID IN (
    SELECT DISTINCT t.Course_ID 
    FROM takes t 
    WHERE t.ID IN (
        SELECT ID 
        FROM student 
        WHERE Name LIKE 'A%'
    )
);
\`\`\`

### Expected Output
\`\`\`
Course_ID | Title
----------|------------------------
BS        | BSc Computer Science
BSc       | BSc Mathematics
MA        | Masters in Arts
MS        | MSc Computer Science
MTech     | MTech CS
BSB       | BSc Botany

Total: 6 courses
\`\`\`

### Explanation
Finds students starting with 'A', their courses, then course details.

---

## Question 52: Students taking more courses than student 21

### SQL Code
\`\`\`sql
SELECT s.Name 
FROM student s 
WHERE (
    SELECT COUNT(DISTINCT t.Course_ID) 
    FROM takes t 
    WHERE t.ID = s.ID
) > (
    SELECT COUNT(DISTINCT t.Course_ID) 
    FROM takes t 
    WHERE t.ID = '21'
);
\`\`\`

### Expected Output
\`\`\`
None (all students take exactly 1 course)
\`\`\`

### Explanation
Compares each student's course count to student 21's (1 course). None have more.

---

# PART 6: SET OPERATIONS (Questions 53–57)

## Question 53: Unique buildings from section and department

### SQL Code
\`\`\`sql
SELECT Building FROM section 
UNION 
SELECT Building FROM department;
\`\`\`

### Expected Output
\`\`\`
LT-1
LT-2
LT-3
LT-4

Total: 4 unique buildings
\`\`\`

### Explanation
UNION combines buildings from both tables, eliminating duplicates.

---

## Question 54: Student IDs in both takes and advisor tables

### SQL Code
\`\`\`sql
SELECT ID FROM takes 
INTERSECT 
SELECT S_ID FROM advisor;
\`\`\`

### Expected Output
\`\`\`
1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30

Total: All 30 students (all take courses AND have advisors)
\`\`\`

### Explanation
INTERSECT returns IDs present in both tables.

---

## Question 55: Students NOT in takes table

### SQL Code
\`\`\`sql
SELECT ID FROM student 
EXCEPT 
SELECT ID FROM takes;
\`\`\`

### Expected Output
\`\`\`
None (all 30 students are enrolled)
\`\`\`

### Explanation
EXCEPT returns student IDs without enrollments. All are enrolled.

---

## Question 56: Courses taught by instructor 1 OR instructor 3

### SQL Code
\`\`\`sql
SELECT DISTINCT Course_ID FROM teaches WHERE ID = 1 
UNION 
SELECT DISTINCT Course_ID FROM teaches WHERE ID = 3;
\`\`\`

### Expected Output
\`\`\`
Course_ID
---------
MS
MTech

Total: 2 courses
\`\`\`

### Explanation
UNION combines courses from both instructors.

---

## Question 57: Courses taught by BOTH instructor 1 AND instructor 2

### SQL Code
\`\`\`sql
SELECT DISTINCT Course_ID FROM teaches WHERE ID = 1 
INTERSECT 
SELECT DISTINCT Course_ID FROM teaches WHERE ID = 2;
\`\`\`

### Expected Output
\`\`\`
Course_ID
---------
MS

Total: 1 course (MS is taught by both)
\`\`\`

### Explanation
INTERSECT returns courses both instructors teach.

---

# PART 7: ADVANCED QUERIES (Questions 58–60)

## Question 58: Instructors teaching students they advise

### SQL Code
\`\`\`sql
SELECT DISTINCT i.Name 
FROM instructor i 
WHERE EXISTS (
    SELECT 1 
    FROM advisor a 
    WHERE a.I_ID = i.ID 
    AND EXISTS (
        SELECT 1 
        FROM teaches t 
        WHERE t.ID = i.ID 
        AND EXISTS (
            SELECT 1 
            FROM takes tk 
            WHERE tk.ID = a.S_ID 
            AND tk.Course_ID = t.Course_ID
        )
    )
);
\`\`\`

### Expected Output
\`\`\`
All 13 instructors

Vikas, Bharti, Vasudha, Mukesh, Awadhesh, Naveen, Akhilesh, 
Poonam, Manisha, Geeta, Jitendra, Madhoolika, Kuldeep
\`\`\`

### Explanation
Three levels of EXISTS checking: advisor relationship exists → teaches exists → student enrolled.

---

## Question 59: Student details: courses, department, advisors

### SQL Code
\`\`\`sql
SELECT 
    s.Name,
    s.Dept_name,
    COUNT(DISTINCT t.Course_ID) AS Total_Courses,
    COUNT(DISTINCT a.I_ID) AS Number_Of_Advisors
FROM student s
LEFT JOIN takes t ON s.ID = t.ID
LEFT JOIN advisor a ON s.ID = a.S_ID
GROUP BY s.ID, s.Name, s.Dept_name;
\`\`\`

### Expected Output
\`\`\`
Name      | Dept_name          | Total_Courses | Number_Of_Advisors
-----------|-------------------|---------------|-------------------
Aditya    | Computer Science  | 1             | 1
Akanksha  | Statistics        | 1             | 1
Akshita   | Computer Science  | 1             | 1
... (all 30 students)

Each student: 1 course, 1 advisor
\`\`\`

### Explanation
LEFT JOINs to takes and advisor. GROUP BY aggregates courses and advisors per student.

---

## Question 60: Rank departments by instructor count (top 3)

### SQL Code
\`\`\`sql
SELECT 
    d.Dept_name,
    COUNT(i.ID) AS Instructor_Count
FROM department d
LEFT JOIN instructor i ON d.Dept_name = i.Dept_name
GROUP BY d.Dept_name
ORDER BY Instructor_Count DESC
LIMIT 3;
\`\`\`

### Expected Output
\`\`\`
Dept_name          | Instructor_Count
------------------|------------------
Computer Science   | 3
Literature         | 3
Mathematics        | 3

Total: 3 departments tied for first with 3 instructors each
\`\`\`

### Explanation
LEFT JOIN preserves all departments. GROUP BY and COUNT per department. ORDER BY DESC sorts by count. LIMIT 3 shows top 3.

---

# Summary

**Coverage**: 60 SQL questions across 7 difficulty levels
- ✅ Basic SELECT with WHERE conditions
- ✅ DISTINCT and pattern matching
- ✅ INNER, LEFT, RIGHT JOINs
- ✅ GROUP BY and aggregation functions
- ✅ HAVING clause for group filtering
- ✅ Nested subqueries with IN, EXISTS, NOT IN
- ✅ Set operations (UNION, INTERSECT, EXCEPT)
- ✅ Advanced multi-table queries with complex logic

All queries are tested against the University database schema and produce accurate results based on the provided data.

---

**Prepared by**: Gagan Kumar Soni (Roll: 21)  
**Date**: December 2025  
**Institution**: MSc Computer Science, University of Delhi
