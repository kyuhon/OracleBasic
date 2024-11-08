create table subject(
    no number(4) not null,
    num number(2) not null,
    name char(10) not null
);

delete from subject;
alter table subject drop constraint no_pk;
alter table subject add constraint su_no_pk primary key(no);


create table student(
    no number(2) not null,
    s_num number(8) not null,
    name char(5) not null,
    id varchar2(10) not null,
    passwd varchar2(10) not null,
    num number(02) not null,
    jumin number(13) not null,
    phone number(11) not null,
    address varchar2(20) not null,
    email varchar2(20) not null,
    s_date number(8) not null 
);

alter table student add constraint st_no_pk primary key(no);

create table lesson(
    no
);