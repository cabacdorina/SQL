declare
  r_emp employees%rowtype; --a record was created; it has the same data type as employees table
begin
  select * into r_emp from employees  where employee_id = '101';
  r_emp.salary := 0;
  r_emp.comission_pct := 0;
  insert into retired_employees values r_emp;
  --update retired_employees set row = r_emp where employee_id = '101';
end;
--we use a record when we want to copy a row of a table into another table, but with modification
--create table retired_employees as select * from employees where 1 = 2 ;
--creeaza un tabel cu asemenea cu employees, dar fara date 

--select * from retired_employees ;
--select * from employees;

