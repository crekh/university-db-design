# university-db-design
# 🏛️ University Enrollment Database System
> **A Relational DBMS designed for academic record management and scalability.**
>
>![Database Relational Schema](./image_678d46.png)
>
>**Project Overview**
> 
This project involved the design and implementation of a scalable relational database for university academic management. The goal was to create a system capable of handling complex interactions between students, faculty, and departments while maintaining strict data integrity.

**Technical Specifications**:
* DBMS: MySQL.

* Modeling: Utilized ER Modeling to map entities including Students, Professors, Courses, and Departments.

* Normalization: Applied 3NF principles to ensure the database is optimized for both storage and query performance.

**Relationships**:

* 1:M (One-to-Many): Department to Professors; Department to Courses.

* M:N (Many-to-Many): Students to Courses (via an associative 'Enrollment' table).

**Key Features**
* Referential Integrity: Enforced via Foreign Keys to prevent orphan records in enrollment data.

* Schema Scalability: Designed to support thousands of concurrent student records without performance degradation.

* Efficient Querying: Structured to allow complex joins for generating academic transcripts and departmental reports.
