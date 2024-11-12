-- susan 부서아이디 보기
select department_id from employees where first_name = 'Susan';

-- 부서테이블에서 40번 부서명을 조회
select department_name from departments where department_id = 40;

-- susan 소속되어 있는 부서명을 검색하시오
select * from employees where first_name = 'Susan';
select * from departments where department_id = 40;

--
select E.first_name, D.department_name from departments D inner join employees E on D.department_id = E.department_id
where upper(first_name) = upper('Susan');
-- 단일행은 비교, 크기, 연산이 가능하다.
-- 컬럼이 아무리 많아도 행이 하나면 단일행
-- 다중행은 비교, 크기, 연산이 불가능하다. (IN=OR, ANY=1개이상, ALL=모두, exists=존재하냐)
select department_id from employees where first_name = 'Susan';
select * from departments where department_id = 
(select department_id from employees where first_name = 'Susan');

-- employees 테이블에서 Lex와 같은 부서에(10번부서) 있는 모든 사원의 이름과
-- 입사일자(형식: 1981-11-17)를 출력하는 select문을 작성하시오.
select department_id from employees where first_name = 'Lex';
select * from employees where department_id = 90;

-- [문제1] employees 테이블에서 ceo에게 보고하는 직원의 모든 정보를 출력하는 select문을 작성하시오
-- 상사가 null인 사람은 ceo
select employee_id from employees where manager_id is null;

-- 고용테이블에서 전체 연봉평균
select round(avg(salary)) as salary from employees group by department_id;
-- 전체 평균연봉보다 높은 직원 정보 출력
select * from employees where salary > (select round(avg(salary)) as salary from employees);
-- 다중행이면 비교 가능할까
select * from employees where exists (select round(avg(salary)) as salary from employees group by department_id);
select * from employees where 1 = 0;
create table imsiTBL as select * from employees where 1=0;
-- 테이블 복사
select * from imsiTBL;
drop table imsiTBL;

-- employees 테이블에서 Susan 또는 Lex 월급
select salary from employees where upper(first_name) = upper('Susan') or upper(first_name) = upper('Lex');

-- employees 테이블에서 Susan 또는 Lex와 월급이 같은 직원의 이름, 업무, 급여를 출력(Susan, Lex는 제외)
select * from employees where salary in(17000,6500);
select * from employees where salary in(17000,6500) and first_name <> 'Susan' and first_name <> 'Lex';
select * from employees where salary in(17000,6500) and first_name not in('Susan', 'Lex');
select * from employees where salary in
(select salary from employees where upper(first_name) = upper('Susan') or upper(first_name) = upper('Lex'))
and first_name <> 'Susan' and first_name <> 'Lex';

-- 한명이상으로부터 보고를 받는다 = 나는 매니저로 등록되어있다.   null = ceo
select distinct manager_id from employees where manager_id is not null or manager_id is null order by manager_id desc;
select distinct manager_id as "상사" from employees;
-- 한 명 이상으로부터 보고를 받을 수 있는 직원의 직원번호, 이름, 업무, 부서번호를 출력
select * from employees where manager_id in (null, 100, 102); -- 여기서 null은 false로 취급됨
select employee_id, first_name, job_id, department_id from employees
where manager_id;
-- employees 테이블에서 Accounting 부서에서 근무하는 직원과 같은 업무를 하는 직원의 이름,
-- 업무명을 출력하는 select문을 작성하시요
select first_name, last_name, job_id from employees where job_id like '%ACCOUNT';
select first_name, job_id from employees where department_id = 110;
select department_id from departments where department_name = 'Accounting';
select distinct job_id from employees where department_id = 110;

select first_name, job_id from employees
where department_id = (select department_id from departments where department_name = 'Accounting')
and job_id in ('AC_MGR', 'AC_ACCOUNT');

select first_name, job_id from employees
where department_id = (select department_id from departments where department_name = 'Accounting')
and job_id in (select distinct job_id from employees 
where department_id = 110);

select first_name, job_id from employees
where job_id in (select distinct job_id from employees where department_id = 110);

-- exists 
select * from employees where department_id = 10;
select * from departments where exists (select * from employees where department_id = 10);

-- 직급이 'ST_MAN'인 직원이 받는 급여들의 최소 급여보다 많이 받는 직원들의 이름과 급여를 출력하되
-- 부서번호가 20번인 직원은 제외한다
select * from employees;
select min(salary) from employees where job_id = 'ST_MAN';

select first_name, salary from employees 
where salary > (select min(salary) from employees where job_id = 'ST_MAN')
and department_id <> 20;

-- EMPLOYEES 테이블에서 Valli라는 이름을 가진 직원과 업무명 및 월급이 같은 사원의 모든 정보를
-- 출력하는 select문을 작성하시오 (결과에서 Valli는 제외)
select * from employees where job_id = (select job_id from employees where first_name = 'Valli') 
and salary = (select salary from employees where first_name = 'Valli')
and first_name <> 'Valli';

-- EMPLOYEES 테이블에서 월급이 자신이('Valli') 속한 부서의 평균 월급보다 높은 사원의
-- 부서번호, 이름, 급여를 출력하는 SELECT문을 작성하시오.
select department_id from employees where first_name = 'Valli';
select round(avg(salary),-2) from employees where department_id = (select department_id from employees where first_name = 'Valli');
select department_id, first_name, salary from employees
where salary >= (select round(avg(salary),-2) from employees where department_id = (select department_id from employees where first_name = 'Valli'));

