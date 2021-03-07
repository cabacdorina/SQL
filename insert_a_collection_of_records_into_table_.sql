create or replace type t_phone_number as object(p_type varchar2(50),p_number varchar2(50));
--record cannot be created in schema
--objects can be created as schema level, and we can use them like records
--ex-> home: 444545, work:478452, mobile:41225444 -> p_type: home,work,mobile ...p_number: phone_number
/
create or replace type v_phone_numbers as table of t_phone_number; 
/
create table emps_with_phones (employee_id number, first_name varchar2(50), 
                                last_name varchar2(50), phone_number v_phone_numbers)
                                NESTED TABLE phone_number STORE AS phone_numbers_table;
/

insert into emps_with_phones values(10,'Ana',
                          'Bodnar',v_phone_numbers(t_phone_number('HOME','111.111.111'),
                                                   t_phone_number('WORK','222.222.222'),
                                                   t_phone_number('MOBILE','555.555.555')
                                                   )
                                    );
/
insert into emps_with_phones values(11,'Marina',
                                    'Ginghina',v_phone_numbers(t_phone_number('HOME','1.111.111'),
                                                   t_phone_number('WORK','2.222.222')
                                                   )
                                    );
/
insert into emps_with_phones values(12,'Lili',
                          'Mili',v_phone_numbers(t_phone_number('HOME', '1.9.111'),
                                                 t_phone_number('WORK', '2.8.222'),
                                                 t_phone_number('MOBILE','2.9.222'),
                                                 t_phone_number('FAX',   '2.8.222')
                                                )
                                    );
/
select e.first_name, e.last_name, p.p_type, p_number from emps_with_phones e, table(e.phone_number) p;
/
--update emps_with_phones set phone_number = v_phone_numbers(t_phone_number('HOME','5.1.1'),
--                                                   t_phone_number('WORK','2.7.9')) where employee_id=11;
/
declare
  p_num v_phone_numbers;
begin
  select phone_number into p_num from emps_with_phones where employee_id = 11;
  p_num.extend;--extend p_num to be able to add our new value
  p_num(3) := t_phone_number('FAX','1.1.1');
  update emps_with_phones set phone_number = p_num where employee_id=11;
  --acest update e mai ok, deoarece pe langa datele existente mai adaugam una, fara sa modificam pe cele existente intamplator
end;

--we joined our table with the actual table, using table operator
--select * from emps_with_phones;
--drop table emps_with_phones;
--drop type v_phone_numbers;
--drop type t_phone_number;