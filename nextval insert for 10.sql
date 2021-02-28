set SERVEROUTPUT ON;

drop table employees_copy;
create table employees_copy as select * from employees;

select * from employees_copy;

create sequence employee_id_seq
start with 2 
increment by 1;

declare
  v_salary_increase number := 400;
begin
  for i in 1..10 loop
    insert into EMPLOYEES_COPY(employee_id,first_name,last_name,email,hire_date,
    job_id,salary) 
    values (employee_id_seq.nextval,'employee_id#'||employee_id_seq.nextval,'temp_emp','abc@xmail.com',sysdate,'IT_PROG',1000);
  
  end loop;
end;

--declare 
--  v_seq_num number;
--begin
--  
--  v_seq_num := employee_id_seq.nextval;
--  dbms_output.put_line(v_seq_num);
--end;