declare
  type e_type is record(first_name EMPLOYEES.FIRST_NAME%type, 
  last_name EMPLOYEES.LAST_NAME%type,email EMPLOYEES.EMAIL%type);--tip pt record
  --e_type ...gen tip pt recorduri ce vor fi continute de o colectie de elemente
  
  type e_list is table of e_type
  index by varchar2(50);--tip pt lista..zic ca e o lista de recorduri
  
  emp_list e_list;
  idx varchar2(50);
begin
  for i in 100..101 loop
    select FIRST_NAME,LAST_NAME, EMAIL into emp_list(i) from employees where employee_id = i ;
  end loop;
  --emp_list.delete(100,102); --delets elements in this interval
  
  idx := emp_list.last; --parcurgere in ordine inversa
  while idx is not null loop
    dbms_output.put_line(emp_list(idx).last_name|| ' idx: '||idx);
    idx:=emp_list.prior(idx); --prior = precedentul
  end loop;
end;

--declare
--
--  type e_type is record(first_name EMPLOYEES.FIRST_NAME%type, 
--  last_name EMPLOYEES.LAST_NAME%type,email EMPLOYEES.EMAIL%type);--tip pt record
--  --e_type ...gen tip pt recorduri ce vor fi continute de o colectie de elemente
--  
--  type e_list is table of e_type
--  index by varchar2(50);--tip pt lista..zic ca e o lista de recorduri
--  
--  emp_list e_list;
--  idx varchar2(50);
--begin
--  for i in 100..101 loop
--    select FIRST_NAME,LAST_NAME, EMAIL into emp_list(i) from employees where employee_id = i ;
--  end loop;
--  --emp_list.delete(100,102); --delets elements in this interval
--  
--  idx := emp_list.first;
--  while idx is not null loop
--    dbms_output.put_line(emp_list(idx).last_name|| ' idx: '||idx);
--    idx:=emp_list.next(idx);
--  end loop;
--end;
--/////////////////////////
--declare
--  type e_list is table of employees%rowtype
--  index by varchar2(50);
--  
--  emp_list e_list;
--  idx varchar2(50);
--begin
--  for i in 100..101 loop
--    select * into emp_list(i) from employees where employee_id = i ;
--  end loop;
--  
--  idx := emp_list.first;
--  while idx is not null loop
--    dbms_output.put_line(emp_list(idx).last_name|| ' idx: '||idx);
--    idx:=emp_list.next(idx);
--  end loop;
--end;