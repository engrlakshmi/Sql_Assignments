create database assignments_feb;
use assignments_feb;
CREATE TABLE worker_table (
    WORKER_ID INT,
    FIRST_NAME VARCHAR(200),
    LAST_NAME VARCHAR(200),
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPARTMENT VARCHAR(200),
    PRIMARY KEY (WORKER_ID)
);
drop table Title;

CREATE TABLE Title (
    WORKER_ID_REF INT,
    WORKER_TITLE VARCHAR(200),
    AFFECTED_FROM DATETIME
    );
insert into Title values('1','Manager','2016-02-20 00:00:00');
insert into Title values('2','Executive','2016-06-11 00:00:00');
insert into Title values('8','Executive','2016-06-11 00:00:00');
insert into Title values('5','Manager','2016-06-11 00:00:00');
insert into Title values('4','Asst. Manager','2016-06-11 00:00:00');
insert into Title values('7','Executive','2016-06-11 00:00:00');
insert into Title values('6','Lead','2016-06-11 00:00:00');
insert into Title values('3','Lead','2016-06-11 00:00:00');
select WORKER_ID_REF from Title order by WORKER_ID_REF asc;
#select *from worker_table;
#Assignment 1
#Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as &lt;WORKER_NAME&gt;.
select FIRST_NAME from worker_table; 
#Q-2. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select DEPARTMENT from worker_table; 
#Q-3.Write an SQL query to show the last 5 record from a table.
select *from worker_table limit 5 ;
#Assignment 2
#Q-1. Write an SQL query to print the first three characters of  FIRST_NAME from Workertable.
select substring(FIRST_NAME,1,3) from worker_table;
#Q-2. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
select instr(FIRST_NAME,BINARY 'a') from worker_table where FIRST_NAME ='Amitabh';
#Q-3. Write an SQL query to print the name of employees having the highest salary in each department.
select FIRST_NAME , max(SALARY) from worker_table group by FIRST_NAME;
SELECT 
    t.DEPARTMENT, t.FIRST_NAME, t.SALARY
FROM
    (SELECT 
        MAX(SALARY) AS TotalSalary, DEPARTMENT
    FROM
        worker_table
    GROUP BY DEPARTMENT) AS TempNew
        INNER JOIN
    worker_table t ON TempNew.DEPARTMENT = t.DEPARTMENT
        AND TempNew.TotalSalary = t.SALARY;
#Assignment 3
#Q-1. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
select rtrim(FIRST_NAME) from worker_table as righttrimmedstring;
select ltrim(FIRST_NAME) from worker_table as lefttrimmedstring;
#Q-2. Write an SQL query that fetches the unique values of DEPARTMENT from Workertable and prints its length.
select LENGTH(DEPARTMENT) from worker_table group by DEPARTMENT;
#Q-3. Write an SQL query to fetch nth max salaries from a table.
select distinct SALARY from worker_table a where SALARY >= (select count( DISTINCT SALARY) FROM worker_table t where a.SALARY >= t.SALARY) order by a.SALARY desc;
#Assignment 4
#Q-1. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’with ‘A’.
select replace(FIRST_NAME,'a', 'A') from worker_table;
#Q-2.Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select *from worker_table order by FIRST_NAME asc , DEPARTMENT desc  ;
#Q-3. Write an SQL query to fetch the names of workers who earn the highest salary.
select FIRST_NAME, max(SALARY) from worker_table group by FIRST_NAME;
#Assignment 5
#-1. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
select *from worker_table where FIRST_NAME not in ('Vipul','Satish');
#Q-2. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select *from worker_table where FIRST_NAME regexp "h$" having length(FIRST_NAME) =6;
#Q-3. Write a query to validate Email of Employee.
select *from worker_table where e_mail like '%gmail.com';
#Assignment 6
#Q-1. Write an SQL query to print details of the Workers who have joined in Feb’2014.
select *from worker_table where JOINING_DATE >  '2014-01-20 09:00:00';
#Q-2. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
select WORKER_ID, count(WORKER_ID) from worker_table group by WORKER_ID having count(WORKER_ID)>1;
#Q-3. How to remove duplicate rows from Employees table.
delete from worker_table where WORKER_ID not in ( select max(WORKER_ID) as maxrecordid from worker_table group by  WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT);
#Assignment 7
# Q-13. Write an SQL query to show only odd rows from a table.
Select * from worker_table where (WORKER_ID % 2) = 1;
# Q-14. Write an SQL query to clone a new table from another table.
CREATE TABLE new_table LIKE worker_table;
INSERT INTO worker_table SELECT * FROM new_table;
#Assignment 8
#Q-15. Write an SQL query to fetch intersecting records of two tables.
select WORKER_ID,FIRST_NAME
    from worker_table LEFT JOIN Title on worker_table.WORKER_ID =Title.WORKER_ID_REF
  union
    select WORKER_ID,FIRST_NAME
    from worker_table  right JOIN Title on worker_table.WORKER_ID =Title.WORKER_ID_REF;
   
#Q-16. Write an SQL query to show records from one table that another table does not ave.
select * from worker_table where NOT EXISTS(select *from Title where worker_table.WORKER_ID =Title.WORKER_ID_REF);
#Assignment 9
#Q-17. Write an SQL query to show the top n (say 10) records of a table.
select *from worker_table order by salary desc limit 10;
#Q-18. Write an SQL query to determine the nth (say n=5) highest salary from a table.
select max(salary) from worker_table order by salary desc limit 5;
#Assignment 10
#Q-19 Write an SQL query to determine the 5th highest salary without using TOP or limit method.
SELECT salary
FROM worker_table W1
WHERE 4 = (
 SELECT COUNT( DISTINCT ( W2.salary ) )
 FROM worker_table W2
 WHERE W2.salary >= W1.salary
 );
#Q-20. Write an SQL query to fetch the list of employees with the same salary.
Select distinct W.WORKER_ID, W.FIRST_NAME, W.salary 
from worker_table W, worker_table W1 
where W.salary = W1.salary 
and W.WORKER_ID != W1.WORKER_ID;