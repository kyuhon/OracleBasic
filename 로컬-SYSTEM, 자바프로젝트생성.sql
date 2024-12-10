--1 사용자가 정의한 테이블 스페이스 만들기
create TABLESPACE firstdata
datafile 'C:\oraclexe\oradata\XE\first01.dbf' size 10M;
--2 용량이 부족시 테이블 스페이스 확장하기
alter tablespace firstdata
add datafile 'C:\oraclexe\oradata\XE\first02.dbf' size 1M;
--3 용량이 부족시 테이블 스페이스 용량 확대하기
alter database
datafile 'C:\oraclexe\oradata\XE\first02.dbf' resize 10M;
--4 용량이 부족시 자동으로 1M 확장하고 최대 20M 확장하도록 설정
alter database
datafile 'C:\oraclexe\oradata\XE\first01.dbf'
autoextend on
next 1M
maxsize 20M;
--5 자바프로젝트를 위해서 사용자 계정 및 테이블스페이스(javadata), 파일명(app_data.dbf) 생성하기
create tablespace javadata
datafile 'C:\oraclexe\oradata\XE\app_data.dbf' size 20M
autoextend on
next 3M
maxsize 500M;

--6 자바 프로젝트 사용자계정 생성하기(시스템 계정등록해서 진행함)(주의:여기서하는것이아니다)
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
DROP USER javauser CASCADE; -- 기존 사용자 삭제
CREATE USER javauser IDENTIFIED BY 123456 -- 사용자 이름: javauser, 비밀번호 : 123456
    DEFAULT TABLESPACE javadata    -- 데이터 저장소
    TEMPORARY TABLESPACE TEMP;  -- 임시저장장소
GRANT connect, resource, dba TO HR; -- 권한 부여

--7 웹 프로젝트 사용자계정 생성하기
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
DROP USER webuser CASCADE; -- 기존 사용자 삭제
CREATE USER webuser IDENTIFIED BY 123456 -- 사용자 이름: javauser, 비밀번호 : 123456
    DEFAULT TABLESPACE USERS    -- 데이터 저장소
    TEMPORARY TABLESPACE TEMP;  -- 임시저장장소
GRANT connect, resource, dba TO webuser; -- 권한 부여

select * from all_users;
