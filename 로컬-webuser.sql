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
 
 describe student;
 select * from student;
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
 commit;
 select * from student;
 
 --------------10강 게시판 만들기(답변형)
 
CREATE TABLE BOARD (
"NUM"       NUMBER(7,0) NOT NULL, 
WRITER      VARCHAR2(12) NOT NULL, 
EMAIL       VARCHAR2(30) NOT NULL, 
SUBJECT     VARCHAR2(50) NOT NULL, 
PASS        VARCHAR2(10) NOT NULL, 
READCOUNT   NUMBER(5,0) DEFAULT 0, 
"REF"       NUMBER(5,0) DEFAULT 0, 
STEP        NUMBER(3,0) DEFAULT 0, 
"DEPTH"     NUMBER(3,0) DEFAULT 0, 
REGDATE     TIMESTAMP (6) DEFAULT SYSDATE, 
"CONTENT"   VARCHAR2(4000) NOT NULL, 
IP          VARCHAR2(20) NOT NULL
);

ALTER TABLE BOARD ADD CONSTRAINT BOARD_NUM_PK PRIMARY KEY(NUM);
select * from board;
truncate table board;
create sequence board_seq
 start with 1       --시작을 1로 설정
  increment by 1    -- 증가값을 1씩 증가
  nomaxvalue        --최대값이 무한대
  nocache
  nocycle;
  
commit;  

SELECT count(*) as count FROM STUDENT WHERE ID = 'abc';



-- 스프링부트와 리액트 연동 테스트
CREATE TABLE survey ( 
    survey_idx NUMBER NOT NULL PRIMARY KEY,  
    question VARCHAR2(4000) NOT NULL,  
    ans1 VARCHAR2(500) NOT NULL, 
    ans2 VARCHAR2(500) NOT NULL, 
    ans3 VARCHAR2(500) NOT NULL, 
    ans4 VARCHAR2(500) NOT NULL, 
    status CHAR(1) DEFAULT '1' 
);
 
insert into survey values (1,'좋아하는 언어는 무엇입니까?','Java','C','Python','C#','1'); 
select * from survey where survey_idx=1; 
 
CREATE TABLE answer ( 
    answer_idx NUMBER PRIMARY KEY,  
    survey_idx NUMBER NOT NULL, 
    num NUMBER NOT NULL 
); 
 
CREATE SEQUENCE answer_seq 
    START WITH 1 
    INCREMENT BY 1; 
     
insert into answer values  
(answer_seq.nextVal ,1,2); 
 
insert into answer values  
(answer_seq.nextVal,1,3); 
 
insert into answer values  
(answer_seq.nextVal,1,4); 
 
select * from answer; 
 
CREATE OR REPLACE VIEW survey_v AS  
SELECT survey_idx, num, COUNT(*) AS sum_num, 
       ROUND( 
         (SELECT COUNT(*) 
          FROM answer  
          WHERE survey_idx = s.survey_idx AND num = s.num) * 100.0 /  
         (SELECT COUNT(*) 
          FROM answer  
          WHERE survey_idx = s.survey_idx), 1) AS rate  
FROM answer s 
GROUP BY survey_idx, num  
ORDER BY num; 
 
select * from survey_v where survey_idx=1;

commit;