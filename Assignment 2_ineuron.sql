#Q-1. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.#
CREATE DATABASE ORGANISATION;
SHOW DATABASES;
USE ORGANISATION;
CREATE TABLE Workertable (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);
INSERT INTO Workertable 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Sarika', 'Arora', 100000, '14-02-21 09.00.00', 'HR'),
		(002, 'Rama', 'Verma', 80000, '14-06-22 09.00.00', 'IT staff'),
		(003, 'Vishu', 'Singhal', 300000, '14-02-22 09.00.00', 'HR'),
		(004, 'Amit', 'Singh', 500000, '14-02-22 09.00.00', 'Admin'),
		(005, 'Kiki', 'Bhati', 500000, '14-06-22 09.00.00', 'Admin'),
		(006, 'Fade', 'Diwan', 200000, '14-06-22 09.00.00', 'head'),
		(007, 'Farae', 'Kumar', 75000, '14-01-20 09.00.00', 'Developer'),
		(008, 'Geethika', 'Chauhan', 90000, '14-04-22 09.00.00', 'Admin');
      Select substring(FIRST_NAME,1,3) from Workertable;
      # Q-2. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.#
      Select INSTR(FIRST_NAME, BINARY 'a') from Workertable where FIRST_NAME = 'Amitabh';
 #Q-3. Write an SQL query to print the name of employees having the highest salary in each department.#
 SELECT t.DEPARTMENT,t.FIRST_NAME,t.Salary from(SELECT max(Salary) as TotalSalary,DEPARTMENT from Workertable group by DEPARTMENT) as TempNew 
Inner Join Workertable t on TempNew.DEPARTMENT=t.DEPARTMENT 
 and TempNew.TotalSalary=t.Salary;
 
      
      
      