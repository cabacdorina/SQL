set SERVEROUTPUT ON;

CREATE TABLE employees (
  employee_id number not null,
  first_name varchar(20),
  last_name  varchar(25) not null,
  email varchar2(25) not null,
  phone_number varchar(20),
  hire_date  date not null,
  job_id  varchar(10) not null,
  salary number(8,2),
  comission_pct number(2,2),
  manager_id number(6),
  department_id number(4)
);

insert into employees values(100,'Cabac', 'Dorina', 'dorina@yahoo.com','023','27-FEB-2020',1,3000,null,1,1);
insert into employees values(101,'Ginghina', 'Marina', 'marina@yahoo.com','024','25-FEB-2020',1,2500,null,1,1);
insert into employees values(102,'Bodnar', 'Ana', 'ana@yahoo.com','023','27-FEB-2020',1,2600,null,1,1);
select * from employees;

UPDATE employees
SET salary = 3000
WHERE employee_id = 100;

-----------
update employees set salary=salary + 100;