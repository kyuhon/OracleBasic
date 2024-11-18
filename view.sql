-- view 생성하기 (테이블생성 복사하기 똑같음)
create view view_emp01
as
select employee_id, first_name, salary, department_id from emp_copy
where department_id = 10;

create view view_emp02
as
select employee_id, first_name, last_name, email, hire_date, job_id from emp_copy
where department_id = 10;

select * from view_emp01;
select * from view_emp02;
-- employees 복사해서 emp_copy
create table emp_copy
as
select * from employees;

select * from emp_copy;

-- view 제거하기
drop view view_emp01;

-- select
select * from view_emp01;
select * from emp_copy where employee_id = 200; -- 원본도 수정
-- view 수정하기
update view_emp01 set salary = 4500 where employee_id = 200;

-- data dictionary(user_tables, user_constraints, user_cons_columns, user_views, user_indexes)
select * from user_tables;
select * from user_constraints;
select * from user_cons_columns;
select * from user_views;
select * from user_indexes;

-- 가상뷰에 입력하기(가상테이블에 컬럼 4개 입력, 원본 10개인데 그 중에 not null 인데 가상테이블에 포함되어 있지 않으면)
insert into view_emp01 values(1000,'JDK',5000,50); --안됨
insert into view_emp02 values(1000,'jeoung','gunil','kyuhon7@naver.com',to_date('2020/01/01','yy/mm/dd'),'it_dev');
select * from view_emp02;
select * from emp_copy;
select * from user_constraints where table_name = 'emp_copy';
-- 실수로 view_emp02 생성할 때 where절에 department_id = 10 을
-- 설정해서 select * from view_emp02에 삽입은 됐지만 출력되지 않음

-- view 3 생성하기
create view view_emp03
as
select employee_id, first_name, last_name, email, hire_date, job_id from emp_copy;

select * from view_emp03 where employee_id = 1000;

insert into view_emp03 values(1000,'jeoung','gunil','kyuhon7@naver.com',to_date('2020/01/01','yy/mm/dd'),'it_dev');

select * from emp_copy where employee_id = 1000;

-- 가상뷰에서 삭제를 진행하기
delete from view_emp03 where employee_id = 1000;

-- 복합뷰 생성하기 (employees, departments) 두 개의 테이블에서 조인해서 새로운 가상테이블 만들기
create view view_emp_dep
as
select employee_id, first_name, salary, E.department_id, department_name , location_id
from employees E inner join departments D
on E.department_id = D.department_id
order by E.department_id desc;

select * from view_emp_dep;
select distinct department_id, department_name from view_emp_dep;
-- 부서명 it 연봉 평균, 최고값, 최저값을 구해라
select department_name, max(salary),min(salary) from view_emp_dep where department_name = 'IT' group by department_name;

-- rownum
select * from employees;
select rownum, department_id, first_name from employees where department_id = 100
order by first_name desc;
select rownum, department_id, first_name from employees where department_id = 100;

-- rownum 정렬하면 순서가 흐트러진것을 다시 순서적으로 보여주고 싶을때
select employee_id, first_name, hire_date from employees order by hire_date desc;

create view view_hiredate
as
select employee_id, first_name, hire_date from employees order by hire_date desc;

select rownum, employee_id, first_name, hire_date from view_hiredate where rownum = 4;
--rownum의 특성

-- 인라인뷰
select rownum, employee_id, first_name, hire_date from
(select employee_id, first_name, hire_date from employees order by hire_date desc)
where rownum <= 4;

select employee_id, first_name, hire_date from employees order by hire_date desc;

create view VIEW_LOC
as
select employee_id, first_name, job_id from employees;

select * from employees;
select * from departments;

create view view_dept30
as
select E.first_name, E.hire_date, department_name from employees E, departments D
where E.department_id = 30 and E.department_id = D.department_id;

select * from view_dept30;

create view view_dept_maxsal
as
select * from employees
where (job_id, salary) in (select job_id, max(salary) from employees group by job_id);

select * from view_sal_top3;

create view view_sal_top3
as
select first_name, salary from
(select rownum, first_name, salary from employees order by salary desc)
where rownum <= 3;

select rownum from employees;

select rownum, first_name, salary

from (select first_name, salary

        from employees

        order by salary desc)

where rownum <=3;



drop view view_sal_top3;