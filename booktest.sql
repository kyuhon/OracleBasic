--employees
SELECT * FROM EMPLOYEES;
desc employees;

CREATE TABLE books (
    id number(4), 
    title varchar2(50), 
    publisher varchar2(30), 
    year varchar2(10), 
    price number(6)
);
drop table books;
alter table books add constraint BOOKS_ID_PK primary key(id);

create sequence books_id_seq
start with 1
increment by 1;

desc books;
select * from user_cons_columns where table_name = 'books';

INSERT INTO books VALUES (books_id_seq.nextval, 'Operating System Concepts', 'Wiley', '2003',30700);
INSERT INTO books VALUES (books_id_seq.nextval, 'Head First PHP and MYSQL', 'OReilly', '2009', 58000);
INSERT INTO books VALUES (books_id_seq.nextval, 'C Programming Language', 'Prentice-Hall', '1989', 35000);
INSERT INTO books VALUES (books_id_seq.nextval, 'Head First SQL', 'OReilly', '2007', 43000);
commit;

select * from books;

delete from books where id = 4;
rollback;

update books set title = 'KKK',publisher = 'JAVA', year = '2024', price = 33000
where id = 3;

select * from books;

CREATE TABLE food (
    id number(4), 
    title varchar2(20),  
    price number(6)
);

alter table food add constraint FOOD_ID_PK primary key(id);

create sequence food_id_seq
start with 1
increment by 1;

select * from user_cons_columns where table_name = 'food';
INSERT INTO food VALUES (food_id_seq.nextval, 'apple', 1500);
INSERT INTO food VALUES (food_id_seq.nextval, 'grape', 1000);
INSERT INTO food VALUES (food_id_seq.nextval, 'orange', 500);

drop table food ;

select * from food;
SELECT * FROM FOOD;
COMMIT;

CREATE OR REPLACE PROCEDURE  FOOD_PROCEDURE(
    VID IN FOOD.ID%TYPE, VPRICE IN FOOD.PRICE%TYPE , VMESSAGE OUT VARCHAR2)
IS
    VFOOD_RT FOOD%ROWTYPE; 
BEGIN
    UPDATE FOOD 
    SET PRICE = PRICE + VPRICE WHERE ID = VID; 
    COMMIT;
    SELECT * INTO VFOOD_RT FROM FOOD WHERE ID = VID; 
    VMESSAGE := VFOOD_RT.ID||' 번호의 인상금액은 '|| VPRICE ||'이고 총 금액은'|| VFOOD_RT.PRICE ||'입니다'; 
    DBMS_OUTPUT.PUT_LINE(VMESSAGE); 
END;
/

CREATE OR REPLACE FUNCTION  FOOD_FUNCTION(
    VID IN FOOD.ID%TYPE, VPRICE IN FOOD.PRICE%TYPE)
    RETURN VARCHAR2
IS
    VFOOD_RT FOOD%ROWTYPE;
    VMESSAGE VARCHAR2(100); 
BEGIN
    UPDATE FOOD 
    SET PRICE = PRICE - VPRICE WHERE ID = VID; 
    COMMIT;
    SELECT * INTO VFOOD_RT FROM FOOD WHERE ID = VID; 
    VMESSAGE := VFOOD_RT.ID||' 번호의 인하금액은 '|| VPRICE ||'이고 총 금액은'|| VFOOD_RT.PRICE ||'입니다'; 
    RETURN VMESSAGE;  
END;
/

