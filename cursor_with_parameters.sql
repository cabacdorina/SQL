declare
  cursor c_emps(p_dep_id number) is select first_name, last_name, 
    department_name from employees join departments using(department_id)
    where department_id = p_dep_id;
  
  r_emp c_emps%rowtype;
begin
  --open c_emps(1);
  open c_emps(:b_dep_id);--:b_dep_id is a bind variable introduced on run
  fetch c_emps into r_emp;
  dbms_output.put_line('people from department '||r_emp.department_name||' are: ');
  close c_emps;
    
  --for i in c_emps(1) loop
  for i in c_emps(:b_dep_id) loop
    dbms_output.put_line(i.first_name||' '||i.last_name);
  end loop;
  dbms_output.put_line('');
  -------------another dep_id---------------
  
  open c_emps(:b_dep_id2);--:b_dep_id is a bind variable introduced on run
  fetch c_emps into r_emp;
  dbms_output.put_line('people from department '||r_emp.department_name||' are: ');
  close c_emps;
    
  for i in c_emps(:b_dep_id2) loop
    dbms_output.put_line(i.first_name||' '||i.last_name);
  end loop;
  
end;
--select * from departments;
--select * from employees;
--update EMPLOYEES set department_id = 2 where department_id = 5;
--update departments set department_name = 'Turism' where department_id = 2;