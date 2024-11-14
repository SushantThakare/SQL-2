use MyB22New
select * from B22Student
--column level security
create view VwStudent
as 
Select * from B22Student
go
alter view VwStudent
as 
select RollNumber,Name,Gender,City from B22Student
select * from VwStudent
--Row level security
alter view VwStudent
as
select RollNumber,Name,Gender,City from B22Student where IsConfirmed=0
select * from VwStudent
insert into B22Student values(11,'Sakshi','Female','Ytl',22,30000,0)
go
select * from Student
select * from Trainers
go 
create view VwStudentTrainer
as
select s.RollNumber,s.Name as StudentName,T.Name as TrainerName,t.Experience
from Student s join Trainers t
on s.TrainerId = t.Id
select * from VwStudentTrainer
--insert/update/delete thorugh view
alter view vwStudent
as 
select * from B22Student
select * from vwStudent
go 
insert into vwStudent values(12,'Kshitij','Male','Nagpur',24,0,0)
go
select * from Student
select * from Trainers
go
alter view VwStudentTrainer
as
select s.id,s.Name as StudentName,T.Name as TrainerName,t.Experience
from Student s join Trainers t
on s.TrainerId = t.Id
select * from VwStudentTrainer
update VwStudentTrainer
set TrainerName='Usha'
where Id=1
select * from VwStudentTrainer
execute sp_help VwStudent
execute sp_helptext VwStudent
--With Encryption
alter view VwStudent
with Encryption
as 
Select * from B22Student
go
select * from VwStudent
go
--With Schemabinding
alter view VwStudent
with Schemabinding
as 
Select RollNumber,name,gender,city,age,PaidFees,IsConfirmed from dbo.B22Student
go
drop table B22Student


