use MyB22New
create table Trainers (
Id int primary key,
Name varchar(50),
Experience varchar(50)
)
insert into Trainers values(1,'Vikul Sir',13),(2,'Usha Mam',3)
go
select Id,Name,Experience from Trainers

Create  Table Student(
RollNumber int primary key,
Name varchar(50) not null,
City varchar(50),
TrainerId int foreign key references Trainers(Id) 
)
insert into Student values(3,'Saurabh','Mumbai',1),(1,'Sushant','Ytl',1),(2,'Seth','Pune',2)
insert into Student values(4,'Bahu','Pune',null )
select * from Student
select TrainerId ,count(RollNumber) as total from Student group by TrainerId
go
Create table Product
(
Id int primary key identity(1,1),
Name varchar(50),
price int
)
insert into Product values('Mobile',10000),('TV',15000),('WashingMachine',20000)
go 
create table Sales
(
Id int primary key identity,
ProductId int foreign key references Product(Id),
Quantity int
)
insert into Sales values(3,1),(1,2),(2,1)
select * from Product
select * from Sales
--Product Names Which are sold
select Name from Product where Id in(1,2,3)
select distinct ProductId from Sales 
Select  Name from Product where Id in (select distinct ProductId from Sales ) 
Select Name from Product where Id not in (select distinct ProductId from Sales ) 
--Product Id and Total number of Quentity Sold
Select sum(Quantity) from Sales where Id=1
Select sum(Quantity) from Sales where Id=2
Select sum(Quantity) from Sales where Id=3
select Id,sum(Quantity) from Sales group by Id
go
select * from Product
select * from Sales
Select name from Product where Id in(1,2,3)
select distinct ProductId from Sales
Select name from Product where Id in(select distinct ProductId from Sales)
select name,price from product 
select  productId,Quantity from Sales
select ProductId,sum(Quantity) from Sales  group by ProductId
--product name,price,total quantity sold ex for corelated SubQuery
select Name,Price,(select sum(Quantity) from sales where ProductId = Product.Id) from Product 
select name,price,(select sum(Quantity) from sales) from Product
select Name,Price,(select sum(Quantity) from sales where ProductId = Product.Id) as SalesQuantity,
(select sum(Quantity)* Product.price from sales where ProductId=Product.Id) as SalesAmount
from Product 
--groupby ProductId with sold Quantity
select ProductId,sum(Quantity) from sales group by ProductId
--Declaring a variable
declare @name varchar(10) = 'Sushant'
print @name
set @name='Sumit'
print @name

declare @a int=10, @b int=10
print @a+@b
--Conditional Statement
if @a=@b 
begin
print 'Equal' 
end 
else 
begin
print'NotEqual'
end

--insert in product table if already not exits
if not exists (select Name from Product where Name='Mobile')
begin
insert into Product values('Mobile',20000)
end
else
begin 
print 'Product already exists'
end
alter table Product add AvailableQuantity int
select * from Product
insert  into product(AvailableQuantity) values(10),(20),(8)
delete from Product where Id in (5,6,7)
delete from Product where Id = 4
update product set AvailableQuantity = 10 where Id = 1
update product set AvailableQuantity = 20 where Id = 2
update product set AvailableQuantity = 8 where Id = 3
select * from Product
select * from Sales
--if exists(select AvailableQuantity from Product where Name ='Mobile' <= 10 )
--begin 
--insert into Sales values(1,9)
--end
--begin 
--print 'Out of stock'
--end

--IF not exists (SELECT Id
--           FROM Product 
--           WHERE Name = 'Mobile' AND AvailableQuantity <= 10)
--BEGIN
--    INSERT INTO Sales (ProductId, Quantity) 
--    VALUES (1, 10);
--END
--else 
--begin
--  PRINT 'Out of stock';
--end
delete from sales where id in(5,6,7,8)
--looping
declare @start int = 1
while @start <=5
begin
print 'Good Morning'
set @start = @start+1
end
declare @table int = 2
while @table <=20
begin
print @table
set @table = @table + 2
end

--inserting huge no of data in a table
select * from Product
declare @counter int = 4
while @counter <=100000
begin 
insert into Product(Name,price) values('Product' + cast(@counter as varchar(10)),@counter)
set @counter = @counter + 1
end