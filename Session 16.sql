use MyB22New
--Stored Procedures
--creating simple sp
create procedure usp_GetAllStudents
as
begin 
select * from B22Student
end
-- to call Sp
execute usp_GetAllStudents
--to alter sp
alter procedure usp_GetAllStudents
as
begin
select * from B22Student where Gender='female'
end
execute usp_GetAllStudents
insert into B22Student values(6,'Shraddha','Female','Mumbai',2,40000,1)
insert into B22Student values(7,'Shifa','Female','Ytl',1,50000,1)
insert into B22Student values(8,'Mahima','Female','Wardha',1,20000,0)
insert into B22Student values(9,'Roshni','Female','Nagpur',2,0,0)
update B22Student set Age = 23 where RollNumber=6
update B22Student set Age = 22 where RollNumber=7
update B22Student set Age = 25 where RollNumber=8
update B22Student set Age = 24 where RollNumber=9
--to drop sp
drop procedure usp_GetAllStudents
go
create proc usp_GetAllStudents
as
begin 
select * from B22Student
end
exec usp_GetAllStudents
--store procedure with parameter
create proc usp_GetAllStudentsGender
@gender varchar(10)
as
begin
select * from B22Student where Gender = @gender
end
go
execute usp_GetAllStudentsGender 'male' 
execute usp_GetAllStudentsGender 'female'
go

alter proc usp_GetAllStudentsGender
@gender varchar(10)
as
begin
if @gender= 'male' or  @gender='female'
begin
select * from B22Student where Gender = @gender
end
else
begin 
select * from B22Student
end
end
go
execute usp_GetAllStudentsGender 'male' 
execute usp_GetAllStudentsGender 'female'
execute usp_GetAllStudentsGender'all'
go
--To write multiple parameter With Sp
create proc usp_GetAllStudentsGenderAge
@gender varchar(7),@Age int
as 
begin
Select * from B22Student where Gender=@gender and Age = @Age 
end
execute usp_GetAllStudentsGenderAge 'male',23
go
alter proc usp_GetAllStudentsGenderAge
@gender varchar(10),@Age int
as 
begin
Select * from B22Student where Gender=@gender and Age >= @Age 
end
execute usp_GetAllStudentsGenderAge 'female',23
go
execute usp_GetAllStudentsGenderAge 23,'female'
-- Error converting data type varchar to int. sequence should be same
go
--to avoid these we can write :-
execute usp_GetAllStudentsGenderAge @age=24,@gender='Male'
go
create proc uspGetAllStudentNamebyRollNumber
@rollnumber int
as
begin
select name from B22Student where RollNumber =@rollnumber
end
execute uspGetAllStudentNamebyRollNumber 3
go

--alter proc uspGetAllStudentNamebyRollNumber
--@rollnumber int
--as
--begin
--declare @name varchar(50)
--select @name = name from B22Student where RollNumber =@rollnumber
--return @name --eroor in this line while execution
--end
--go
--declare @nm varchar(50)
--execute @nm=uspGetAllStudentNamebyRollNumber 1
--print @nm
--go this is not possible becuse return in sp return int value
--so we do above query with help of output parameter
go
alter proc uspGetAllStudentNamebyRollNumber
@rollnumber int,@Name varchar(50)output--towrite output is must
as
begin
select @Name = name from B22Student where RollNumber =@rollnumber
end
go
declare @nm varchar(50)
execute uspGetAllStudentNamebyRollNumber @RollNumber=1,@Name=@nm output --to write output is must
print @nm
go

go
alter proc uspGetAllStudentNamebyRollNumber
@rollnumber int,@Name varchar(50)output,@city varchar(50) output--towrite output is must
as
begin
select @Name = name,@city=City from B22Student where RollNumber =@rollnumber
end
go
declare @nm varchar(50),@ct varchar(30)
execute uspGetAllStudentNamebyRollNumber @RollNumber=1,@Name=@nm output,
@city = @ct output--to write output is must
print @nm print @ct
go

alter proc uspGetAllStudentNamebyRollNumber
@name varchar(50)
as
begin
declare @RollNumber int
select @RollNumber = RollNumber from B22Student where Name = @name
return @RollNumber
end
go
declare @rn int
execute @rn=uspGetAllStudentNamebyRollNumber 'Sushant'
print @rn
--optional parameter
alter proc usp_GetAllStudentsGenderAge
@gender varchar(10) = null,@Age int =null
as 
begin
Select * from B22Student where (Gender=@gender or @gender is null) and
(Age >= @Age or @age is null) 
end
execute usp_GetAllStudentsGenderAge 'female',23
execute usp_GetAllStudentsGenderAge 'female'
execute usp_GetAllStudentsGenderAge @age=25
go

--below query will not work 
----alter proc usp_GetAllStudentsGenderAge
----@gender varchar(10) = null,@Age int =null
----as 
----begin
----Select * from B22Student where
----(Gender=@gender or Gender is null) so here :-
----(Gender = @gender OR Gender IS NULL) checks if the Gender column matches the provided @gender parameter, or if the Gender column itself is NULL. This is not what you typically want. Instead of filtering based on the input parameter, this logic would include rows where the Gender value is NULL, which might not be the intended result. and
----(Age >= @Age or Age is null) so here :-(Age >= @Age OR Age IS NULL) follows the same logic as above but for the Age column. It would include rows where Age is NULL, which again, might not be intended.
----end
go

alter proc usp_GetAllStudentsGenderAge
@gender varchar(10) = null,@Age int =null
as 
begin
Select * from B22Student where (Gender=@gender or @gender is null) and
(Age >= @Age or @age is null) 
end
execute usp_GetAllStudentsGenderAge 'female',23
execute usp_GetAllStudentsGenderAge 'female'
execute usp_GetAllStudentsGenderAge @age=25

go
