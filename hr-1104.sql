--hr resource 있는 테이블정보(프로젝트 클래스 종류)
select * from tab;
--employees 테이블 구조(클래스구조)
desc employees;
--employees 속에 들어있는 레코드(객체)를 보여주세요
select * from employees;
--departments 테이블 객체(레코드=인스턴스)를 확인
select * from departments;
--departments 구조
desc departments;
--department_id, department_name 보임
select department_id, department_name from departments
--필드명에 별칭사용하기
select department_id as "부서번호", department_name as "부서명" from departments;
select department_id as DEPT_NO, department_name as DEPT_NAME from departments;
select department_id as "DEPT NO", department_name as "DEPT NAME" from departments;
-- + ||
select '5' + 5 from dual;
desc dual;
select * from employees;
select '5'+ 5 from employees;

select '5' || 5 from dual;
--문자열 기능을 이용해서 필드명을 보여주기
select first_name, job_id from employees;
select first_name || '의 직급은' || job_id || '입니다' from employees;
select first_name || '의 직급은' || job_id || '입니다' as data from employees;
--중복되지 않게 보여주기 distinct
select distinct job_id from employees;
--연봉을 3000이상받는 사람 정보
select * from employees where salary >= 3000;
desc employees;
--2008년 이후에 입사한 직원조사 날짜비교
select * from employees where hire_date >= '2008/01/01';
select * from employees where TO_CHAR(hire_date,'YYYY/MM/DD') >= '2008/01/01';
select * from employees where hire_date >= TO_DATE('2008/01/01','YYYY/MM/DD HH24:MI:SS');
-- AND , BETWEEN a AND b
SELECT * FROM EMPLOYEES WHERE SALARY >= 2000 AND SALARY <= 3000;
SELECT * FROM EMPLOYEES WHERE SALARY BETWEEN 2000 AND 3000;
-- OR, IN( , )직원번호가 67이거나 101이거나 184인 사원
SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID = 67 OR EMPLOYEE_ID = 101 OR EMPLOYEE_ID = 184;
SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID IN(67 ,101, 184);
-- NULL 연산, 비교, 할당 안된다.
SELECT 100 + NULL FROM DUAL;
DESC EMPLOYEES;
SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL;
SELECT * FROM EMPLOYEES;
-- ORDER By ASC, DESC 사번을 기준으로 오름차순으로 정렬
SELECT EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES ORDER BY EMPLOYEE_ID ASC;
--GROUB BY
SELECT DEPARTMENT_ID, SUM(SALARY) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID HAVING DEPARTMENT_ID = 30;

SELECT * FROM EMPLOYEES;
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID >= 70;
SELECT DEPARTMENT_ID, SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID >= 70;
SELECT DEPARTMENT_ID, MAX(SALARY), MIN(SALARY), ROUND (AVG(SALARY),1) , 
    COUNT(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID >= 70 GROUP BY DEPARTMENT_ID
    HAVING SUM(SALARY) >= 30000;
SELECT DEPARTMENT_ID, AVG(SALARY) FROM EMPLOYEES; -- GROUP BY로 묶어줘야한다
-- 문자열 일부만 추출 SUBSTR(대상, 시작위치, 추출갯수)
SELECT SUBSTR('DATABASE',1,3) FROM DUAL;
-- 20번 부서에서 사원들의 입사년도 가져오기
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID = 20;
SELECT EMPLOYEE_ID, FIRST_NAME, SUBSTR(HIRE_DATE, 1, 2)||'년도' AS "입사년도" 
FROM EMPLOYEES WHERE DEPARTMENT_ID = 20;

--부서 30번에 소속된 직원들 근무달수를 구하기
SELECT FIRST_NAME, HIRE_DATE AS 입사일, SYSDATE AS 현재날짜,
ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) AS "근무달수" FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;
--NEXT_DAY() 함수의 기능
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS'), NEXT_DAY(SYSDATE, '수요일') FROM DUAL;

--03년도에 입사한 사원 알아내기
SELECT HIRE_DATE , FIRST_NAME FROM EMPLOYEES WHERE TO_CHAR(HIRE_DATE, 'YY') = '03';
SELECT * FROM EMPLOYEES;
SELECT HIRE_DATE, TO_CHAR(HIRE_DATE,'YY/MM/DD HH24:MI:SS'), TO_CHAR(HIRE_DATE,'MI') FROM EMPLOYEES;
SELECT TO_DATE('20041214','YYYY/MM/DD')+1 FROM DUAL;

-- k로 끝나는 직원 알아내기
SELECT HIRE_DATE , FIRST_NAME FROM EMPLOYEES WHERE SUBSTR(FIRST_NAME,-1,1)='K';
SELECT FIRST_NAME FROM EMPLOYEES WHERE SUBSTR(FIRST_NAME,-1,1) = 'K';
select first_name from employees where first_name like '%k';
SELECT FIRST_NAME FROM EMPLOYEES WHERE FIRST_NAME LIKE '%k';
select first_name from employees where upper(substr(first_name, length(first_name),1)) = upper('k');

--현재시간표현
select sysdate from dual;
select to_char(sysdate,'yyyy/mm/dd hh24:mi:ss') from dual;
select floor(sysdate - to_date('2024/11/05', 'yyyy/mm/dd')) from dual; --varchar 사용할수도있음

--숫자를 우리가 원하는 형식으로 출력하기 1234567.23 => $1,234,567.23
select trim(to_char(1234567.23,'L999,999,999.999')) as money from dual;
select first_name , trim(to_char(salary,'L999,999,999.999')) as salary from employees;

-- 문자 + 문자 = 숫자
select '10000' + '20000' from dual;
select to_number('10000' , '999,999') + to_number('20000' , '999,999') from dual;

-- NVL
select first_name , salary , commission_pct , job_id from employees order by job_id;
select first_name , salary , NVL(commission_pct,0) , job_id from employees order by job_id;

-- NVL2(대상, 널이아닐때 적용될값, 널일때 적용될값)
select first_name, salary, commission_pct, salary + (salary*commission_pct) total from employees; 
select first_name, salary, commission_pct, salary + (salary * NVL(commission_pct,0)) total from employees;
select first_name, salary, commission_pct, salary + (salary * NVL2(commission_pct,commission_pct,0)) total from employees;


