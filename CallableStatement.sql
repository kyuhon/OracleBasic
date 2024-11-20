-- 자바에서 CallableStatement test
drop table emp1;
create table EMP1
as
select employee_id, first_name, department_id, salary from employees;

select * from emp1 order by department_id;

-- 부서별 번호와 인상율 입력하면 해당되는 부서만 인상률로 적용하는
-- sql문을 프로시저로 작성
create or replace procedure emp1_procedure(
    vdepartment_no in emp1.department_id%type, VINCREMENT_SALARY NUMBER)
is
begin
    update emp1 
    set salary = SALARY*VINCREMENT_SALARY
    where department_id = vdepartment_no;
    commit;
end;
/

execute emp1_procedure(10, 2);

create or replace procedure books_procedure(
    VID IN BOOKS.ID%TYPE, VPRICE IN BOOKS.PRICE%TYPE, VMESSAHE OUT VARCHAR2)
is
    VBOOKS_RT BOOKS%ROWTYPE;
begin
    update BOOKS
    set PRICE = PRICE + VPRICE
    where ID = VID;
    commit;
    SELECT * INTO VBOOKS_RT FROM BOOKS WHERE ID = VID;
    VMESSAGE := VBOOKS_RT.ID||'번호의 인상금액'|| VPRICE || '이고 총 금액은'||
    VBOOKS_RT.PRICE||'입니다';
    DBMS_OUTPUT.PUT_LINE(VMESSAGE);
end;
/
VARIABLE MESSAGE VARCHAR2(100);
EXECUTE BOOKS_PROCEDURE(1, 10000, :MESSAGE);



