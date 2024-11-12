use MyB22New
select * from trainers
alter table Trainers add Location varchar(50) default 'Pune'
alter table Trainers
drop column Location
alter table Trainers add City varchar(50) not null default 'Pune'
go
create table MeansWear
(
Id int,
Name varchar(50)
)
insert into MeansWear values(1,'Shirt'),(2,'Shoes'),(3,'Pant')
go
create table WomensWear
(
Id int,
Name varchar(50)
)
insert into WomensWear values(1,'Skirt'),(2,'Shoes'),(3,'Top'),(4,'Kurti')
--union all
select Id , Name from MeansWear
union all
select Id,Name from WomensWear
go
--union 
select Id , Name from MeansWear
union 
select Id,Name from WomensWear
--Intersect
select Id , Name from MeansWear
intersect
select Id,Name from WomensWear
--except
select Id , Name from MeansWear
except
select Id,Name from WomensWear
go
select Id,Name from WomensWear
except
select Id , Name from MeansWear
drop table MeansWear
drop table WomensWear
go
go
create table MeansWear
(
Id int,
Name varchar(50),
Category varchar(50)
)
insert into MeansWear values(1,'Shirt','Casual'),(2,'Shoes','Formal'),(3,'Pant','Casual')
go
create table WomensWear
(
Id int,
Name varchar(50),
City varchar(50)
)
insert into WomensWear values(1,'Skirt','Mumbai'),(2,'Shoes','Pune'),(3,'Top','Mumbai'),(4,'Kurti','Pune')
go
select Id,Name,category,null as City from MeansWear
Union All
select Id,Name,null as category,City from WomensWear