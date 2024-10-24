use MyB22New
create table Trainers (
Id int primary key,
Name varchar(50),
Experience varchar(50)
)
insert into Trainers values(1,'Vikul Sir',13),(2,'Usha Mam',3)
go
select Id,Name,Experience from Trainers
drop table Student
--Foreign key 
Create  Table Student(
RollNumber int primary key,
Name varchar(50) not null,
City varchar(50),
TrainerId int foreign key references Trainers(Id) 
)
insert into Student values(3,'Saurabh','Mumbai',1),(1,'Sushant','Ytl',1),(2,'Seth','Pune',2)
insert into Student values(4,'Bahu','Pune',null )
select * from Student
select Id,Name,Experience from Trainers

--What happens if we try to delete records from Student table
delete from Student where RollNumber=3--gets deleted
--What happens if we try to delete records from Trainers table
delete from Trainers where Id =1--not possible
go
drop table Student
--Cascading Set null ex
go
Create  Table Student(
RollNumber int primary key,
Name varchar(50) not null,
City varchar(50),
TrainerId int foreign key references Trainers(Id) on delete set null
)
insert into Student values(3,'Saurabh','Mumbai',1),(1,'Sushant','Ytl',1),(2,'Seth','Pune',2)
insert into Student values(4,'Bahu','Pune',null )
select * from Student
select Id,Name,Experience from Trainers
--What happens if we try to delete records from Trainers table
delete from Trainers where Id =1--possible will set null 

drop table Student
--Cascading with Set Default
insert into Trainers values (1,'Vikul Sir',13)

go
go
Create  Table Student(
RollNumber int primary key,
Name varchar(50) not null,
City varchar(50),
TrainerId int default 2 foreign key references Trainers(Id) on delete set default
)
insert into Student values(3,'Saurabh','Mumbai',1),(1,'Sushant','Ytl',1),(2,'Seth','Pune',2)
insert into Student values(4,'Bahu','Pune',null )
select * from Student
select Id,Name,Experience from Trainers
--What happens if we try to delete records from Trainers table
delete from Trainers where Id =1--possible will set default value 2
go
--Cascading With Cascade
go
drop table Student
go
insert into Trainers values (1,'Vikul Sir',13)
go
Create  Table Student(
RollNumber int primary key,
Name varchar(50) not null,
City varchar(50),
TrainerId int foreign key references Trainers(Id) on delete  Cascade
)
insert into Student values(3,'Saurabh','Mumbai',1),(1,'Sushant','Ytl',1),(2,'Seth','Pune',2)
insert into Student values(4,'Bahu','Pune',null )
select * from Student
select Id,Name,Experience from Trainers
--What happens if we try to delete records from Trainers table
delete from Trainers where Id =1--deleted Primary key value (vikul sir id:-1) gets deleted and its foreign key constraints also gets deleted(Saurabh,Sushant)