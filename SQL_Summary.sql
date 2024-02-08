show databases;
create database SQL_SUMMARY;
use SQL_SUMMARY;
Create table EmployeeDetail(
             EmployeeID int(11) not null,
             FirstName varchar(100) not null,
             LastName varchar(100) not null,
             Salary int(100) not null,
             joinedDate timestamp,
             Department varchar(100) not null,
             Gender text not null);
             
Alter table EmployeeDetail modify column EmployeeID int(11) not null primary key auto_increment;
insert into EmployeeDetail (EmployeeID, FirstName, lastName, Salary, Department, Gender) values (01, 'Johnson', 'Mike', 40000, 'Sales', 'Male');
insert into EmployeeDetail (EmployeeID, FirstName, lastName, Salary, Department, Gender) values (02, 'Maryam', 'Hassan', 42000, 'Sales', 'Female');
insert into EmployeeDetail (EmployeeID, FirstName, lastName, Salary, Department, Gender) values (03, 'Benjamin', 'Gomez', 39000, 'HR', 'Male');
insert into EmployeeDetail (EmployeeID, FirstName, lastName, Salary, Department, Gender) values (04, 'Tosin', 'Abiodun', 60000, 'IT', 'Female');
insert into EmployeeDetail (EmployeeID, FirstName, lastName, Salary, Department, Gender) values (05, 'Promise', 'Monbari', 75000, 'Tech', 'Male');
insert into EmployeeDetail (EmployeeID, FirstName, lastName, Salary, Department, Gender) values (06, 'Damilola', 'Ayo', 49000, 'IT', 'Female');
insert into EmployeeDetail (EmployeeID, FirstName, lastName, Salary, Department, Gender) values (07, 'Chibuzor', 'Gomez', 49000, 'IT', 'Male');
insert into EmployeeDetail (EmployeeID, FirstName, lastName, Salary, Department, Gender) values (08, 'Aufiya', 'Luka', 52000, 'sales', 'Female');
insert into EmployeeDetail (EmployeeID, FirstName, lastName, Salary, Department, Gender) values (09, 'Ehis', 'Hudson', 81000, 'Tech', 'Male');
insert into EmployeeDetail (EmployeeID, FirstName, lastName, Salary, Department, Gender) values (10, 'Evelyn', 'John', 65000, 'HR', 'female');

create table ProjectDetail(
             projectID int(11) not null,
             EmployeeID int(11) not null primary key auto_increment,
             ProjectName varchar(100) not null);
	

-- Basic SQL QUERRIES -- 
-- 1. to get all Employee detail for "EmployeeDetail" table-- 

SELECT * FROM EMployeeDetail;

---- Query to get only "FirstName" column from "EmployeeDetail" table -- 
SELECT FirstName FROM EmployeeDetail;

-- Query to get FirstName in upper case as "First Name"
SELECT UPPER(FirstName) AS FirstName FROM EmployeeDetail;

-- To get First Name in Lower Case 
SELECT LOWER(FirstName) AS Firstname FROM EmployeeDetail; 

-- To display Firstname and lastname together as Name
SELECT CONCAT(FirstName ,' ', LastName) AS Name FROM EmployeeDetail;

-- select employeedetails whose firstname is = 'Ehis'
SELECT * FROM EmployeDetail WHERE Firstname = 'Ehis';
SELECT * FROM EmployeeDetail where firstname like 'E%';
Select *from Employeedetail where firstname like '%A%';
SELECT * FROM Employeedetail where lastname like '%A';
SELECT * FROM EmployeeDetail WHERE FirstName like '[A-G%]';
SELECT * FROM EmployeeDetail WHERE FirstName like '[^a-p]%';
SELECT * FROM EmployeeDetail WHERE Gender like '__le' "_";
 SELECT * FROM EmployeeDetail WHERE FirstName like 'A____'  "_";
 Select * from Employeedetail WHERE firstname like '%[%]$';      -- this with return a nul value -- 

-- select all unique department from employeedetail 
Select distinct (department) from Employeedetail;

-- Get highest salary
SELECT MAX(salary) from employeedetail;
Select Min(salary) from Employeedetail;

-- Show joining date in terms of dd mm yyyy
SELECT CONVERT (joineddate, varchar(20)) from Employeedetail;
SELECT (joineddate, (year)) from employeedetail;
select Getutcdate();

-- salary
select * from employeedetail limit 1; 
select * from employeedetail where firstname in('Tosin', 'Damilola', 'ehis');
select * from employeedetail where firstname not in('Tosin', 'Damilola', 'ehis');

-- Select firstname after removing white spaces
select rtrim(firstname) as First_Name from employeedetail;
select ltrim(firstname) as First_Name from employeedetail;

-- To display Gender as M/f
SELECT FirstName, CASE WHEN Gender = 'Male' THEN 'M'
WHEN Gender = 'Female' THEN 'F' END AS Gender
FROM EmployeeDetail;

-- to select first name from "EmployeeDetail" table prifixed with "Hello "
Select 'Hello' + firstName from employeedetail;

-- to get employee details whose Salary greater than or less than--
select *from employeedetail where salary  > 40000;
select * from employeedetail where salary < 40000;
select * from employeedetail where salary between 50000 and 70000;
SELECT TOP (1) Salary FROM
(SELECT TOP (2) Salary FROM EmployeeDetail ORDER BY Salary DESC) ORDER BY Salary ASC;

-- Group by-- 

-- query to get the department and department wise total(sum) salary-- 
SELECT Department, SUM(Salary) AS Total_Salary FROM EmployeeDetail GROUP BY Department;

SELECT Department, SUM(Salary) AS Total_Salary FROM EmployeeDetail
GROUP BY Department ORDER BY SUM(Salary) ASC;

SELECT Department, SUM(Salary) AS Total_Salary FROM EmployeeDetail
GROUP BY Department ORDER BY SUM(Salary) DESC;

SELECT Department, COUNT(*) AS Dept_Counts, SUM(Salary) AS Total_Salary FROM EmployeeDetail
GROUP BY Department;

SELECT Department, AVG(Salary) AS Average_Salary FROM EmployeeDetail
GROUP BY Department ORDER BY AVG(Salary) ASC;

SELECT Department, MAX(Salary) AS Average_Salary FROM EmployeeDetail
GROUP BY Department ORDER BY MAX(Salary) ASC;

SELECT Department, MIN(Salary) AS Average_Salary FROM EmployeeDetail
GROUP BY Department ORDER BY MIN(Salary) ASC;

desc projectdetail;
select * from projectdetail;

Select ProjectName,Count(*) NoofEmp from ProjectDetail GROUP BY ProjectName
HAVING COUNT(*)> 1;

-- joins-- 
SELECT FirstName, ProjectName FROM EmployeeDetail INNER JOIN ProjectDetail;
SELECT FirstName, ISNULL(ProjectName,'-No Project Assigned') FROM EmployeeDetail LEFT OUTER JOIN ProjectDetail on EmployeeDetail ORDER BY FirstName;
SELECT FirstName,ProjectName FROM EmployeeDetail  JOIN Projectdetail ON Employeedetail ORDER BY FirstName;
