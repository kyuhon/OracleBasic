-- 트랜잭션
drop table dep02;

-- 테이블복사 (구조만복사)
create table dep02
as
select * from departments where 1=0; -- 구조만 복사

desc dep02;
select * from user_constraints where table_name = 'dep02';

-- 내용복사
insert into dep02 select * from departments;

select * from dep02;

savepoint c1;

delete from dep02 where department_id = 90;

rollback; -- commit 기준

