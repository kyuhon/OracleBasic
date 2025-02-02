create table EMP01(
    no NUMBER(4),
    name VARCHAR2(20) not null,
    salary NUMBER(10,2) default 1000.0,
    CONSTRAINT EMP01_no_PK primary key(no),
    CONSTRAINT EMP01_NAME_UK unique(name)
    );
-- 테이블 정보구하기
select * from tab;
-- 테이블 삭제하기
drop table emp01;
-- 휴지통보기
select * from recyclebin;
-- 휴지통비우기
purge recyclebin;
-- 휴지통복원
flashback table emp01 to before drop;
-- 테이블 복사(제약조건복사안됨)
desc employees;
select count(*) from employees;
create table emple02 as select * from employees;
desc emple02;
select count(*) from emple02;
-- 제약조건 걸기 primary key , unique
alter table emple02 add constraint emple02_id_pk primary key(employee_id);
alter table emple02 add constraint emple02_email_uk unique(email);
-- 제약조건 삭제하기 unique
alter table emple02 drop constraint emple02_email_uk;
-- 제약조건 정보 검색
select * from user_constraints;
select * from user_tables;
select table_name , constraint_name , constraint_type from user_constraints where table_name = upper('emple02');
-- 컬럼추가 emp01
alter table emp01 add job varchar2(10) not null;
desc emp01;
-- 컬럼제거 emp01
alter table emp01 drop column job;
-- 컬럼변경
alter table emp01 modify job number(10) default 0;
-- 컬럼이름변경
alter table emp01 rename column job to job2;

-- 테이블명을 변경 emp01 -> emp02 ddl(create, alter, drop, rename, truncate)
rename emp01 to emp02;

create table customer (
    no number(7) not null,
    name varchar2(10) not null,
    gender char(1) not null,
    birth char(8) not null,
    phone varchar2(16),
    email varchar2(30),
    total_point number(10) default 0
);
alter table customer add CONSTRAINT customer_no_pk PRIMARY key(no);
alter table customer add constraint customer_email_uk unique(email);
alter table customer add constraint customer_gender_ck check(gender in ('M','W'));

-- 제약조건 검색
select * from user_constraints where table_name = 'sustomer';

desc emp01;
-- 제약조건 not null
alter table emp01 modify salary number(10,2) not null;

create table student(
    no number(10) not null, --pk를 주면 자동 not null
    name char(5) not null,
    korean number(3) not null default 0,
    english number(3) not null default 0,
    math number(3) not null default 0,
    total number(3) default 0,
    arg number(3,2) default 0.0,
    stu_code number(10)--fk.부테이블,자식
);

create table stu_depart(
    code number(10) not null, --주테이블,부모
    name varchar2(10) not null
);

alter table student add constraint stu_no_pk primary key(no);
alter table student add constraint depart_code_fk 
foreign key(stu_code) references stu_depart(code) on delete cascade;
-- on delete cascade : stu_code를 삭제하면 부모의 code도 같이 삭제
-- on update cascade : stu_code를 수정하면 부모의 code도 같이 수정

drop table student;

