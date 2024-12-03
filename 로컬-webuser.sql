CREATE SEQUENCE visit_seq  -- 시퀀스이름
    START WITH 1             -- 시작을 1로 설정
    INCREMENT BY 1          
    NOMAXVALUE             
    NOCACHE
    NOCYCLE;
 
 CREATE table "VISIT" (
 NO         NUMBER(5,0) NOT NULL,
 WRITER     VARCHAR2(20) NOT NULL,    
 MEMO       VARCHAR2(4000) NOT NULL,
 REGDATE    DATE NOT NULL
 );
 alter table visit add constraint visit_no_pk primary key(no);