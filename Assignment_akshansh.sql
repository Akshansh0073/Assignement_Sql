create table EmployeeDetail (EmployeeID int, FirstName varchar(max), LastName varchar(max),
Salary int, Department varchar(max), Gender varchar(max))

create table ProjectDetail (ProjectDetailID int, EmployeeDetailID int, ProjectName varchar(max))

select * from EmployeeDetail
select * from ProjectDetail

select e.FirstName + ' ' + e.LastName as 'EmployeeName', p.ProjectName as 'ProjectName' from EmployeeDetail e
join ProjectDetail p on e.EmployeeID = p.EmployeeDetailID order by e.FirstName

--2 ?
select e.FirstName + ' ' + e.LastName as 'EmployeeName', p.ProjectName as 'ProjectName' from EmployeeDetail e
inner join ProjectDetail p on (e.EmployeeID <> p.EmployeeDetailID) order by e.FirstName

--3?
select  p.ProjectName as 'ProjectName', e.FirstName + ' ' + e.LastName as 'EmployeeName'  from EmployeeDetail e
Right join ProjectDetail p on p.EmployeeDetailID = e.EmployeeID order by e.FirstName

--4?
select  e.FirstName + ' ' + e.LastName as 'EmployeeName', p.ProjectName as 'ProjectName'  from EmployeeDetail e
full join ProjectDetail p on p.EmployeeDetailID = e.EmployeeID



--Assignment 2
create table Emp (EMPLOYEE_ID int, FIRST_NAME varchar(max),  LAST_NAME varchar(max),
 EMAIL varchar(max), PHONE_NUMBER varchar(max), HIRE_DATE date, JOB_ID varchar(max), SALARY int,
 COMMISSION_PCT varchar(max),  MANAGER_ID int, DEPARTMENT_ID int)
 
 create table Department (DEPARTMENT_ID int, DEPARTMENT_NAME varchar(max), MANAGER_ID int, LOCATION_ID int)

 create table Location (LOCATION_ID int, STREET_ADDRESS varchar(max), POSTAL_CODE varchar(max), CITY varchar(max),
 STATE_PROVINCE varchar(max), COUNTRY_ID varchar(max))

 create table JobGrade (GRADE_LEVEL varchar(max), LOWEST_SAL int, HIGHEST_SAL int)


 select * from Emp
 select * from Department
 select * from Location
 select * from JobGrade

 --1?
 select e.First_Name 'FirstName',e.Last_Name 'LastName',d.DEPARTMENT_ID 'DEPARTMENT_ID', d.DEPARTMENT_NAME 'DEPARTMENT_NAME'
 from Emp e inner join Department d on e.DEPARTMENT_ID = d.DEPARTMENT_ID

 --2? 2-	write a SQL query to find the first name, last name, department_name, city, and state province for each employee.

 select e.First_Name 'FirstName',e.Last_Name 'LastName', d.DEPARTMENT_NAME 'DEPARTMENT_NAME', l.CITY 'CITY', l.STATE_PROVINCE
 'STATE_PROVINCE' from Emp e inner join Department d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
inner join Location l on l.LOCATION_ID = d.LOCATION_ID

--3	 write a SQL query to find the first name, last name, salary, and job grade for all employees.
select e.First_Name 'FirstName',e.Last_Name 'LastName', e.SALARY 'Salary', j.GRADE_LEVEL 'JG' from Emp e
join JobGrade j on e.SALARY > j.LOWEST_SAL and e.SALARY <= j.HIGHEST_SAL

--4 ?4-	write a SQL query to find all those employees who work in department ID 80 or 40. Return first name, last name, department number and department name.
select e.First_Name 'FirstName',e.Last_Name 'LastName', e.DEPARTMENT_ID 'DEPARTMENT_ID', d.DEPARTMENT_NAME 'DEPARTMENT_NAME'
from Emp e join Department d on e.DEPARTMENT_ID = d.DEPARTMENT_ID where e.DEPARTMENT_ID >=40 and e.DEPARTMENT_ID<=80