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