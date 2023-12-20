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
