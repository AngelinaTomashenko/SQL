create table salary(
	id serial primary key,
	monthly_salary int not null
);

insert into salary(id, monthly_salary)
values (default, 1000),
	   (default, 1100),
	   (default, 1200),
	   (default, 1300),
	   (default, 1400),
	   (default, 1500),
	   (default, 1600),
	   (default, 1700),
	   (default, 1800),
	   (default, 2000),
	   (default, 2100),
	   (default, 2200),
	   (default, 2300),
	   (default, 2400),
	   (default, 3500);

select * from salary;


create table employees(
	id serial primary key,
	employee_name varchar(50) not null
);

insert into employees(employee_name)
values ('Alex'),
	   ('Nina'),
	   ('Mark'),
	   ('Olga'),
	   ('Anna'),
	   ('Alex_4'),
	   ('Vika'),
	   ('Eva'),
	   ('Masha'),
	   ('Dasha'),
	   ('Lina'),
	   ('Olia'),
	   ('Dima'),
	   ('Alex'),
	   ('Nina'),
	   ('Mark'),
	   ('Olga'),
	   ('Anna'),
	   ('Alex_4'),
	   ('Vika'),
	   ('Eva'),
	   ('Masha'),
	   ('Dasha'),
	   ('Lina'),
	   ('Olia'),
	   ('Dima'),
	   ('Alex'),
	   ('Nina'),
	   ('Mark'),
	   ('Olga'),
	   ('Anna'),
	   ('Alex_4'),
	   ('Vika'),
	   ('Eva'),
	   ('Masha'),
	   ('Dasha'),
	   ('Lina'),
	   ('Olia'),
	   ('Dima'),
	   ('Dima');

select * from employees;


create table employees_salary (
	id serial primary key,
	id_employee int unique not null,
	id_salary int not null,
	foreign key (id_employee)
		references employees(id),
	foreign key (id_salary)
		references salary(id)
);

insert into employees_salary  (id_employee, id_salary)
values (1, 1),
	   (2, 2),
	   (3, 3),
	   (4, 5),
	   (5, 7),
	   (6, 1),
	   (7, 2),
	   (8, 3),
	   (9, 5),
	   (10, 7),
	   (11, 1),
	   (12, 2),
	   (13, 3),
	   (14, 5),
	   (15, 7),
	   (16, 1),
	   (17, 2),
	   (18, 3),
	   (19, 5),
	   (20, 7),
	   (21, 1),
	   (22, 2),
	   (23, 3),
	   (24, 5),
	   (25, 7),
	   (26, 1),
	   (27, 2),
	   (28, 3),
	   (29, 5),
	   (30, 7),
	   (31, 1),
	   (32, 3),
	   (33, 3),
	   (34, 5),
	   (35, 7),
	   (36, 1),
	   (37, 2),
	   (38, 3),
	   (39, 5),
	   (40, 7);
	  

select * from employees_salary;

create table roles (
id serial primary key,
role_name int unique not null 
);

alter table roles
alter column role_name type varchar(30);

insert into roles (id, role_name)
values (default, 'Junior_Python_developer'),
		(default, 'Middle_Python_developer'),
		(default, 'Senior_Python_developer'),
		(default, 'Junior_Java_developer'),
		(default, 'Middle_Java_developer'),
		(default, 'Senior_Java_developer'),
		(default, 'Junior_JavaScript_developer'),
		(default, 'Middle_JavaScript_developer'),
		(default, 'Senior_JavaScript_developer'),
		(default, 'Junior_ManualQA_engineer'),
		(default, 'Middle_ManualQA_engineer'),
		(default, 'Senior_ManualQA_engineer'),
		(default, 'Project Manager'),
		(default, 'Designer'),
		(default, 'HR'),
		(default, 'CEO'),
		(default, 'Sales manager'),
		(default, 'Junior_AutomationQA_engineer'),
		(default, 'Middle_AutomationQA_engineer'),
		(default, 'Senior_AutomationQA_engineer');
		
			
select * from roles;

create table roles_employees (
id serial primary key,
id_employee int unique not null,
id_role int not null,
foreign key (id_employee)
		references employees(id),
	foreign key (id_role)
		references roles(id)
);

insert into roles_employees (id_employee, id_role)
values (1,2),
	   (2,20),
       (3,5),
	   (4,20),
	   (5,12),
	   (6,13),
	   (7,2),
	   (8,18),
	   (9,8),
	   (10,1),
	   (11,9),
	   (12,6),
	   (13,11),
	   (14,16),
       (15,19),
	   (16,14),
	   (17,17),
	   (18,15),
	   (19,3),
	   (20,6),
	   (21,8),
	   (22,1),
	   (23,9),
	   (24,6),
	   (25,18),
	   (26,8),
	   (27,1),
	   (28,9),
	   (29,6),
	   (30,11),
	   (31,16),
       (32,19),
	   (33,14),
	   (34,17),
	   (35,15),
	   (36,3),
	   (37,6),
	   (38,8),
	   (39,1),
	   (40,9);
	   
select * from roles_employees;

-- HW Join 

create table employees_info as
select employees.employee_name, roles.role_name, salary.monthly_salary,  from employees
join roles_employees on employees.id = roles_employees.id_employee
join roles on roles_employees.id_role= roles.id
join employees_salary on employees.id = employees_salary.id_employee
join salary on employees_salary.id_salary = salary.id;

select * from employees_info;

--  1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employee_name, monthly_salary from employees_info;

-- 2. Вывести всех работников у которых ЗП меньше 1200.
select employee_name, monthly_salary from employees_info
where monthly_salary < 1200;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select  salary.monthly_salary, employees_salary.id_employee  from employees_salary
right join salary on employees_salary.id_salary = salary.id 
where id_employee is null 
order by salary.monthly_salary;

 --4. Вывести все зарплатные позиции  меньше 1300 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select  salary.monthly_salary, employees_salary.id_employee  from employees_salary
right join salary on employees_salary.id_salary = salary.id 
where id_employee is null and monthly_salary < 1300
order by salary.monthly_salary;

 --5. Найти всех работников кому не начислена ЗП.
select  employees.employee_name, employees_salary.id_salary  from employees_salary
right join employees on employees_salary.id_employee  = employees.id 
--where id_salary  is null 
order by employees.employee_name ;

 --6. Вывести всех работников с названиями их должности.
create table employees_roles_name as
select employees.employee_name, roles.role_name  from employees
join roles_employees on employees.id = roles_employees.id_employee
join roles on roles_employees.id_role= roles.id

select * from employees_roles_name;

-- 7. Вывести имена и должность только Java разработчиков.
select * from employees_roles_name
where role_name  like '%Java%';

-- 8. Вывести имена и должность только Python разработчиков
select * from employees_roles_name
where role_name  like '%Python%';

-- 9. Вывести имена и должность всех QA инженеров
select * from employees_roles_name
where role_name  like '%QA%';

-- 10. Вывести имена и должность ручных QA инженеров
select * from employees_roles_name
where role_name  like '%Manual%';

--  11. Вывести имена и должность автоматизаторов QA
select * from employees_roles_name
where role_name  like '%Automation%';

--12. Вывести имена и зарплаты Junior специалистов
select * from employees_info
where role_name  like '%Junior%';

 -- 13. Вывести имена и зарплаты Middle специалистов
select * from employees_info
where role_name  like '%Middle%';

-- 14. Вывести имена и зарплаты Senior специалистов
select * from employees_info
where role_name  like '%Senior%';

 --15. Вывести зарплаты Java разработчиков
select * from employees_info
where role_name  like '%Java%';

-- 16. Вывести зарплаты Python разработчиков
select * from employees_info
where role_name  like '%Python%';

 --17. Вывести имена и зарплаты Junior Python разработчиков
select * from employees_info
where role_name  like '%Junior_Python%';

 --18. Вывести имена и зарплаты Middle JS разработчиков
select * from employees_info
where role_name  like '%Middle_JavaScript%';
 
 -- 19. Вывести имена и зарплаты Senior Java разработчиков
select * from employees_info
where role_name  like '%Senior_JavaScript%';

 -- 20. Вывести зарплаты Junior QA инженеров
select * from employees_info
where role_name  like '%Junior%' and role_name  like '%QA%';

 -- 21. Вывести среднюю зарплату всех Junior специалистов
select AVG (monthly_salary) 
from employees_info
where role_name  like '%Junior%';

 -- 22. Вывести сумму зарплат JS разработчиков
select SUM (monthly_salary) 
from employees_info
where role_name  like '%JavaScript%';
 
 -- 23. Вывести минимальную ЗП QA инженеров
select MIN (monthly_salary) 
from employees_info
where role_name  like '%QA%';

-- 24. Вывести максимальную ЗП QA инженеров
select MAX (monthly_salary) 
from employees_info
where role_name  like '%QA%';

-- 25. Вывести количество QA инженеров
select COUNT (role_name) 
from employees_info
where role_name  like '%QA%';
 
 -- 26. Вывести количество Middle специалистов
select COUNT (role_name) 
from employees_info
where role_name  like '%Middle%';
 
-- 27. Вывести количество разработчиков
 select COUNT (role_name) 
from employees_info
where role_name  like '%developer%';

 -- 28. Вывести фонд (сумму) зарплаты разработчиков
select SUM (monthly_salary) 
from employees_info
where role_name  like '%developer%';
 
 -- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select * from employees_info Order by employee_name, role_name, monthly_salary;

 -- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1400 до 1600
select * from employees_info
where monthly_salary between 1400 and 1600
Order by employee_name, role_name, monthly_salary;

 -- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 1600
select * from employees_info
where monthly_salary < 1600
Order by employee_name, role_name, monthly_salary;

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1400, 1600
select * from employees_info
where monthly_salary = 1100 or monthly_salary =1400 or monthly_salary =1600
Order by employee_name, role_name, monthly_salary;
