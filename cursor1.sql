declare
  cursor c_emps is select first_name,last_name from employees;--orice select poate fi, select cu join spre ex
  v_first_name employees.first_name%type;
  v_last_name employees.last_name%type;
begin
  open c_emps;
  
  fetch c_emps into v_first_name, v_last_name;
  dbms_output.put_line(v_first_name||' '||v_last_name);
  
  fetch c_emps into v_first_name, v_last_name;
  dbms_output.put_line(v_first_name||' '||v_last_name);
  
  fetch c_emps into v_first_name, v_last_name;
  dbms_output.put_line(v_first_name||' '||v_last_name);
  
  close c_emps;
end;

--select * from employees_copy;
--insert into EMPLOYEES(employee_id,first_name,last_name,email,hire_date,
--    job_id,salary,comission_pct,manager_id,department_id) 
--   values (102,'Ginghina','Marina','marina@email.com','28-JUL-20','Ghid',2000,null,5,5);