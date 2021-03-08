declare 
  cursor c_emps is select first_name,last_name from employees;--orice select poate fi, select cu join spre ex
  r_emp c_emps%rowtype;
begin
  open c_emps;
  
  fetch c_emps into r_emp.first_name, r_emp.last_name;
  dbms_output.put_line(r_emp.first_name||' '||r_emp.last_name);
  
  fetch c_emps into r_emp.first_name, r_emp.last_name;
  dbms_output.put_line(r_emp.first_name||' '||r_emp.last_name);
  
  fetch c_emps into r_emp.first_name, r_emp.last_name;
  dbms_output.put_line(r_emp.first_name||' '||r_emp.last_name);
    
  close c_emps;
end;
---------------------------v1, most efficient------------------------------
--declare 
--  r_emp employees%rowtype;
--  cursor c_emps is select first_name,last_name from employees;--orice select poate fi, select cu join spre ex
-- 
--begin
--  open c_emps;
--  
--  fetch c_emps into r_emp.first_name, r_emp.last_name;
--  dbms_output.put_line(r_emp.first_name||' '||r_emp.last_name);
--  
--  fetch c_emps into r_emp.first_name, r_emp.last_name;
--  dbms_output.put_line(r_emp.first_name||' '||r_emp.last_name);
--  
--  fetch c_emps into r_emp.first_name, r_emp.last_name;
--  dbms_output.put_line(r_emp.first_name||' '||r_emp.last_name);
--    
--  close c_emps;
--end;
---------------------------v2------------------------------
--declare
--  type t_emp is record ( v_first_name employees.first_name%type,
--                             v_last_name employees.last_name%type); 
--  r_emp t_emp;
--  cursor c_emps is select first_name,last_name from employees;--orice select poate fi, select cu join spre ex
-- 
--begin
--  open c_emps;
--  
--  fetch c_emps into r_emp;
--  dbms_output.put_line(r_emp.v_first_name||' '||r_emp.v_last_name);
--  
--  fetch c_emps into r_emp;
--  dbms_output.put_line(r_emp.v_first_name||' '||r_emp.v_last_name);
--  
--  fetch c_emps into r_emp;
--  dbms_output.put_line(r_emp.v_first_name||' '||r_emp.v_last_name);
--  
--  close c_emps;
--end;
---------------------------v3------------------------------
