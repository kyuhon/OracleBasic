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


-- 장표 회원가입
-- jsp 회원가입 테이블
CREATE TABLE SIGNUP (
    ID VARCHAR2(12) ,                         -- 아이디 (4~12자의 영문 대소문자와 숫자)
    PWD VARCHAR2(12) NOT NULL,                -- 비밀번호 (4~12자의 영문 대소문자와 숫자)
    EMAIL VARCHAR2(100) NOT NULL,             -- 이메일 주소
    NAME VARCHAR2(50) NOT NULL,               -- 이름
    BIRTH NUMBER(10)                          -- 생년월일 (20001010)
);

ALTER TABLE SIGNUP ADD CONSTRAINT SIGNUP_ID_PK PRIMARY KEY(ID);

-- jsp로그인테이블
CREATE TABLE LOGIN2(
    ID VARCHAR2(12),
    PWD VARCHAR2(12) NOT NULL
);
ALTER TABLE LOGIN2 ADD CONSTRAINT LOGIN2_ID_PK PRIMARY KEY(ID);