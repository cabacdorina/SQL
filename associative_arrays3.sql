--create table employees_salary_history as select * from employees where 1=2;
--alter table employees_salary_history add insert_date date;
--select * from employees_salary_history;
--/

declare
  type e_list is table of employees_salary_history%rowtype index by pls_integer;
  emp_list e_list;
  idx pls_integer;
begin
  for i in 100..101 loop
    select e.*,'01-JUN-2020' into emp_list(i) from employees e where employee_id=i;
  end loop;
  
  idx := emp_list.first;
  while idx is not null loop
    --emp_list(idx).salary := emp_list(idx).salary + emp_list(idx).salary*0.2;
    --insert into employees_salary_history values emp_list(idx);
    dbms_output.put_line(emp_list(idx).first_name||' '||emp_list(idx).last_name||
    ' salary: '||emp_list(idx).salary||' insert date:'||emp_list(idx).insert_date);
    idx:=emp_list.next(idx);
  end loop;

end;