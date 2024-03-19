
-- create the database
create database if not exists studentrecord;
use studentrecord;
create table students (
studentID int auto_increment primary key,
firstname varchar(255) not null,
lastname varchar(255) not null,
 age int,
 email varchar(255) unique not null,
 address varchar(255)
 );
 
 create table courses (
 courseID int auto_increment primary key,
 coursename varchar(100) not null,
 instructor varchar(50)
 );
 
 create table enrolls (
 enrollID int auto_increment primary key,
 studentID int,
 courseID int,
 enrolldate date
 );
 -- add amount_paid to enrollments
 alter table enrolls
 add column amount double default 0.0;
 
 
 -- add a foreign key constraint
 alter table enrolls
 add constraint foreign key (studentID) references students (studentID);
 
 alter table enrolls
 add constraint foreign key(courseID) references courses(courseID);
 
 -- insert 5 records 
 
 insert into students(firstname, lastname, age, email, address)
 values ("ola","ade",12, "oyekanmiakande@gmail.com", null),
 ("rala", "fol",15, "rala@gmail.com","ikoyi"),
 ("shaya","tawo",23,"shaya.taiwo@gmail.com", "ikoyi"),
 ("samba","con",21,"samba@gmail.com","ikeja,lagos"),
 ("dennis", "fadi",21, "dennis@gmail.com","ikeja, lagos");
 
 -- insert 2 courses
 insert into courses (coursename, instructor)
 values ("data science", "ojo abiodun"),
 ("UI/UX", "daniel sam");
 
 -- insert 5 enrollment
 insert into enrolls ( studentID, courseID, enrolldate, amount)
 values (6,1, "2023-10-01", 5000),
 (7,1,"2023-10-01",7000),
 (8,2,"2023-10-05",null),
 (9,1,"2023-10-06",30000),
 (10,1,"2023-10-06",125000);
 
 -- analysis on the data
 
 select * from students;
 select * from courses;
 select * from enrolls;
 
 -- retrieve the first name and last name of all student
 
 select firstname, lastname
 from students;
 select concat(firstname," ",lastname) as "full name"
 from students;
 
 -- find total number of student enrolled in each course
 select c.coursename, count(s.studentID) as "number of students"
 from students as s
 inner join enrolls as e on s. studentID = e. studentID
 inner join courses as c on e.courseID = c.courseID
 group by c.courseID;
 
 -- find the course that generate more revenue
 
 select c.coursename, sum(e.amount)
 from courses as c
 inner join enrolls as e on c.courseID = e.courseID
 group by c.courseID;
 
 
 
 
 
 
 
 
 
