
declare 
  --r_emp employees%rowtype;
  type t_emp is record (first_name VARCHAR2(50), last_name EMPLOYEES.LAST_NAME%type,
   salary employees.salary%type, hire_date date);
   
   r_emp t_emp;
begin
  --select first_name, last_name, salary, hire_date into r_emp from employees where employee_id='101';
  r_emp.first_name := 'Liliana';
  r_emp.salary := 2500;
  r_emp.hire_date := '01-JAN-20';
  dbms_output.put_line(r_emp.first_name||' '||r_emp.last_name|| ' earns: ' ||r_emp.salary||
  ' and was hired at: ' || r_emp.hire_date);
end;

--select * from employees;

