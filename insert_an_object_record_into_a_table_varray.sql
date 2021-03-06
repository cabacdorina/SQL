create or replace type t_phone_number as object(p_type varchar2(50),p_number varchar2(50));
--record cannot be created in schema
--objects can be created as schema level, and we can use them like records
--ex-> home: 444545, work:478452, mobile:41225444 -> p_type: home,work,mobile ...p_number: phone_number
/
create or replace type v_phone_numbers as varray(3) of t_phone_number; 
/
create table emps_with_phones (employee_id number, first_name varchar2(50), 
                                last_name varchar2(50), phone_number v_phone_numbers);
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
select e.first_name, e.last_name, p.p_type, p_number from emps_with_phones e, table(e.phone_number) p;
--we joined our table with the actual table, using table operator
--select * from emps_with_phones;
--drop table emps_with_phones;
--drop type v_phone_numbers;
--drop type t_phone_number;