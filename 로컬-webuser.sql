 -- 자바의 서블릿클래스를 사용하여 간단한 방명록만들기
 -- http://localhost:8080/jspStudy/bbs/write.html
 
 
 CREATE table VISIT (
 NO         NUMBER(5,0) NOT NULL,
 WRITER     VARCHAR2(20) NOT NULL,    
 MEMO       VARCHAR2(4000) NOT NULL,
 REGDATE    DATE NOT NULL
 );

CREATE SEQUENCE visit_seq  -- 시퀀스이름
    START WITH 1             -- 시작을 1로 설정
    INCREMENT BY 1          
    NOMAXVALUE             
    NOCACHE
    NOCYCLE;


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


-- 8강 학생관리 프로그램
CREATE table STUDENT (
ID  VARCHAR2(12)  NOT NULL,
PASS VARCHAR2(12)  NOT NULL,
NAME  VARCHAR2(10)  NOT NULL,
PHONE1 VARCHAR2(3)   NOT NULL,
PHONE2  VARCHAR2(4)   NOT NULL,
PHONE3  VARCHAR2(4)   NOT NULL,
EMAIL    VARCHAR2(30)  NOT NULL,
ZIPCODE  VARCHAR2(7)   NOT NULL,
ADDRESS1 VARCHAR2(120) NOT NULL,
ADDRESS2 VARCHAR2(50)  NOT NULL
);
 
 
 ALTER TABLE STUDENT ADD CONSTRAINT STUDENT_PK PRIMARY KEY(ID);
 
create table zipcode  (
   seq                  NUMBER(10)  not null,
   zipcode              VARCHAR2(50),
   sido                 VARCHAR2(50),
   gugun                VARCHAR2(50),
   dong                 VARCHAR2(50),
   bunji                VARCHAR2(50)
 );
 
 ALTER TABLE zipcode ADD CONSTRAINT zipcode_PK PRIMARY KEY(seq);
 alter table zipcode modify bunji varchar2(100);
 
 describe zipcode;
 select * from zipcode;