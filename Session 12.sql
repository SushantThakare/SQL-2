use MyB22New
select * from Student
select * from Trainers

select * from Student s join trainers t
on s.trainerid = t.id

select * from Student s cross join trainers t
create table Employee
(
Id int primary key identity,
Name varchar(20),
ManagerId int
)
insert into Employee values('ajay',2),('Usha',4),('Ashish',4),('Vikul',null),('Kajal',2),('Akshay',3)
go
select id,name,managerid from Employee 
go
Select e.Name as EmpName, m.Name as ManagerName from Employee e left join Employee m on e.ManagerId=m.Id
go
select m.Name as ManagerName, count(e.id) as Id
from Employee e  join Employee m on e.ManagerId=m.Id
group by m.Name 
order by Id desc


--meaning of null
go
--Isnull
Select e.Name as EmpName, ISNULL(m.Name,'Owner') as ManagerName 
from Employee e left join Employee m on e.ManagerId=m.Id
go
create table person
(
Id int primary key identity,
Name varchar(50),
Gender varchar(10),
City varchar(20),
PrimaryEmail varchar(100),
AlternateEmail varchar(100)
)
insert into person values ('Sushant','Male','Nagpur','s@s',null),('Seth','Male','Pune',null,'s1@s1'),
('Mahima','Female','Mumbai','m@m',null),('Neha','Female','Pune','n@n',null),('Saurabh','Male','Ytl',null,null)
select * from person
--coalesce function
Select Name,PrimaryEmail,AlternateEmail,coalesce(PrimaryEmail,AlternateEmail,'No Email Provided') from  person
--case 
Select e.Name as EmpName, (case when m.name is null then 'OWNER' else e.name end) as ManagerName 
from Employee e left join Employee m on e.ManagerId=m.Id
go
declare @DayName int = 9
select case 
when @DayName = 1 then 'Sunday'
when @DayName = 2 then 'Monday'
when @DayName = 3 then 'Tuesday'
when @DayName = 4 then 'Wednesday'
when @DayName = 5 then 'Thrusday'
when @DayName = 6 then 'Fridayday'
when @DayName = 7 then 'Saturday'
else 'In Valid Day Number '
end
go
select Name,Gender,(Case when Gender='Male' then 'M' when Gender='Female' then 'F' else 'Invalid' end)as Gender,
City from person
go
select Name, City as previous ,
(case when City='Mumbai' then 'Pune' when City ='Pune' then 'Mumbai' else City end) as new
from person