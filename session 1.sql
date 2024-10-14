--Creating Database
create database B22new
--Renaming database
execute sp_renamedb B22new,MyB22New 
--Deleting Database
drop database MyB22New 
--backupdatabase
backup database  MyB22New to disk='D:\Sql New\MyB22NewBackup.bak'
--formate database
drop database  MyB22New
--Restore Databse
restore database  MyB22New from disk ='D:\Sql New\MyB22NewBackup.bak'
--Differential Backup
backup database  MyB22New to disk='D:\Sql New\MyB22NewBackup.bak' with differential