create table subject(
    no number(4) not null,
    num number(2) not null,
    name char(10) not null
);
drop table SUBJECT;
alter table subject drop constraint no_pk;
alter table subject add constraint su_no_pk primary key(no);
alter table subject add constraint su_num_uk unique(num);

create table student(
    no number(4) not null,
    s_num number(8) not null,
    name char(5) not null,
    id varchar2(10) not null,
    passwd varchar2(10) not null,
    num number(02) not null,
    jumin number(13) not null,
    phone number(11) not null,
    address varchar2(20) not null,
    email varchar2(20) not null,
    s_date date not null 
);
drop table student;
alter table student add constraint st_no_pk primary key(no);
alter table student add constraint st_num_uk unique(num);
alter table student add constraint st_s_num_uk unique(s_num);
alter table student drop constraint st_s_num_uk;

create table lesson(
    no number(4) not null,
    num varchar2(2) not null,
    name varchar2(8) not null
);
alter table lesson add constraint le_no_pk primary key(no);
alter table lesson add constraint le_num_uk unique(num);

create table trainee(
    no number(4) not null,
    s_num number(8) not null,
    num varchar2(2) not null,
    section char(7) not null,
    t_date date not null
);

alter table trainee add constraint tr_s_num_fk foreign key(s_num) references student(s_num); 
alter table trainee add constraint tr_num_fk foreign key(num) references lesson(num);
alter table trainee add constraint tr_sec_ck check(section in('culture','major','minor'));

-- 사용자 계정만들기(시스템관리자모드에서 진행해야됨)
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
DROP USER model2 CASCADE; -- 기존 사용자 삭제
CREATE USER model2 IDENTIFIED BY 123456 -- 사용자 이름: Model, 비밀번호 : 1234
    DEFAULT TABLESPACE USERS    -- 데이터 저장소
    TEMPORARY TABLESPACE TEMP;  -- 임시저장장소
GRANT connect, resource, dba TO model2; -- 권한 부여