-------v4--more compact--but use a cursor -- v4 -- if you have to use ise clause more then 1 time----
--begin
--  --for i in cursor...-> no need to open and close cursor, fetch into automat. created record -> they are done automatically
--  for i in (select * from employees) loop
--    dbms_output.put_line(i.first_name||' '||i.last_name);
--  end loop;
--  
--end;
-----------------------------v3 - for i in cursor ---indicated to use------------------------
declare
  cursor c_emps is select * from employees;
begin
  --for i in cursor...-> no need to open and close cursor, fetch into automat. created record -> they are done automatically
  for i in c_emps loop
    dbms_output.put_line(i.first_name||' '||i.last_name);
  end loop;
  
end;
----------------------------v2-while loop---not recommended------------------
--declare
--  cursor c_emps is select * from employees;
--  r_emp c_emps%rowtype;
--begin
--  open c_emps;
--  
--  fetch c_emps into r_emp;--because cursor%found and cursor%not must be used after fetching  
--  while c_emps%found loop
--    dbms_output.put_line(r_emp.first_name||' '||r_emp.last_name);
--    fetch c_emps into r_emp;
--  end loop;
--  
--  close c_emps;
--end;
------------------------------v1-loop---------------------------------
--declare
--  cursor c_emps is select * from employees;
--  r_emp c_emps%rowtype;
--begin
--  open c_emps;
--  
--  loop
--    fetch c_emps into r_emp;
--    exit when c_emps%notfound;
--    dbms_output.put_line(r_emp.first_name||' '||r_emp.last_name);
--  end loop;
--  
--  close c_emps;
--end;