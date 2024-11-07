USE MyB22New
declare @table int =4
while @table<=40
begin 
print @table
set @table = @table+4
end
go
select * from Student
select * from Trainers
insert into Trainers values(3,'Kishore Sir',10)

insert into Student(RollNumber,Name,City,TrainerId) values(5,'Sagar','Nagpur',3),(1,'Sushant','Nagpur',1)
--primary key table=Trainers
-- foreign key table=Student
select name,city from Student
select name from Trainers
--inner join
select Student.Name as [Student Name],city,Trainers.Name as [Trainer Name] from Student inner join Trainers
on Student.TrainerId=Trainers.Id
--above query with table alias
select s.City as [Student Name] , City,t.Name as [Trainer Name]
from Student as s inner join Trainers as t
on s.TrainerId=t.Id

select *
from Student as s inner join Trainers as t
on s.TrainerId=t.Id

--left outrt join
select s.Name as [Student Name] ,t.Name as [Trainer Name]
from Student as s left outer join Trainers as t
on s.TrainerId = t.Id
--right outer join
select s.Name as [Student Name] ,t.Name as [Trainer Name]
from Student  s right outer join Trainers  t
on s.TrainerId= t.id

--full outer join
select s.Name as [Student Name] ,t.Name as [Trainer Name]
from Student s full outer join Trainers t 
on s.TrainerId=t.Id
--uncommon from left table
select *
from Student s left join Trainers t
on s.TrainerId=t.Id
where t.Id is null
--uncommon from right table
select *
from Student s right join Trainers t on s.TrainerId=t.Id
where s.RollNumber is null
select * from Student
select * from Trainers
go
insert into Trainers values(4,'Sudhakar Sharma',15)
insert into Student values (6,'Saurabh','Mumbai',null)
go
--uncommom from both the tables
select * from Student s full outer join Trainers t 
on s.TrainerId=t.Id where s.RollNumber is null or t.Id is null
--cross join
Select s.Name,t.Name from Student s cross join Trainers t 
create table t1
(
col1 varchar(10)
)
insert into t1 values('a'),('b'),('c')
create table t2
(
col1 varchar(10)
)
insert into t2 values('a'),('b'),('c'),('d'),('e')
select * from t1
select * from t2
go
select t1.col1,t2.col1 from t1 join t2 on t1.col1=t2.col1
go
select t1.col1,t2.col1 from t1 left join t2 on t1.col1=t2.col1
go
select t1.col1,t2.col1 from t1 right join t2 on t1.col1=t2.col1
go
select t1.col1,t2.col1 from t1 full outer join t2 on t1.col1=t2.col1
go
create table Course
(
Id int primary key identity ,
Name varchar(50),
Duration int,
TrainerId int foreign key references Trainers(Id)
)
insert into Course values('Dot Net',6,1),('Internship',1,2),('Front End',6,4)
select * from Student
select * from Trainers
select * from Course
--join for multiple table 
select s.Name as [Student Name] ,t.Name as [Trainer Name],c.Name as [Course Name]
from Student s join Trainers t on s.TrainerId = t.Id 
join Course c on c.TrainerId = t.Id
--for all student
select s.Name as [Student Name] ,t.Name as [Trainer Name],c.Name as [Course Name]
from Student s left join Trainers t on s.TrainerId = t.Id 
left join Course c on c.TrainerId = t.Id

select t.name as [Trainer Name] , count(s.RollNumber) as Total
from Student s join Trainers t on s.TrainerId = t.Id
group by t.name 