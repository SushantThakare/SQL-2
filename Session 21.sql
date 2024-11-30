use MyB22New
go
--inline function
create function fnInlineStudent()
returns table
as
return(select * from Student)
go
select * from fnInlineStudent()
go
alter function fnInlineStudent(@Gender varchar(20))
returns table
as
return(select * from B22Student where Gender=@Gender)
go
select * from fnInlineStudent('Male')
select * from fnInlineStudent('Female')
--multi statement table values function
alter function fnMultiStudent()
returns @Student table (StudentRollNumber int,StudentName varchar(50),
Address varchar(100),Gender varchar(10))
as
begin
insert into @Student
select RollNumber,Name,City,Gender from B22Student
return
end
select * from fnMultiStudent()
--non unique non clustered index
create index ixStudentAge
on B22Student(Age)
Select name,age from B22Student where age = 19
select name,age from B22Student where age between 19 and 26
select age from B22Student order by age
go
select name,age from B22Student where age between 19 and 26 and Gender='Male'
go
create index ixStudentAgeGender
on B22Student(Age,Gender)
select Age,Gender from B22Student order by Age,Gender
go
--unique non clustered index
create unique index ixStuName
on B22Student(Name)
go--not possible
Select name from B22Student
--non unique clustered index
create clustered index ix_Student_Paidfees
on B22Student(paidfees desc)
select * from B22Student
--to drop index
drop index ix_Student_Paidfees on B22Student
--unique clusterd index
create unique clustered index ix_StudentRollNumber
on B22Student(Rollnumber)
exec sp_help B22Student
drop index ix_StudentRollNumber on B22Student