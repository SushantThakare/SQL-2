use MyB22New
print replicate('S',4)
print replicate('*',8)+'69'
print 'Sushant'+replicate(' ',50)+'Thakare'
print 'Sushant'+space(50)+'Thakare'
declare @Email varchar(50)='SushantThakare45@gmail.com'
print @Email
print replace(@Email,'.com','.co.in')
declare @Email1 varchar(50)='SushantThakare45@gmail.com' 
print patindex('%@%',@Email1)
print patindex ('%gmail%',@Email1)
go
declare @name varchar(40) = 'Sushant'
print @name
print patindex('%[0-9]%',@name)
set @name='Sushant007'
print patindex('%[0-9]%',@name)
go
declare @pin varchar(10) ='4454010045'
print @pin
print patindex('% [0-9] {6}%',@pin)
go
declare @mob varchar(50)='8518317269'
print @mob
print patindex('[9876]%',@mob)
--Stuff()
declare @adhar varchar(50)='533650285238'
print @adhar
print stuff(@adhar,2,8,'********')
go
declare @mail varchar(100)='sushantthakare45@gmail.com'
print @mail
print stuff(@mail,8,7,'*******')
go
declare @mail varchar(100)='sushantthakare45@gmail.com'
print @mail
print stuff(@mail,8,2,'*******') --here we need two no to be hidden but we are applying more no of *.
go
select getdate()
select CURRENT_TIMESTAMP
select SYSDATETIME()
print sysdatetime()
select GETUTCDATE()
select SYSUTCDATETIME()
go
create table Timetable
(
cdate date,
ctime time,
csmalldatetime smalldatetime,
cdatetime datetime,
cdatetime2 datetime2,
cdatetimeoffset datetimeoffset
)
insert into Timetable values(getdate(),getdate(),getdate(),getdate(),getdate(),getdate())
go
insert into Timetable values(getdate(),getdate(),getdate(),getdate(),sysdatetimeoffset(),sysdatetimeoffset())
go
select * from Timetable