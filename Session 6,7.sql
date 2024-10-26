use MyB22New

create table B22Student(
RollNumber int primary key,
Name varchar(50),
Gender varchar(50),
City varchar(50),
Age int,
PaidFees int,
IsConfirmed bit
)
insert into B22Student values (1,'Sushant','Male','Ytl',24,50000,1),
(2,'Setth','Male','Darwha',26,20000,1),
(3,'Saurabh','Male','Pune',23,0,0),
(4,'Sumit','Male','Mumbai',25,20000,1),
(5,'Sushant','Male','Ytl',27,0,0)
--with top
select top 2*  from B22Student
select 'S' as Name , 1 As rollnumber
insert into B22Student values (6,'Sushant','Male','Ytl',24,50000,1)
select Name , PaidFees,IsConfirmed from B22Student
--with distinct
select distinct Name , PaidFees,IsConfirmed from B22Student
Select distinct * from B22Student
select RollNumber,Name as [Student Name],Gender,City as CurrentCity from B22Student
where Gender='Male' and Age=23

select * from B22Student where Age != 23
select * from B22Student where Age >25
insert into B22Student values (7,'Mahima','Female','Ytl',24,50000,1)
insert into B22Student values (8,'Shifa','Female','Nagpur',22,40000,1)
insert into B22Student values (9,'Roshni','Female','Mumbai',24,30000,1)
select * from B22Student where Age >22 and Gender='Female'
select * from B22Student where Age >22 or Gender='male'
select * from B22Student where RollNumber = 1 and RollNumber = 2 and RollNumber = 3 
--Between And
select * from B22Student where PaidFees  between  30000 and 50000
select * from B22Student where PaidFees not between  30000 and 50000 and PaidFees !=0
Select * from B22Student  where Age in(22,24,27)
Select * from B22Student  where Age not in(22,24,27)
--Like Operator
--Starts with sh
Select * from B22Student  where Name like 'sh%'
--ends with t
Select * from B22Student  where Name like '%t'
--In between sh
Select * from B22Student  where Name like '%sh%'
--Second Charecter to be u
Select * from B22Student  where Name like '_u%'
-- Either h or r in between names
Select * from B22Student  where Name like '%[m,r]%'
