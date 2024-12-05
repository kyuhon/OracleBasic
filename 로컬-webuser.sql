CREATE SEQUENCE visit_seq  -- 시퀀스이름
    START WITH 1             -- 시작을 1로 설정
    INCREMENT BY 1          
    NOMAXVALUE             
    NOCACHE
    NOCYCLE;
 
 CREATE table VISIT (
 NO         NUMBER(5,0) NOT NULL,
 WRITER     VARCHAR2(20) NOT NULL,    
 MEMO       VARCHAR2(4000) NOT NULL,
 REGDATE    DATE NOT NULL
 );
 select * from visit;
 alter table visit add constraint visit_no_pk primary key(no);
 public final String LESSON_INSERT = "INSERT INTO LESSON VALUES(lesson_seq.NEXTVAL, 'KDJ', '처음으로 메모장 입력', sysdate) ";
 
 select * from visit order by no desc;
 
 create table member (
 NO number(5,0) not null,
 id varchar2(20) not null,
 password varchar2(20) not null,
 regdate date not null
 );
 
 select * from member order by no desc;
 
 insert into member values(member_seq.nextval, 'dfikj', 'kasjdflk', sysdate);
 
 
  alter table member add constraint member_no_pk primary key(no);
  CREATE SEQUENCE member_seq  -- 시퀀스이름
    START WITH 1             -- 시작을 1로 설정
    INCREMENT BY 1          
    NOMAXVALUE             
    NOCACHE
    NOCYCLE;
    
--*****************************************************************

CREATE table LOGIN (
    ID       VARCHAR2(12) NOT NULL,
    PASS     VARCHAR2(12) NOT NULL
);

alter table login add constraint login_id_pk primary key(id);
 
 create table ACCOUNT(
    NO         NUMBER(5,0) NOT NULL,
    NAME     VARCHAR2(20) NOT NULL,
    ID     VARCHAR2(4000) NOT NULL,
    PWD     VARCHAR2(4000) NOT NULL,
    REGDATE   DATE NOT NULL
);
alter table ACCOUNT add constraint ACCOUNT_NO_PK primary key (NO);
alter table ACCOUNT add constraint ACCOUNT_ID_UQ UNIQUE(ID);