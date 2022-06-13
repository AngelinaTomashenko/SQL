
-- Создать таблицу salary
-- - id. Serial  primary key,
-- - monthly_salary. Int, not null
-- Наполнить таблицу salary 15 строками:

create table salary(
	id serial primary key,
	monthly_salary int not null
);

insert into salary(monthly_salary)
values (1000),
	   (1100),
	   (1200),
	   (1300),
	   (1400),
	   (1500),
	   (1600),
	   (1700),
	   (1800),
	   (2000),
	   (2100),
	   (2200),
	   (2300),
	   (2400),
	   (3500);
	   
	  select * from salary;
	  

-- Создать таблицу employees
--- id. serial,  primary key,
--- employee_name. Varchar(50), not null
--Наполнить таблицу employee 70 строками.
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
	   ('Sasha');
	   
	  select * from employees;
	
	 
	 -- Создать таблицу employee_salary
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique
-- - salary_id. Int, not null
-- Наполнить таблицу employee_salary 40 строками:
-- - в 10 строк из 40 вставить несуществующие employee_id

	 create table employees_salary (
	id serial primary key,
	id_employee int unique not null,
	id_salary int not null
);

insert into employees_salary  (id_employee, id_salary)
values (1, 7),
	   (2, 2),
	   (3, 3),
	   (4, 5),
	   (5, 7),
	   (6, 3),
	   (7, 2),
	   (8, 3),
	   (9, 5),
	   (10, 6),
	   (11, 7),
	   (12, 8),
	   (13, 9),
	   (14, 10),
	   (15, 11),
	   (16, 12),
	   (17, 13),
	   (18, 14),
	   (19, 15),
	   (20, 7),
	   (21, 1),
	   (22, 2),
	   (23, 3),
	   (24, 5),
	   (25, 7),
	   (26, 8),
	   (27, 2),
	   (28, 3),
	   (29, 5),
	   (30, 7),
	   (65, 8),
	   (89, 8),
	   (78, 15),
	   (63, 14),
	   (45, 13),
	   (76, 12),
	   (44, 3),
	   (55, 11),
	   (60, 12),
	   (50, 6);
	  
	select * from employees_salary; 


-- Создать таблицу roles
-- - id. Serial  primary key,
-- - role_name. int, not null, unique
-- Поменять тип столба role_name с int на varchar(30)
-- Наполнить таблицу roles 20 строками

create table roles (
id serial primary key,
role_name int unique not null 
);

alter table roles
alter column role_name type varchar(30);

insert into roles (role_name)
values ('Junior_Python_developer'),
		('Middle_Python_developer'),
		('Senior_Python_developer'),
		('Junior_Java_developer'),
		('Middle_Java_developer'),
		('Senior_Java_developer'),
		('Junior_JavaScript_developer'),
		('Middle_JavaScript_developer'),
		('Senior_JavaScript_developer'),
		('Junior_ManualQA_engineer'),
		('Middle_ManualQA_engineer'),
		('Senior_ManualQA_engineer'),
		('Project Manager'),
		('Designer'),
		('HR'),
		('CEO'),
		('Sales manager'),
		('Junior_AutomationQA_engineer'),
		('Middle_AutomationQA_engineer'),
		('Senior_AutomationQA_engineer');
		
			
select * from roles;

-- Создать таблицу roles_employee
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- - role_id. Int, not null (внешний ключ для таблицы roles, поле id)
-- Наполнить таблицу roles_employee 40 строками:

create table roles_employees (
id serial primary key,
id_employee int unique not null,
id_role int not null

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

-- Общая таблица
create table employees_info as
select employees.employee_name, roles.role_name, salary.monthly_salary from employees
join roles_employees on employees.id = roles_employees.id_employee
join roles on roles_employees.id_role= roles.id
join employees_salary on employees.id = employees_salary.id_employee
join salary on employees_salary.id_salary = salary.id;

select * from employees_info;

--  1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employees.employee_name, salary.monthly_salary from employees
join employees_salary on employees.id = employees_salary.id_employee
join salary on employees_salary.id_salary = salary.id;
-- или 2-й вариант 
select employee_name, monthly_salary from employees_info;

-- 2. Вывести всех работников у которых ЗП меньше 2000
select employees.employee_name, salary.monthly_salary from employees
join employees_salary on employees.id = employees_salary.id_employee
join salary on employees_salary.id_salary = salary.id
where monthly_salary < 2000;
-- или 2-й вариант 
select employee_name, monthly_salary from employees_info
where monthly_salary < 2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select  salary.monthly_salary, employees_salary.id_employee  from employees_salary
right join salary on employees_salary.id_salary = salary.id
where id_employee is null  ;
order by salary.monthly_salary;

--4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select  salary.monthly_salary, employees_salary.id_employee  from employees_salary
right join salary on employees_salary.id_salary = salary.id 
where id_employee is null and monthly_salary < 2000
order by salary.monthly_salary;

--5. Найти всех работников кому не начислена ЗП.
select  employees.employee_name, employees_salary.id_salary  from employees_salary
right join employees on employees_salary.id_employee  = employees.id 
where id_salary  is null 
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

 -- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select * from employees_info
where monthly_salary between 1700 and 2300
Order by employee_name, role_name, monthly_salary;

 -- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select * from employees_info
where monthly_salary < 2300
Order by employee_name, role_name, monthly_salary;

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select * from employees_info
where monthly_salary = 1100 or monthly_salary =1500 or monthly_salary =2000
Order by employee_name, role_name, monthly_salary;

