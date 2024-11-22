use MyB22New
go
print getdate()
print eomonth(getdate())--gives last date of month.
go
--EOMONTH ( start_date [, month_to_add ] )
--DATEFROMPARTS ( year, month, day )
--TIMEFROMPARTS ( hour, minute, seconds, fractions, precision )
--SMALLDATETIMEFROMPARTS ( year, month, day, hour, minute )
--DATETIMEFROMPARTS ( year, month, day, hour, minute, seconds,milliseconds )
--DATETIME2FROMPARTS ( year, month, day, hour, minute, seconds, fractions, precision )
--DATETIMEOFFSETFROMPARTS ( year, month, day, hour, minute, seconds, fractions, hour_offset, minute_offset, precision )
go
select DATEFROMPARTS(2024,4,4)
select timefromparts(11,12,34,234,4)
--scalar function
create table InternStudent
(
Id int primary key identity,
FirstName varchar(50),
LastName varchar(50)
)
insert into InternStudent values('Sushant','Thakare'),('Vrushabh','Kawale'),
('Akshay','Shinde'),('Avi','Marodkar')
select * from InternStudent
select Id,FirstName,LastName,(FirstName + ' ' + LastName) as FullName from InternStudent
go
select Id,FirstName,LastName,(convert(varchar(10),Id) + '.' + FirstName + ' ' + LastName) as FullName from InternStudent
go
create function fnGetFullName()
returns varchar(200)
as
begin
declare @FullName varchar(200)
select @FullName =(cast(Id as varchar(10)) + '. ' + FirstName + ' '+ LastName)
from InternStudent
return @FullName
end
--using function fullname
select Id,FirstName,LastName,dbo.fnGetFullName() as FullName from InternStudent
go --here problem
--we can write parameter to a function
alter function fnGetFullName(@Id int,@FirstName varchar(50),@LastName varchar(50))
returns varchar(200)
as
begin
declare @FullName varchar(200)
--select @FullName =(cast(Id as varchar(10)) + '. ' + FirstName + ' '+ LastName)
--from InternStudent
set @FullName =(cast(@Id as varchar(10)) + '. ' + @FirstName + ' '+ @LastName)
return upper(@FullName)
end
--corrected
select Id,FirstName,LastName,dbo.fnGetFullName(id,FirstName,LastName) as FullName from InternStudent
go 

alter table InternStudent add DOB date
select * from InternStudent
--function which takes dob and return age
alter function fnAge(@DOB date)
returns varchar(100)
as 
begin
declare @Today date = getdate()
declare @Year int,@Months int,@tempdob date=@DOB,@days int
set @Year = DATEDIFF(YEAR,@DOB,@Today)-
( 
case
when month(@DOB) > MONTH(@Today) or MONTH(@DOB) = MONTH(@Today)
     and day(@DOB)>Day(@Today) then 1
	 else 0
	 end
)
set @tempdob =dateadd(year,@Year,@tempdob)
set @Months = DATEDIFF(MONTH,@tempdob,@Today)-
(
CASE
when day(@tempdob)> day(@today) then 1 else 0
end
)
set @tempdob = DATEADD(MONTH,@Months,@tempdob)
set @days = DATEDIFF(day,@tempdob,@Today)
return cast(@Year as varchar(10)) + 'Year' + cast(@Months as varchar(10)) + ' Months'
+cast(@days as varchar(5)) + ' Days'
end
go
select Id,FirstName,LastName,DOB,dbo.fnAge(DOB)as age from InternStudent
go
select dbo.fnAge('1999-10-21')