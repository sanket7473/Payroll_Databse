Welcome to the payroll service 
-- UC1 create a database, use database, and show all the databases.
create database payroll_service;
show databases;
use payroll_service;


-- UC2 create employee payroll table in the payroll service database

create table employee_payroll
(
id int unsigned not null auto_increment,
name varchar(150) not null,
salary double not null,
start date not null,
primary key(id)

);


-- UC3 Ability to create employee payroll in the payroll service
insert into employee_payroll (name,salary,start) values('sanket',2000,'2017-01-02'),
('mohit',2005,'2018-01-03'),
('vinay',2003,'2019-11-13');

-- UC4 Ability to retrieve all the employee payroll data
select * from employee_payroll; 

-- UC5 Ability to retrieve salary data for a particular employee who have joined in a particular data range
select salary from employee_payroll where name='sanket';
select * from employee_payroll
where start between cast('2018-01-03' as date) and date(now());

-- UC6 Ability to add gender to employee table
alter table employee_payroll add gender char(1) After name;

-- UC7 Ability to find sum of salary
select sum(salary) from employee_payroll
where gender ='F' group by gender;

-- UC_8 Extend  a payroll data to store employee information like employee phone address and department.
alter table employee_payroll
add employee_phone varchar(255),
add address varchar(255) default 'mumbai',
add department varchar(255) not null;
select * from employee_payroll;

-- uc9 ability to extend payroll data to store basic pay,deduction,texiable pay,Income tax and net pay.
alter table employee_payroll
add  basic_pay int,
add deduction int,
add Taxable_pay int,
add income_pay int,
add net_pay int;
select * from employee_payroll;
