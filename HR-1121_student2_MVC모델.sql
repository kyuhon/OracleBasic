SELECT * FROM STUDENT2;
DROP TABLE STUDENT2;
CREATE TABLE STUDENT2(
    NO NUMBER(4), --pk
    NAME VARCHAR2(20) NOT NULL,
    KOR NUMBER(4) NOT NULL,
    ENG NUMBER(4)NOT NULL,
    MAT NUMBER(4)NOT NULL,
    TOTAL NUMBER(4),
    AVE NUMBER(5,1),
    RANK NUMBER(4)
);

ALTER TABLE STUDENT2 ADD CONSTRAINT STUDENT_NO_PK PRIMARY KEY(NO);

DROP SEQUENCE STUDENT2_NO_SEQ;
CREATE SEQUENCE STUDENT2_NO_SEQ
START WITH 1
INCREMENT BY 1;


COMMIT;


SELECT * FROM STUDENT;

-- 성적을 입력하면 총점과 평균이 자동 계산되어 입력되는 트리거
CREATE OR REPLACE TRIGGER STUDENT2_INSERT_TRIGGER
BEFORE INSERT ON STUDENT2
FOR EACH ROW
BEGIN
    :NEW.TOTAL := :NEW.KOR + :NEW.ENG + :NEW.MAT;
    :NEW.AVE := ROUND(:NEW.TOTAL / 3, 1);
END;
/

-- 성적을 수정하면 총점과 평균이 같이 변하는 트리거
CREATE OR REPLACE TRIGGER STUDENT2_UPDATE_TRIGGER
BEFORE UPDATE ON STUDENT2
FOR EACH ROW
BEGIN
    :NEW.TOTAL := :NEW.KOR + :NEW.ENG + :NEW.MAT;
    :NEW.AVE := ROUND(:NEW.TOTAL / 3, 1);
END;
/

-- 등수를 처리하는 저장 프로시저 생성
CREATE OR REPLACE PROCEDURE STUDENT2_RANK_PROC
IS 
    VSTUDENT_RT STUDENT2%ROWTYPE; 
    CURSOR C1 IS
    SELECT NO, RANK() OVER(ORDER BY TOTAL DESC) RANK FROM STUDENT2 ORDER BY TOTAL DESC; 
BEGIN
    FOR  VSTUDENT_RT IN C1 LOOP
        UPDATE STUDENT2 SET RANK = VSTUDENT_RT.RANK WHERE NO =  VSTUDENT_RT.NO; 
    END LOOP;
    COMMIT;
END;
/

INSERT INTO STUDENT2 (NO,NAME,KOR,ENG,MAT) VALUES(STUDENT2_NO_SEQ.NEXTVAL, '홍길동', '90', '70', '70');
INSERT INTO STUDENT2 (NO,NAME,KOR,ENG,MAT) VALUES(STUDENT2_NO_SEQ.NEXTVAL, '김길동', '80', '25', '66');
INSERT INTO STUDENT2 (NO,NAME,KOR,ENG,MAT) VALUES(STUDENT2_NO_SEQ.NEXTVAL, '이길동', '100', '75', '89');
COMMIT;


EXECUTE STUDENT2_RANK_PROC;