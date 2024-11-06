create table insert_test(
no1 number,
no2 number,
no3 number
);
desc insert_test;
insert into insert_test values(1,2,3);
select * from insert_test;
rename insert_test to it;
SELECT * FROM it;

insert into it values(1,2,null);
insert into it(no1,no2) values(1,2);
insert into it(no1,no2) values(11,'문자');
insert into it(no1,no2) values(111); --x
insert into it(no1,no2) values(111,222,333);--x

alter table it modify no3 number not null;
delete from it where no3 is null;

--dept 테이블 생성
create table dept
as 
select department_id, department_name, location_id from departments;
select * from dept;
