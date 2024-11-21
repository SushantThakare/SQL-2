use MyB22New
--isdate
select GETDATE()
print isdate(GETDATE())--1
print isdate('1990-2-11')--1
print isdate('2')--0 because this is not a date
print isdate('2023-2-31')--0 because there is no 31 date in feb
go
print getdate()
print day(getdate())
print month(getdate())
print year(getdate())
--datename(datepart,inputdate)
print datename(day,getdate())
print datename(month,getdate())
print datename(year,getdate())
print datename(dayofyear,getdate())--gives 261
print datename(weekday,getdate())
print datename(tzoffset,sysdatetimeoffset())
print datename(q,getdate())
--datepart()
print datepart(day,getdate())
print datepart(month,getdate())
print datepart(year,getdate())
--datepart() vs datename()
--datename() returns string output
--datepart() returns int output
print datename(month,getdate())--September
print datepart(month,getdate())--9
print datename(year,getdate())--'2024'
print datepart(year,getdate())--2024
print datename(weekday,getdate())--tuesday
print datepart(weekday,getdate())--2
--dateadd()
print getdate()
print dateadd(day,3,getdate())
print dateadd(month,3,getdate())
print dateadd(year,3,getdate())
print dateadd(year,-25,getdate())
go
declare @Dob date='1999-10-21',@Today date=getdate()
print datediff(year,@Dob,@Today)
print datediff(month,@Dob,@Today)
print datediff(day,@Dob,@Today)
--cast
select id,name from Employee
select id,'CGT' + cast(Id as Varchar(5)) as CGTID from Employee
select id,'CGT' + convert(Varchar(5),Id) as CGTID from Employee
go
--convert() has third style parameter,which is very usefull for date formatting.
go
select getdate()--2024-09-17 16:45:23.050
select convert(date,getdate())--2024-09-17
go 
--third style parameter of convert
select convert(varchar(50),getdate(),100)--Sep 17 2024  4:48PM
select convert(varchar(50),getdate(),101)--09/17/2024
select convert(varchar(50),getdate(),102)--2024.09.17
--abs()
print abs(-10)
--ceiling()
print ceiling(14.5)--will return big number
print ceiling(-12.6)
--floor()
print floor(18.9)
print floor(-18.1)
--square
print square(16)
--Squareroot
print sqrt(16)
print sqrt(145)
--power
print power(2,8)--2 to the power 8
--round it rounds the no
print round(456.768,2)
--rand()
print rand()
go
declare @start int = 1
while @start <=10
begin
print floor(rand() * 100)
set @start = @start+1
end
--to make rand() as deterministic function if we provided a seed value
print rand(10)