use MyB22New
select * from Trainers
select * from Student
go
execute sp_help Trainers
insert into Trainers values(5,'Raju',15,'Hyd','Hyd')
select Id,Name,Experience from Trainers
--to copy Trainers data to temporary table
--step 1 :- Create temp table
create table #trainers
(
id int,
Name varchar(50),
Experience int
)
insert into #trainers
select Id,Name,Experience from Trainers
select * from #trainers
--Select into
select id ,name,Experience into #newtrainers from Trainers
select * from #trainers
select * into Student1 from Student
select * from Student1
select * into Student2 from Student1 where City = 'pune'
select * from Student2
--only scema without Copying records
Select * into Student4 from Student where 1<>1
select * from Student4

--for backuo in different database
create database B22_ArchivedDB
go
select * into B22_ArchivedDB.dbo.BackupStudent from Student
use B22_ArchivedDB
select * from BackupStudent
go
use MyB22New
declare @Name Varchar(50)='Sushant',@Id int = 10
--table variable runs in a batch
declare @Student table
(
Id int,
Name varchar(50),
City varchar(50)
)
insert into @Student values(1,'Sushant','Nagpur'),(2,'Akshay','Pune')
select * from @Student
insert into @Student
select RollNumber,Name,City from Student
select * from @Student


