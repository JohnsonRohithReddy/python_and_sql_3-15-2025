/*
3. Given the table schemas below, write a query to print the company_code, founder 
name, total number of lead managers, total number of senior managers, total 
number of managers, and total number of employees. Order your output by 
ascending company_code.
Note:
• The tables may contain duplicate records.
• The company_code is string, so the sorting should not be numeric. For example, if 
the company_codes are C_1, C_2, and C_10, then the ascending company_codes 
will be C_1, C_10, and C_2.
The following tables contain company data:
Company: The company_code is the code of the company and founder is the 
founder of the company.
Lead_Manager: The lead_manager_code is the code of the lead manager, and the 
company_code is the code of the working company.
Senior_Manager: The senior_manager_code is the code of the senior manager, the 
lead_manager_code is the code of its lead manager, and the company_code is the 
code of the working company.
Manager: The manager_code is the code of the manager, the senior_manager_code 
is the code of its senior manager, the lead_manager_code is the code of its lead 
manager, and the company_code is the code of the working company.
Employee: The employee_code is the code of the employee, the manager_code is 
the code of its manager, the senior_manager_code is the code of its senior manager, 
the lead_manager_code is the code of its lead manager, and the company_code is 
the code of the working company.
Sample Input
Company Table:
Lead_Manager Table:
Senior_Manager Table:
Manager Table: 
Employee Table: 
Sample Output
C1 Monika 1 2 1 2
C2 Samantha 1 1 2 2
Explanation
In company C1, the only lead manager is LM1. There are two senior managers, SM1 and 
SM2, under LM1. There is one manager, M1, under senior manager SM1. There are two 
employees, E1 and E2, under manager M1.
In company C2, the only lead manager is LM2. There is one senior manager, SM3, under 
LM2. There are two managers, M2 and M3, under senior manager SM3. There is one 
employee, E3, under manager M2, and another employee, E4, under manager, M3.*/


create or replace database assignemnt;

create or replace table ASSIGNEMNT.PUBLIC.company (
company_code varchar,
founder varchar
);

create or replace table ASSIGNEMNT.PUBLIC.lead_manager (
lead_manager_code varchar,
company_code varchar
);

create or replace table ASSIGNEMNT.PUBLIC.Senior_manager (
senior_manager_code varchar,
lead_manager_code varchar,
company_code varchar
);

create or replace table ASSIGNEMNT.PUBLIC.Manager (
manager_code varchar,
senior_manager_code varchar,
lead_manager_code varchar,
company_code varchar
);

create or replace table ASSIGNEMNT.PUBLIC.employee (
employee_code varchar,
manager_code varchar,
senior_manager_code varchar,
lead_manager_code varchar,
company_code varchar
);


insert into ASSIGNEMNT.PUBLIC.COMPANY values('c1','Monika'),('c2','Samantha');
select * from ASSIGNEMNT.PUBLIC.COMPANY;

insert into ASSIGNEMNT.PUBLIC.LEAD_MANAGER values('LM1','c1'),('LM2','c2');
select * from ASSIGNEMNT.PUBLIC.LEAD_MANAGER;

insert into ASSIGNEMNT.PUBLIC.SENIOR_MANAGER values ('SM1','LM1','c1'),('SM2','LM1','c1'),('SM3','LM2','c2');
select * from ASSIGNEMNT.PUBLIC.SENIOR_MANAGER;

insert into ASSIGNEMNT.PUBLIC.MANAGER values ('M1','SM1','LM1','c1'),('M2','SM3','LM2','c2'),('M3','SM3','LM2','c2');
select * from ASSIGNEMNT.PUBLIC.MANAGER;

insert into ASSIGNEMNT.PUBLIC.EMPLOYEE values('E1','M1','SM1','LM1','c1'),('E2','M1','SM1','LM1','c1'),('E3','M2','SM3','LM2','c2'),('E4','M3','SM3','LM2','c2');
select * from ASSIGNEMNT.PUBLIC.EMPLOYEE;


SELECT 
    c.company_code, 
    c.founder, 
    COUNT(DISTINCT lm.lead_manager_code) AS total_lead_managers,
    COUNT(DISTINCT sm.senior_manager_code) AS total_senior_managers,
    COUNT(DISTINCT m.manager_code) AS total_managers,
    COUNT(DISTINCT e.employee_code) AS total_employees
FROM Company c
LEFT JOIN Lead_Manager lm ON c.company_code = lm.company_code
LEFT JOIN Senior_Manager sm ON c.company_code = sm.company_code
LEFT JOIN Manager m ON c.company_code = m.company_code
LEFT JOIN Employee e ON c.company_code = e.company_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code;

SELECT 
    c.company_code, 
    c.founder, 
    (SELECT COUNT(DISTINCT lm.lead_manager_code) 
     FROM Lead_Manager lm 
     WHERE lm.company_code = c.company_code) AS total_lead_managers,
    (SELECT COUNT(DISTINCT sm.senior_manager_code) 
     FROM Senior_Manager sm 
     WHERE sm.company_code = c.company_code) AS total_senior_managers,
    (SELECT COUNT(DISTINCT m.manager_code) 
     FROM Manager m 
     WHERE m.company_code = c.company_code) AS total_managers,
    (SELECT COUNT(DISTINCT e.employee_code) 
     FROM Employee e 
     WHERE e.company_code = c.company_code) AS total_employees
FROM Company c
ORDER BY c.company_code;

INSERT INTO ASSIGNEMNT.PUBLIC.COMPANY VALUES
('C533', 'Eve'),
('C413', 'Bob'),
('C168', 'Charlie'),
('C495', 'Eve'),
('C764', 'Bob');

INSERT INTO ASSIGNEMNT.PUBLIC.LEAD_MANAGER VALUES
('LM610', 'C495'),
('LM028', 'C168'),
('LM511', 'C764'),
('LM118', 'C764'),
('LM236', 'C533'),
('LM705', 'C413'),
('LM756', 'C413'),
('LM121', 'C764'),
('LM200', 'C764'),
('LM589', 'C168');

INSERT INTO ASSIGNEMNT.PUBLIC.SENIOR_MANAGER VALUES
('SM739', 'LM705', 'C413'),
('SM012', 'LM121', 'C764'),
('SM449', 'LM121', 'C764'),
('SM421', 'LM200', 'C764'),
('SM230', 'LM236', 'C533'),
('SM660', 'LM705', 'C413'),
('SM788', 'LM118', 'C764'),
('SM363', 'LM511', 'C764'),
('SM248', 'LM118', 'C764'),
('SM282', 'LM200', 'C764'),
('SM135', 'LM028', 'C168'),
('SM535', 'LM610', 'C495'),
('SM060', 'LM028', 'C168'),
('SM523', 'LM028', 'C168'),
('SM953', 'LM118', 'C764');

INSERT INTO ASSIGNEMNT.PUBLIC.MANAGER VALUES
('M114', 'SM012', 'LM121', 'C764'),
('M293', 'SM421', 'LM200', 'C764'),
('M125', 'SM535', 'LM610', 'C495'),
('M029', 'SM135', 'LM028', 'C168'),
('M851', 'SM788', 'LM118', 'C764'),
('M165', 'SM060', 'LM028', 'C168'),
('M797', 'SM523', 'LM028', 'C168'),
('M422', 'SM248', 'LM118', 'C764'),
('M719', 'SM788', 'LM118', 'C764'),
('M935', 'SM135', 'LM028', 'C168'),
('M246', 'SM660', 'LM705', 'C413'),
('M719', 'SM248', 'LM118', 'C764'),
('M732', 'SM248', 'LM118', 'C764'),
('M129', 'SM060', 'LM028', 'C168'),
('M084', 'SM363', 'LM511', 'C764'),
('M930', 'SM660', 'LM705', 'C413'),
('M540', 'SM421', 'LM200', 'C764'),
('M621', 'SM953', 'LM118', 'C764'),
('M748', 'SM012', 'LM121', 'C764'),
('M682', 'SM523', 'LM028', 'C168');

INSERT INTO ASSIGNEMNT.PUBLIC.EMPLOYEE VALUES
('E035', 'M935', 'SM135', 'LM028', 'C168'),
('E069', 'M422', 'SM248', 'LM118', 'C764'),
('E573', 'M930', 'SM660', 'LM705', 'C413'),
('E613', 'M682', 'SM523', 'LM028', 'C168'),
('E445', 'M732', 'SM248', 'LM118', 'C764'),
('E581', 'M621', 'SM953', 'LM118', 'C764'),
('E184', 'M748', 'SM012', 'LM121', 'C764'),
('E734', 'M293', 'SM421', 'LM200', 'C764'),
('E975', 'M129', 'SM060', 'LM028', 'C168'),
('E258', 'M084', 'SM363', 'LM511', 'C764'),
('E762', 'M165', 'SM060', 'LM028', 'C168'),
('E523', 'M129', 'SM060', 'LM028', 'C168'),
('E231', 'M682', 'SM523', 'LM028', 'C168'),
('E530', 'M084', 'SM363', 'LM511', 'C764'),
('E223', 'M084', 'SM363', 'LM511', 'C764'),
('E891', 'M084', 'SM363', 'LM511', 'C764'),
('E164', 'M682', 'SM523', 'LM028', 'C168'),
('E344', 'M732', 'SM248', 'LM118', 'C764'),
('E799', 'M029', 'SM135', 'LM028', 'C168'),
('E423', 'M165', 'SM060', 'LM028', 'C168'),
('E137', 'M797', 'SM523', 'LM028', 'C168'),
('E691', 'M719', 'SM248', 'LM118', 'C764'),
('E976', 'M748', 'SM012', 'LM121', 'C764'),
('E648', 'M682', 'SM523', 'LM028', 'C168'),
('E364', 'M797', 'SM523', 'LM028', 'C168'),
('E881', 'M422', 'SM248', 'LM118', 'C764'),
('E881', 'M129', 'SM060', 'LM028', 'C168'),
('E709', 'M748', 'SM012', 'LM121', 'C764'),
('E412', 'M029', 'SM135', 'LM028', 'C168'),
('E093', 'M719', 'SM248', 'LM118', 'C764'),
('E373', 'M165', 'SM060', 'LM028', 'C168'),
('E784', 'M165', 'SM060', 'LM028', 'C168'),
('E811', 'M719', 'SM248', 'LM118', 'C764'),
('E066', 'M540', 'SM421', 'LM200', 'C764'),
('E165', 'M293', 'SM421', 'LM200', 'C764'),
('E528', 'M851', 'SM788', 'LM118', 'C764'),
('E938', 'M930', 'SM660', 'LM705', 'C413'),
('E515', 'M125', 'SM535', 'LM610', 'C495'),
('E740', 'M246', 'SM660', 'LM705', 'C413'),
('E057', 'M930', 'SM660', 'LM705', 'C413'),
('E741', 'M851', 'SM788', 'LM118', 'C764'),
('E241', 'M935', 'SM135', 'LM028', 'C168'),
('E408', 'M719', 'SM788', 'LM118', 'C764'),
('E722', 'M682', 'SM523', 'LM028', 'C168'),
('E616', 'M719', 'SM248', 'LM118', 'C764'),
('E350', 'M851', 'SM788', 'LM118', 'C764'),
('E967', 'M540', 'SM421', 'LM200', 'C764'),
('E073', 'M935', 'SM135', 'LM028', 'C168'),
('E141', 'M246', 'SM660', 'LM705', 'C413'),
('E246', 'M748', 'SM012', 'LM121', 'C764');

-- create departments and link to company data and import that and we do not want to display some deparments
-- print all the emplyeee with their managers ,lead managers and sr managers



create or replace table ASSIGNEMNT.PUBLIC.Departments (
    company_code varchar,
    department_name varchar,
    department_id number(38,0)
);


insert into ASSIGNEMNT.PUBLIC.Departments  values 
('C533', 'HR', 101),
('c1', 'Engineering', 102),
('C533', 'Finance', 301),  
('c2', 'Marketing', 254),
('C764', 'Legal', 211);   

SELECT 
    c.company_code,
    c.founder,
    d.department_id,
    d.department_name
FROM Departments d
JOIN ASSIGNEMNT.PUBLIC.Company c ON d.company_code = c.company_code
WHERE d.department_name in('HR','Marketing');


select e.*,c.founder from  ASSIGNEMNT.PUBLIC.employee e left join ASSIGNEMNT.PUBLIC.Company c
on e.company_code = c.company_code
order by company_code asc;
