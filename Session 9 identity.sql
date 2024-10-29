use MyB22New
select Age,count(1) as Total from B22Student group by Age having count(1) >1
select * from B22Student
create table ConfirmedStudents(
RollNumber int primary key,
Name varchar(50) not null,
City varchar(50),
)
insert into ConfirmedStudents values(1,'Sushant','Ytl'),(2,'Seth','Pune'),(3,'Akshay','Mumbai')
select RollNumber,Name,City from ConfirmedStudents
drop table ConfirmedStudents
--Identity
create table ConfirmedStudents(
RollNumber int primary key identity(1,1),
Name varchar(50) not null,
City varchar(50),
)
insert into ConfirmedStudents values('Sushant','Ytl'),('Seth','Pune'),('Akshay','Mumbai')
select RollNumber,Name,City from ConfirmedStudents
delete from ConfirmedStudents where RollNumber=2
--insert identity value explicitly
set identity_insert ConfirmedStudents on
insert into ConfirmedStudents (RollNumber,Name,City)values (2,'Seth','Pune')
select RollNumber,Name,City from ConfirmedStudents
--Turn off identity insert
set identity_insert ConfirmedStudents off
insert into ConfirmedStudents values('Saurabh','Pune')
select RollNumber,Name,City from ConfirmedStudents
delete from ConfirmedStudents
insert into ConfirmedStudents values('Sagar','Nagpur')
--reset identity values after deleting  all records
delete from ConfirmedStudents
--to reset  identity  values  into its original seed and increment
dbcc checkident (ConfirmedStudents,reseed,0)
insert into ConfirmedStudents values('Sagar','Nagpur')
select RollNumber,Name,City from ConfirmedStudents
go
Drop table ConfirmedStudents

create table ConfirmedStudents(
RollNumber int primary key identity(1,1),
Name varchar(50) not null,
City varchar(50),
)
insert into ConfirmedStudents values('Sagar','Nagpur')--1 RollNumber
go
--How to get last generated identity column value?
select SCOPE_IDENTITY()
select @@IDENTITY
select IDENT_CURRENT('ConfirmedStudents')
--session 1
select SCOPE_IDENTITY()
select @@IDENTITY
select IDENT_CURRENT('ConfirmedStudents')