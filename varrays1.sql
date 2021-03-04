declare
  type e_list is varray(5) of varchar2(50);
  employees_list e_list;
begin
  employees_list := e_list('Ana','Joana','Vica','Rica');
  for i in 1..employees_list.count() loop
    DBMS_OUTPUT.PUT_LINE(employees_list(i));
  end loop;

--  for i in employees_list.first()..employees_list.last() loop
--    DBMS_OUTPUT.PUT_LINE(employees_list(i));
--  end loop;

--  for i in 1..5 loop
--    if employees_list.exists(i) then
--      DBMS_OUTPUT.PUT_LINE(employees_list(i));
--    end if;
--  end loop;

 --DBMS_OUTPUT.PUT_LINE(employees_list.limit()); 
 --we have 4 elements in our array, but its limit is 5, we can have maximum 5 elem in the array
end;