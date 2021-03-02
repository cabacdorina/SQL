declare
  type t_edu is record(primary_school varchar2(100), high_school varchar2(100), 
  university varchar2(100), uni_graduation_date date);
  
  type t_emp is record(first_name varchar(50), last_name employees.last_name%type,
          salary employees.salary%type not null default 1001, hire_date date,
          department_id employees.department_id%type,education t_edu, department departments%rowtype);
          
  r_emp t_emp; --declare the record which is of the type we created before
  --education, department are also records => we have 2 records nested in r_emp record
begin 
  select first_name, last_name, salary, hire_date, department_id into
    r_emp.first_name, r_emp.last_name, r_emp.salary, r_emp.hire_date, r_emp.department_id
    from employees where employee_id = '101';
  
  r_emp.education.high_school := 'high school';
  r_emp.education.university := 'IT university';
  r_emp.education.uni_graduation_date := '01-JUN-20';
  
  select * into r_emp.department from departments where department_id = r_emp.department_id;
    
  dbms_output.put_line(r_emp.first_name||' '||r_emp.last_name||' earns '||r_emp.salary||
  ' and was hired at: '|| r_emp.hire_date);
  
  dbms_output.put_line('She was graduted at '||r_emp.education.university||' at '||
  r_emp.education.uni_graduation_date);
  
  dbms_output.put_line('Her department name is: '|| r_emp.department.department_name);
end;


--select * from employees;

--CREATE TABLE departments (
--    department_id number,
--    department_name varchar2(30)
--);

--select * from departments;
--insert into   departments values(2, 'IT2');
