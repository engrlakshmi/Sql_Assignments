#1.  Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.#
CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;
CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);
INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Sarika', 'Arora', 100000, '14-02-21 09.00.00', 'HR'),
		(002, 'Rama', 'Verma', 80000, '14-06-22 09.00.00', 'IT staff'),
		(003, 'Vishu', 'Singhal', 300000, '14-02-22 09.00.00', 'HR'),
		(004, 'Amit', 'Singh', 500000, '14-02-22 09.00.00', 'Admin'),
		(005, 'Kiki', 'Bhati', 500000, '14-06-22 09.00.00', 'Admin'),
		(006, 'Fade', 'Diwan', 200000, '14-06-22 09.00.00', 'head'),
		(007, 'Farae', 'Kumar', 75000, '14-01-20 09.00.00', 'Developer'),
		(008, 'Geethika', 'Chauhan', 90000, '14-04-22 09.00.00', 'Admin');
      Select FIRST_NAME AS WORKER_NAME from Worker;
      # 2. Write an SQL query to fetch unique values of DEPARTMENT from Worker table#
      Select distinct DEPARTMENT from Worker;
      #3. Last five record from the table#
      Select * from Worker where WORKER_ID = (SELECT max(WORKER_ID) from Worker);
      
      
      
        