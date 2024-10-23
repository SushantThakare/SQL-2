use MyB22New

select * from Students

update Students set [Email Adress]='S@S' where RollNumber=1
update Students set [Email Adress]='S@S' where RollNumber=3
update Students set [Email Adress]='S@S' where RollNumber=4
update Students set [Email Adress]='S@S' where RollNumber=5
go
insert into Students values(7,'Shifa',22,0,'Female','Sh@sh')
go
Select * from Students

create table Student (

RollNumber int,
Name Varchar(20),
Gender varchar(10),
Email varchar(50),
Age int,
City varchar(10),
Course varchar(10)
)
go
insert into Student values(1,'Sushant','Male','s@s',24,'Ytl','DotNet'),
(2,'Shifa','Female','sh@sh',22,'Ytl','DotNet'),
(3,'Seth','Male','se@se',26,'Ytl','DotNet'),
(4,'Roshni','Female','r@r',24,'Mumbai','DotNet'),
(5,'Sagar','Male','sa@sa',27,'Pune','Java')
insert into Student values(4,'Sus','Male','s@s',24,'Ytl','DotNet')
insert into Student( RollNumber,Gender,Email,Age,City,Course ) values(5,'Male','s@s',24,'Ytl','DotNet')
go
select RollNumber,Name,Gender,Email,Age,City,Course from Student
drop table Student
go

create table Student (

RollNumber int primary key,
Name Varchar(20) not null,
Gender varchar(10),
Email varchar(50),
Age int,
City varchar(10),
Course varchar(10)
)
go
insert into Student values(1,'Sushant','Male','s@s',24,'Ytl','DotNet'),
(2,'Shifa','Female','sh@sh',22,'Ytl','DotNet'),
(3,'Seth','Male','se@se',26,'Ytl','DotNet'),
(4,'Roshni','Female','r@r',24,'Mumbai','DotNet'),
(5,'Sagar','Male','sa@sa',27,'Pune','Java')
insert into Student values(6,'Sus','Male','s@s',24,'Ytl','DotNet')
insert into Student( RollNumber,Name,Gender,Email,Age,City,Course ) 
values(7,'Male','Vishal','s@s',24,'Ytl','DotNet')
go
go
select RollNumber,Name,Gender,Email,Age,City,Course from Student
go
drop table Student
go
create table Student (

RollNumber int primary key,
Name Varchar(20) not null,
Gender varchar(10),
Email varchar(50) unique ,
Age int,
City varchar(10),
Course varchar(10)
)
go
insert into Student values(1,'Sushant','Male','s@s',24,'Ytl','DotNet'),
(2,'Shifa','Female','sh@sh',22,'Ytl','DotNet'),
(3,'Seth','Male','se@se',26,'Ytl','DotNet'),
(4,'Roshni','Female','r@r',24,'Mumbai','DotNet'),
(5,'Sagar','Male','sa@sa',27,'Pune','Java')
insert into Student values(6,'Sus','Male','su@su',24,'Ytl','DotNet')
insert into Student( RollNumber,Name,Gender,Email,Age,City,Course ) 
values(7,'Male','Vishal','v@v',24,'Ytl','DotNet')
go
select RollNumber,Name,Gender,Email,Age,City,Course from Student
go
drop table Student
go
create table Student (

RollNumber int primary key,
Name Varchar(20) not null,
Gender varchar(10),
Email varchar(50) unique ,
Age int,
City varchar(10),
Course varchar(10) default 'DotNet'
)
go
insert into Student values(1,'Sushant','Male','s@s',24,'Ytl','DotNet'),
(2,'Shifa','Female','sh@sh',22,'Ytl','DotNet'),
(3,'Seth','Male','se@se',26,'Ytl','DotNet'),
(4,'Roshni','Female','r@r',24,'Mumbai','DotNet'),
(5,'Sagar','Male','sa@sa',27,'Pune','Java')
insert into Student values(6,'Sus','Male','su@su',24,'Ytl','DotNet')
insert into Student( RollNumber,Name,Gender,Email,Age,City) 
values(7,'Male','Vishal','v@v',24,'Ytl')
go
select RollNumber,Name,Gender,Email,Age,City,Course from Student
go
drop table Student
go
create table Student (

RollNumber int primary key,
Name Varchar(20) not null,
Gender varchar(10),
Email varchar(50) unique ,
Age int check (Age >=1 and Age <=150),
City varchar(10),
Course varchar(10) default 'DotNet'
)
go
insert into Student values(1,'Sushant','Male','s@s',24,'Ytl','DotNet'),
(2,'Shifa','Female','sh@sh',22,'Ytl','DotNet'),
(3,'Seth','Male','se@se',26,'Ytl','DotNet'),
(4,'Roshni','Female','r@r',24,'Mumbai','DotNet'),
(5,'Sagar','Male','sa@sa',27,'Pune','Java')
insert into Student values(6,'Sus','Male','su@su',24,'Ytl','DotNet')
insert into Student( RollNumber,Name,Gender,Email,Age,City) 
values(7,'Male','Vishal','v@v',24,'Ytl')
go
select RollNumber,Name,Gender,Email,Age,City,Course from Student
go
drop table Student
go
create table Student (

RollNumber int ,
Name Varchar(20) not null,
Gender varchar(10),
Email varchar(50) unique ,
Age int check (Age >=1 and Age <=150),
City varchar(10),
Course varchar(10) default 'DotNet'
primary key (RollNumber,Name)
)
go
insert into Student values(1,'Sushant','Male','s@s',24,'Ytl','DotNet'),
(2,'Shifa','Female','sh@sh',22,'Ytl','DotNet'),
(3,'Seth','Male','se@se',26,'Ytl','DotNet'),
(4,'Roshni','Female','r@r',24,'Mumbai','DotNet'),
(5,'Sagar','Male','sa@sa',27,'Pune','Java')
insert into Student values(6,'Sushant','Male','su@su',24,'Ytl','DotNet')
insert into Student( RollNumber,Name,Gender,Email,Age,City) 
values(7,'Male','Vishal','v@v',24,'Ytl')
go
select RollNumber,Name,Gender,Email,Age,City,Course from Student
go