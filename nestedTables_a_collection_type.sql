declare
  type e_list is table of employees.last_name%type;
  emp_list e_list := e_list();
  idx pls_integer :=1;
begin
  for i in 100..101 loop
    emp_list.extend;
    select last_name into emp_list(idx) from employees where employee_id = i;
    idx:=idx+1;
  end loop;
  
  emp_list.extend;
  emp_list(3) := 'Marina';
  emp_list.delete(2);
  
  for i in 1..emp_list.last() loop
    if emp_list.exists(i) then
      dbms_output.put_line(emp_list(i));
    end if;
  end loop;
end;

--select * from employees;
--declare
--  type e_list is table of varchar2(50);
--  emp_list e_list := e_list();
--  idx pls_integer :=1;
--begin
--  emp_list := e_list('Lili','Lolo','Lulu');
--  emp_list.extend;
--  emp_list(4) := ('Lala');
--  
--  for i in 1..emp_list.count() loop
--    dbms_output.put_line(emp_list(i));
--  end loop;
--end;