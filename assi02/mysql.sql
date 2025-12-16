create database int_courses;

use int_courses;
show databases

create table users(email varchar(50) primary key, password varchar(20),role enum('admin','student'));

create table courses(
    ->     course_id int primary key auto_increment,
    ->     course_name varchar(50),
    ->     description varchar(100),
    ->     fees  int ,
    ->     start_date date,
    ->     end_date date,
    ->     video_expire_days int
    ->     );

    
    create table students(
    ->     reg_no int primary key auto_increment,
    ->     name varchar(50),
    ->     email varchar(50),
    ->     course_id int ,
    ->     mobile_no int,
    ->     profile_pic blob,
    ->     foreign key (email) references users (email),
    ->     foreign key (course_id) references courses(course_id)
    ->      );
    
     create table videos(
    ->     video_id int primary key auto_increment ,
    ->     course_id int ,
    ->     title varchar(50),
    ->     description varchar(100),
    ->     youtube_url varchar(100),
    ->     added_at date,
    ->     foreign key (course_id) references courses (course_id)
    ->     );
    
    insert into users values('123@gmail.com','123','student');
    insert into users values('124@gmail.com','124','student');
   insert into users values('125@gmail.com','125','student');
   
   
insert into courses(course_name,description,fees,start_date,end_date,video_expire_days) values('AI','using python',4000,'2025-12-29','2026-01-05',30);
 insert into courses(course_name,description,fees,start_date,end_date,video_expire_days) values('MERN','frontend and backend',4000,'2025-12-29','2026-01-05',30);
insert into courses(course_name,description,fees,start_date,end_date,video_expire_days) values('JAVA','java programming',4000,'2025-12-29','2026-01-05',30);

students(name,email,course_id,mobile_no,profile_pic) values('Digvijay','123@gmail.com',1,1234567891,null);
students(name,email,course_id,mobile_no,profile_pic) values('Vrushabh','124@gmail.com',2,1234567892,null);
students(name,email,course_id,mobile_no,profile_pic) values('Dikshant','125@gmail.com',3,1234567893,null);


insert into videos(course_id,title,description,youtube_url,added_at) values(1,'AI - video','all about ai','#','2025-01-01');
insert into videos(course_id,title,description,youtube_url,added_at) values('2','MERN - video','all about mern','#','2025-01-01');
insert into videos(course_id,title,description,youtube_url,added_at) values('3',' JAVA - video','all about java','#','2025-01-01');

 select * from users
+---------------+----------+---------+
| email         | password | role    |
+---------------+----------+---------+
| 123@gmail.com | 123      | student |
| 124@gmail.com | 124      | student |
| 125@gmail.com | 125      | student |
+---------------+----------+---------+

select * from students;
+--------+----------+---------------+-----------+------------+--------------------------+
| reg_no | name     | email         | course_id | mobile_no  | profile_pic              |
+--------+----------+---------------+-----------+------------+--------------------------+
|      1 | Digvijay | 123@gmail.com |         1 | 1234567891 | NULL                     |
|      2 | Vrushabh | 124@gmail.com |         2 | 1234567892 | NULL                     |
|      3 | Dikshant | 125@gmail.com |         3 | 1234567893 | NULL                     |
+--------+----------+---------------+-----------+------------+--------------------------+
\
select * from courses;
+-----------+-------------+----------------------+------+------------+------------+-------------------+
| course_id | course_name | description          | fees | start_date | end_date   | video_expire_days |
+-----------+-------------+----------------------+------+------------+------------+-------------------+
|         1 | AI          | using python         | 4000 | 2025-12-29 | 2026-01-05 |                30 |
|         2 | MERN        | frontend and backend | 4000 | 2025-12-29 | 2026-01-05 |                30 |
|         3 | JAVA        | java programming     | 4000 | 2025-12-29 | 2026-01-05 |                30 |
+-----------+-------------+----------------------+------+------------+------------+-------------------+


select * from videos;
+----------+-----------+---------------+----------------+-------------+------------+
| video_id | course_id | title         | description    | youtube_url | added_at   |
+----------+-----------+---------------+----------------+-------------+------------+
|        1 |         1 | AI - video    | all about ai   | #           | 2025-01-01 |
|        2 |         2 | MERN - video  | all about mern | #           | 2025-01-01 |
|        3 |         3 |  JAVA - video | all about java | #           | 2025-01-01 |
+----------+-----------+---------------+----------------+-------------+------------+


1.1st question
 select * from courses where start_date > CURDATE();
+-----------+-------------+----------------------+------+------------+------------+-------------------+
| course_id | course_name | description          | fees | start_date | end_date   | video_expire_days |
+-----------+-------------+----------------------+------+------------+------------+-------------------+
|         1 | AI          | using python         | 4000 | 2025-12-29 | 2026-01-05 |                30 |
|         2 | MERN        | frontend and backend | 4000 | 2025-12-29 | 2026-01-05 |                30 |
|         3 | JAVA        | java programming     | 4000 | 2025-12-29 | 2026-01-05 |                30 |
+-----------+-------------+----------------------+------+------------+------------+-------------------+

2-- 2nd Question
select s.reg_no,s.name,s.email,s.mobile_no,c.course_id,course_name from students s
    -> join courses c
    -> on s.course_id = c.course_id;
+--------+----------+---------------+------------+-----------+-------------+
| reg_no | name     | email         | mobile_no  | course_id | course_name |
+--------+----------+---------------+------------+-----------+-------------+
|      1 | Digvijay | 123@gmail.com | 1234567891 |         1 | AI          |
|      2 | Vrushabh | 124@gmail.com | 1234567892 |         2 | MERN        |
|      3 | Dikshant | 125@gmail.com | 1234567893 |         3 | JAVA        |
+--------+----------+---------------+------------+-----------+-------------+

3-- 3rd Question 

SELECT s.reg_no,s.name,s.email,s.mobile_no,c.course_id,c.description,c.fees,c.start_date,c.end_date,c.video_expire_days
FROM student s
INNER JOIN courses c
ON s.course_id=c.course_id
WHERE s.email="yash@gmail.com";


4th Question 
  SELECT c.course_id,c.course_name,c.start_date,c.end_date,c.video_expire_days,v.video_id,v.title,v.added_at FROM student s 
INNER JOIN courses c ON s.course_id=c.course_id
INNER JOIN videos v ON  v.course_id=c.course_id
WHERE s.email="student1@gmail.com" AND
v.added_at + INTERVAL c.video_expire_days DAY >= CURRENT_DATE;