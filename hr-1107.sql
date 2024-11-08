--2007년에 입사한 사원의 입사일이 오늘로 수정한다
select * from employees;
update employees set hire_date = sysdate where substr(hire_date,1,2) = '03';
rollback;

--이름이 susan의 부서번호는 20번으로, 직급은 FI_MGR
update employees set department_id = 20, job_id = 'fi_mgr'
where upper(first_name) = upper('susan');

--last_name이 Russell인 사원의 급여를 17000로, 커미션 비율이 0.45로 인상된다.
update employees set salary = 17000, commision_pct = 0.45
where last_name = 'Russell';

-- 30번 부서를 삭제
delete from employees where department_id = 30;

create table customer(
    code varchar2(7),
    name varchar2(10) not null,
    gender char(1) not null,
    birth varchar2(8) not null,
    phone varchar2(16)
);
alter table customer add CONSTRAINT customer_no_pk PRIMARY key(no);
alter table customer add constraint customer_gender_ck check(gender in('M','w'));
alter table customer add constraint customer_phone_uk unique(phone);
desc customer;
select * from user_constraints;
select * from user_tables;
select * from user_cons_columns;
select * from user_cons_columns where table_name = 'customer';


-- merge mycustomer -> customer 병합을 진행하는데 없으면 insert, 있으면 update
merge into customer c
    using mycustomer m
    on (c.code = m.code)
    when matched then
        update set c.name = m.name, c.gender = m.gender,
        c.birth = m.birth, c.phone = m.phone
    when not matched then
        insert (c.code,c.name,c.gender,c.birth,c.phone) values(m.code,m.name,m.gender,m.birth,m.phone);

create table emp03(
    empno number(4) primary key,
    ename char(10) not null,
    job varchar2(9),
    deptno number(4)
);

drop table emp01;






create table emp01(
    empno number(4) not null,
    ename varchar2(10) not null,
    job varchar2(9),
    mgr number(4),
    hiredate date not null,
    sal number(7,2) not null,
    comm number(7,2) ,
    deptno number(2) not null
);
alter table emp01 add constraint empno_pk primary key(empno);

select * from emp01;
insert into emp01 values('7369','smith','cleak','7836','19801217','800',null,'20');
insert into emp01 values('7499','allen','salesman','7369','19871220','1600','300','30');
insert into emp01 values('7839','king','president',null,'19810208','5000',null,'10');

create table members (
    id varchar2(20) not null,
    name varchar2(20) not null,
    regno varchar2(13) not null,
    hp varchar2(13) not null,
    address varchar2(100) not null
);
alter table members add constraint id_pk primary key(id);
alter table members add constraint name_uk unique(name);
alter table members add constraint regno_uk unique(regno);
alter table members add constraint hp_uk unique(hp);
alter table members drop constraint name_uk; 

create table books (
    code number(4) not null,
    title varchar2(50) not null,
    count number(6) not null,
    price number(10) not null,
    publish varchar2(50) not null
);
alter table books add constraint code_pk primary key(code);





create table v_gogek (
    g_code number(5) not null,
    g_name varchar2(20) not null,
    g_age number(3),
    g_addr varchar2(50),
    g_tel varchar2(20)
);
alter table v_gogek add constraint g_code_pk primary key(g_code);




create table video (
    v_code number(5) not null,
    v_title varchar2(50) not null,
    v_genre varchar2(30),
    v_pay number(7) not null,
    v_lend_state number(1),
    v_make_company varchar2(50),
    v_make_date date,
    v_view_age number(1)
);

alter table video add constraint v_code_pk primary key(v_code);

create table lend_return (
    lr_code number(5) not null,
    g_code number(5) not null,
    v_code number(5) not null,
    l_date date,
    r_plan_date date,
    l_total_pay number(7)
);

alter table lend_return drop constraint lr_code_pk;
alter table lend_return add constraint lr_code_pk primary key(lr_code);
alter table lend_return add constraint g_code_fk foreign key(g_code) references v_gogek(g_code);
alter table lend_return add constraint v_code_fk foreign key(v_code) references video(v_code);

select * from lend_return;