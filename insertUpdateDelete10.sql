set SERVEROUTPUT ON;

create table employees_copy as select * from employees;

select * from employees_copy;

declare
  v_salary_increase number := 400;
begin
  for i in 2..11 loop
--    insert into EMPLOYEES_COPY(employee_id,first_name,last_name,email,hire_date,
--    job_id,salary) 
--    values (i,'employee_id#'||i,'temp_emp','abc@xmail.com',sysdate,'IT_PROG',1000);
  
--  update EMPLOYEES_COPY 
--    set salary = salary + v_salary_increase
--    where EMPLOYEE_ID = i;

  delete from employees_copy 
  where employee_id = i;
  end loop;
end;