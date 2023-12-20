Welcome to the payroll service 
//UC1 create a database, use database, and show all the databases.
create database payroll_service;
show databases;
use payroll_service;


//UC2 create employee payroll table in the payroll service database

create table employee_payroll
(
id int unsigned not null auto_increment,
name varchar(150) not null,
salary double not null,
start date not null,
primary key(id)

);


//UC3 Ability to create employee payroll in the payroll service
insert into employee_payroll (name,salary,start) values('sanket',2000,'2017-01-02'),
('mohit',2005,'2018-01-03'),
('vinay',2003,'2019-11-13');

//UC4 Ability to retrieve all the employee payroll data
select * from employee_payroll; 

