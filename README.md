# university-db-design
# 🏛️ University Enrollment Database System
> **A Relational DBMS designed for academic record management and scalability.**
> Database Design
>![Database Relational Schema](./image_678d46.png)

>
>**Project Overview**
> 
This project involved the design and implementation of a scalable relational database for university academic management. The goal was to create a system capable of handling complex interactions between students, faculty, and departments while maintaining strict data integrity.

**Technical Specifications**:
* DBMS: MySQL.

* Modeling: Utilized ER Modeling to map entities including Students, Professors, Courses, and Departments.

* Normalization: Applied 3NF principles to ensure the database is optimized for both storage and query performance.



* I designed custom forms with built-in validation to ensure data quality at the point of entry.
* 
* **Feature:** The Navigation Form provides a centralized "Command Center" for registrars to toggle between registration and assignment tasks.
![Student Registration Form](./Screenshot_2026-03-23_135429.png)

### **Dynamic Reporting**
Leveraging complex SQL Joins, the system generates real-time reports for academic auditing:
* **Course Roster:** Aggregates student data by course title and semester.
* **Enrollment Summary:** Provides a student-centric view of academic history.
<p align="center">
  <img src="./Screenshot_2026-03-23_135619.png" width="45%" />
  <img src="./Screenshot_2026-03-23_135709.png" width="45%" />
</p>


**Relationships**:

* 1:M (One-to-Many): Department to Professors; Department to Courses.

* M:N (Many-to-Many): Students to Courses (via an associative 'Enrollment' table).

**Key Features**
* Referential Integrity: Enforced via Foreign Keys to prevent orphan records in enrollment data.

* Schema Scalability: Designed to support thousands of concurrent student records without performance degradation.

* Efficient Querying: Structured to allow complex joins for generating academic transcripts and departmental reports.

