-- trigger 테스팅
-- emp01 생성 하고 트리거를 생성한다(입력이 될때마다 입력값을 출력해주는 트리거를 만든다)
drop table emp01;
create table emp01 (
    empno number(4) primary key,
    ename varchar2(20),
    jop varchar2(50)
);
desc emp01;

create or replace trigger emp01_trigger
    after insert on emp01
    for each row
begin
    dbms_output.put_line(:new.empno || ','||:new.ename||'신입사원이 입사했습니다.');
end;
/

insert into emp01 values((select nvl(max(empno),0)+1 from emp01), 
dbms_random.string('u',4),'it_dev');

select dbms_random_string ('0',4) ;

CREATE TABLE SAL01(
    SALNO NUMBER(4),
    SAL NUMBER,
    EMPNO NUMBER(4)
    );
ALTER TABLE SAL01 ADD CONSTRAINTS SAL01_SALNO_PK PRIMARY KEY(SALNO);
ALTER TABLE SAL01 ADD CONSTRAINTS SAL01_EMPNO_FK FOREIGN KEY(EMPNO) REFERENCES EMP01(EMPNO);


CREATE TABLE PRODUCT(
    CODE CHAR(6),
    NAME  VARCHAR(12) NOT NULL,
    COMPANY VARCHAR(12),
    PRICE NUMBER(8),
    STOCK NUMBER DEFAULT 0
    );
ALTER TABLE PRODUCT ADD CONSTRAINTS PRODUCT_CODE_PK PRIMARY KEY(CODE);
desc product;

INSERT INTO PRODUCT
    VALUES('A00001','세탁기', 'LG', 1500000, 0);
INSERT INTO PRODUCT
    VALUES('A00002','컴퓨터', 'LG', 1000000, 0);
INSERT INTO PRODUCT
    VALUES('A00003','냉장고', '삼성', 4500000, 0);

select * from product;

-- 입고테이블

CREATE TABLE RECEIVING(
    NO NUMBER(6),
    CODE CHAR(6),
    RDATE DATE,
    QTY NUMBER(6),
    PRICE NUMBER(8),
    AMOUNT NUMBER(8)
    );
ALTER TABLE RECEIVING ADD CONSTRAINTS RECEVING_NO_PK PRIMARY KEY(NO);
ALTER TABLE RECEIVING ADD CONSTRAINTS RECEVING_CODE_PK FOREIGN KEY(CODE) REFERENCES PRODUCT(CODE);

desc receiving;

-- 트리거 생성 입고(reaceiving) 입력이 되면 재고(product) 수량의 입고 수량이 저장되는 트리거를 생성할것

CREATE or replace TRIGGER RECEIVING_TRIGGER01
    AFTER INSERT ON RECEIVING
    FOR EACH ROW
BEGIN
    UPDATE PRODUCT SET STOCK = STOCK + :NEW.AMOUNT
    WHERE CODE = :NEW.CODE;
END;
/

--입고 수량을 등록한다.
INSERT INTO RECEIVING(NO, CODE, QTY, PRICE, AMOUNT)
VALUES((select nvl(max(no),0) + 1 from receiving), 'A00002', 10, 680000, 780000);

select * from product;
select * from receiving;

-- 갱신트리거 만들기 입고수량을 30 => 10 진행을 했는데 마지막 10개를 5개 수정하면, product 재고수량을 수정하는 트리거를 만들것
create or replace trigger receiving_trigger
    after update on receiving
    for each row
begin
    update product set stock = stock + (-:old.qty + : new.qty) where code = :new.code;
    
end;
/

update receiving set qty = 8, price=1000000, amount=1000000 where code = 'A00001';
rollback;

-- function 부서번호를 입력하면 부서명을 리턴해주는 함수를 만드시오.
-- 부서번호가 없는 번호라면 '해당부서없음'값으로 리턴하시오
create or replace function get_department_name_func(vdepartment_id, employees.department_id%type) 
return varchar2
is
    v_department_name varchar2(100);
    vcount number := 0;
begin
    -- 해당 부서 카운트를 체크
    select * from employees where departmeno_id = 100;
    
select count(*) into vcounet from employeses department_id = vdepartment_id;

    if(count = 0) then
    vdepartment_name := '해당부서없음';
    else
        select department_name into vdepartment_name from departments
        when department_id = vdepartment;
    else if;
    return vdepartment
end:
/

-- 함수를 이용해서 부서번호를 매개변수 등록하고 부서명 구하는 기능 사용
select first_name, salary, department_id, get_department_id, salary,
get

