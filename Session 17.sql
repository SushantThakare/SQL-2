use MyB22New
select * from B22Student -- for this it creates new execution plan everytime.
select * from B22Student where City='pune'-- for this it creates new execution plan everytime.
--for Store Procedures
--creates execution plan onece
--next time onwards it useses same execution plan
--Ascii
select ascii(1)
select ascii('a')
select ascii('A')
declare @alpha int = 65
while (@alpha <= 90)
begin
print char(@alpha)
set @alpha = @alpha+1
end
--upper lower
declare @name varchar(20)='Sushant'
print @name
print upper(@name)
print lower(@name)
go
select name from B22Student
select name,upper(name) as nameInUpper from B22Student
select name,lower(name) as NameInLower from B22Student
--Ltrim() Rtrim() trim()
declare @name varchar(50)='     Sushant' 
print @name
print ltrim(@name)
go
declare @name1 varchar(50)='Sushant         '
print @name1
print rtrim(@name1)
go
declare @name2 varchar(50)='     Sushant       '
print @name2
print trim(@name2)
--len(),reverse()
declare @name  varchar(50)='     Sushant       '
declare @name1  varchar(50)='Sushant'
print len(@name)
print reverse(@name1)
select name,reverse(name) as ReverseName,len(name) as NumberOfChar from B22Student
order by NumberOfChar 
go
declare @name1  varchar(50)='Sushant'
print left(@name1,2)
print right(@name1,3)
go
declare @mobile char(14)='+91 9518317269'
print @mobile
print right(@mobile,10)
-- name starts with m
Select * from B22Student where name like 'm%'
--without using like
select * from B22Student where left(name,1)='m'
select * from B22Student where right(name,1)='a'

--charindex
declare @name varchar(50)='Sushant'
print @name
print charindex('h',@name)
print charindex('a',@name)

declare @num varchar(50) = '9518317269'
print @num
print charindex('8',@num)

declare @Email varchar(100) ='sus@hant'
print @Email
print charindex('@',@Email)
if charindex('@',@Email) != 0
print 'Valid Email'
else
print 'Invalid Email'
declare @Email1 varchar(100) ='sushant@gmail.com'
print @Email1
print substring(@Email1,1,charindex('@',@Email1)-1)
print substring (@Email1,charindex('@',@Email1)+1,len(@Email1)-charindex('@',@Email1))
--print substring(@Email,1,7)
--print substring (@Email,9,17)
go
declare @Email2 varchar(100)='Shifabano143@gmail.com'
print @Email2
print substring(@Email2,1,charindex('@',@Email2)-1)
print substring (@Email2,charindex('@',@Email2)+1,len(@Email2)-charindex('@',@Email2))
go
create table #Student
(
Name varchar(20),
Email varchar(100)
)
insert into #Student values('Sushant','Sushant@gmail.com'),
('Seth','Seth@yahoo.com'),('Saurabh','saurabh007@gmail.com'),
('Sagar','Sagar@rediffmail.com')
select * from #Student
--domain name along with users
select Email,
substring(Email,CHARINDEX('@',Email)+1,len(Email)-charindex('@',Email)) as
DomainName
from #Student
select substring(Email,CHARINDEX('@',Email)+1,len(Email)-charindex('@',Email)) as
DomainName, count(name) as total from #Student
group by substring(Email,CHARINDEX('@',Email)+1,len(Email)-charindex('@',Email)) 
go
--to seperate name and surname
declare @fullname varchar(50)='Sushant Thakare'
print @fullname
print substring(@fullname,1,charindex(' ',@fullname)-1)
print substring(@fullname,charindex(' ',@fullname)+1,len(@fullname)-
charindex(' ',@fullname))
go
declare @name varchar(50)='Sushant Thakare'
print @name
print substring(@name,1,charindex(' ',@name)-1)
print substring(@name,charindex(' ',@name)+1,len(@name)-charindex(' ',@name))
go



