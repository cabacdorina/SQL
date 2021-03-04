create or replace type e_list is varray(20) of varchar2(45); --list is stored in DB
/
--drop type e_list;
/
declare
  --type e_list is varray(15) of varchar2(50);
  employees_list e_list := e_list(); --we created an array and initialised with an empty constructor
  idx number :=1;
begin
  for i in 100..101 loop
    --dbms_output.put_line('index: '||idx);
    employees_list.extend();
    select last_name into employees_list(idx) from EMPLOYEES where employee_id = i;
    idx := idx + 1;
  end loop;
  
  for x in 1..employees_list.count() loop
    dbms_output.put_line(employees_list(x));
  end loop;
end;

--select * from employees;