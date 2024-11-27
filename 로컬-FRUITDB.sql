create table fruit (
fruit_code number, --pk, seq
fruit_name varchar2(10),
origin varchar2(10),
Delivery_period varchar2(5)
);

alter table fruit add constraint fruit_code_pk primary key(fruit_code);
Alter table fruit add constraint fruit_name_uk UNIQUE(fruit_name);

create sequence fruit_seq
start with 1
increment by 1;

create table inventory(
no number,
fruit_code number not null,
fruit_name varchar2(10),
sale_price number,
quantity_remain number
);
alter table inventory add constraint inventory_no_pk primary key(no);
Alter table inventory add constraint inventory_fruit_code_fk 
    FOREIGN key(fruit_code) References fruit(fruit_code) on delete set null;

create sequence inven_seq
start with 1
increment by 1;

create table customer(
no number,
fruit_code number not null,
name varchar2(10),
price number
);
drop table customer;
alter table customer add constraint customer_no_pk primary key(no);
Alter table customer add constraint customer_fruit_code_fk 
    FOREIGN key(fruit_code) References fruit(fruit_code) on delete set null;

create sequence customer_seq
start with 1
increment by 1;

create table employee(
no number,
name varchar2(10),
working_hours varchar2(10),
salary number,
code_in_charge number
);

drop table employee;
alter table employee add constraint employee_no_pk primary key(no);
Alter table employee add constraint employee_code_in_charge_fk 
    FOREIGN key(code_in_charge) References fruit(fruit_code) on delete set null;
    
create sequence employee_seq
start with 1
increment by 1;

