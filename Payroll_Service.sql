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

-- UC10 Ability to make Terrisa as a part of sales and HR.
truncate table employee_payroll;
insert into employee_payroll
(name,gender,salary,start,employee_phone,address,department,basic_pay,deduction,Taxable_pay,income_pay,net_pay)
values('Terrisa','f',4500,'2018-01-14','7996456232','pune','hr',23000,2000,1000,1200,21000),
('mohit','M',4000,'2018-02-13','7996456233','pune','hr',23000,2000,1000,1200,21000),
('Terrisa','f',4500,'2018-01-14','7996456232','pune','sales',25000,2000,1000,1200,21000),
('sanket','M',5000,'2019-01-14','7996456234','mumbai','sales',25000,2000,1000,1200,21000),
('rohan','M',5500,'2017-01-14','7996456235','satara','sales',25000,2000,1000,1200,21000),
('pranali','f',4500,'2018-01-13','7996456236','banglore','hr',23000,2000,1000,1200,21000); 

-- UC11 implement the Er diagram into payroll database service. Used normalization and divided the table.
drop table employee_payroll;

create table employee_info
(
basic_pay int,
deduction int,
Taxable_pay int,
income_pay int,
net_pay int,
dept_id int not null primary key
);
select * from employee_info;
select * from employee_payroll;
insert into employee_info (basic_pay,deduction,Taxable_pay,income_pay,net_pay,dept_id)
values(23000,2000,1000,1200,21000,1),
(25000,2200,1100,1250,21000,2);

-- table employee payroll
create table employee_payroll
(
id int unsigned not null  auto_increment primary key ,
name varchar(150) not null,
gender varchar(255),
salary double not null,
start date not null,
employee_phone varchar(255),
address varchar(255),
dept_id int,
foreign key(dept_id) references employee_info(dept_id)
);

insert into employee_payroll
(name,gender,salary,start,employee_phone,address,dept_id)
values
('Terrisa','f',4500,'2018-01-14','7996456232','pune',1),
('mohit','M',4000,'2018-02-13','7996456233','pune',1),
('Terrisa','f',4500,'2018-01-14','7996456232','pune',2),
('sanket','M',5000,'2019-01-14','7996456234','mumbai',2),
('rohan','M',5500,'2017-01-14','7996456235','satara',2),
('pranali','f',4500,'2018-01-13','7996456236','banglore',1);