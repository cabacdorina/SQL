--cursor attributes:cursor_name%isopen,cursor_name%rowcount(ret nr of fetches),cursor_name%found,cursor_name%notfound
declare
  cursor c_emps is select * from employees;
  r_emp c_emps%rowtype;
begin
  if not c_emps%isopen then
    open c_emps;
    dbms_output.put_line('the cursor was just opened');
  end if;
  
  fetch c_emps into r_emp;
  fetch c_emps into r_emp;
  dbms_output.put_line(c_emps%rowcount);
  dbms_output.put_line('');
  close c_emps;
  
--  for cursor_ in c_emps loop
--    dbms_output.put_line(cursor_.last_name);
--  end loop;
  open c_emps;
  loop 
    fetch c_emps into r_emp;
    exit when c_emps%notfound or c_emps%rowcount>2;
    dbms_output.put_line(c_emps%rowcount||' '||r_emp.last_name);
  end loop;
  close c_emps;
    
end;