create or replace trigger prevent_high_salary 
  before insert or update of salary on employees
  for each row
  when (new.salary >50000)
begin
  raise_application_error(-20001,'A salary cannot be higher then 50000');
end;