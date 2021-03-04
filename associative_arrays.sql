declare
  type e_list is table of employees.last_name%type
  index by employees.email%type;--varchar2(50);
  --we put varchar2(50) ..it is a B-TREE behind, but to integer not
  emp_list e_list;
  idx employees.email%type;
  v_email employees.email%type;
  v_last_name employees.last_name%type;
begin
  for i in 100..101 loop
    select last_name, email into v_last_name,v_email from employees where employee_id = i ;
    emp_list(v_email) := v_last_name;
  end loop;
  
  idx := emp_list.first;
  while idx is not null loop
    dbms_output.put_line(emp_list(idx));
    idx:=emp_list.next(idx);
  end loop;
end;


--declare
--  type e_list is table of employees.last_name%type
--  index by pls_integer;
--  emp_list e_list;
--  idx pls_integer;
--begin
--  --associative arrays are not sequencial
--  emp_list(100):='Lolo';
--  emp_list(120):='Lulu';
--  
--  idx:=emp_list.first;
--  while idx is not null loop
--    --dbms_output.put_line(idx);
--    dbms_output.put_line(emp_list(idx));
--    idx := emp_list.next(idx);
--    --it returns the next index of the associative array,it  will be the greater one
--    --apar in ordinea inserarii, nu in ordinea cheilor, gen poate fi 120,100 ca si ordine chei
--  end loop;
--  
--end;

--declare
--  type e_list is table of employees.last_name%type
--  index by pls_integer; --its key will be pls_integer.... 
--  --we can put varchar2(50) ...if we have to go back and forward too much, because it is a B-TREE behing, but tu integer not
--  emp_list e_list;
--begin
--  for i in 100..101 loop
--    select last_name into emp_list(i) from employees where employee_id = i ;
--  end loop;
--  
--  for i in emp_list.first()..emp_list.last() loop
--    dbms_output.put_line(emp_list(i));
--    --dbms_output.put_line(i);
--  end loop;
--end;

--select * from employees;