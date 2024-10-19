use MyB22New
--Creating Table
Create table Students
(
RollNumber int,
Name varchar(50),
Age int,
IsConfirmed bit,
)
--inserting records
insert into Students(RollNumber,Name,Age,IsConfirmed) values(1,'Sushant',24,1)
--select records 
select RollNumber,Name,Age,IsConfirmed from Students

insert into Students values (2,'Seth',25,1)
go
--edit or update records
update Students set IsConfirmed = 0--for all
update Students set IsConfirmed=1 where RollNumber = 1 --for Rollnumber 1 only
update Students set  Name='Vrushabh',IsConfirmed=1 where RollNumber= 2
select RollNumber,Name,Age,IsConfirmed from Students
go

--delete Records
delete from Students where RollNumber = 2
select RollNumber,Name,Age,IsConfirmed from Students

go 
--multiple records insert
insert into Students values(2,'Seth',26,1),
(3,'Sumit',25,1),(4,'Sagar',27,0),(5,'Saurabh',23,0)
select RollNumber,Name,Age,IsConfirmed from Students
go

--adding a new coloumn 
alter table Students add Gender varchar(50)
insert into Students values(6,'Shraddha',24,1,'Female')
select RollNumber,Name,Age,IsConfirmed,Gender,[Email Adress]from Students
go

update Students set Gender='Male'
update Students set Gender =  'Female' where RollNumber=6
go
--alter column name
alter table Students alter column Name varchar(100)
go
alter table Students add [Email Adress] varchar(50)
update Students set [Email Adress]= 'v@v' where RollNumber=2