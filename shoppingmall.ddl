-- 생성자 Oracle SQL Developer Data Modeler 24.3.0.275.2224
--   위치:        2024-11-08 14:47:08 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE buy (
    phone       CHAR(11 CHAR) NOT NULL,
    productname CHAR(3 CHAR) NOT NULL,
    price       NUMBER(7) NOT NULL,
    amount      NUMBER(3) NOT NULL
);

CREATE TABLE "userDB" (
    phone     CHAR(11 CHAR) NOT NULL,
    name      CHAR(4 CHAR) NOT NULL,
    birthyear NUMBER(4) NOT NULL,
    address   VARCHAR2(40 CHAR) NOT NULL
);

ALTER TABLE "userDB" ADD CONSTRAINT user_pk PRIMARY KEY ( phone );

ALTER TABLE buy
    ADD CONSTRAINT buy_user_phone_fk FOREIGN KEY ( phone )
        REFERENCES "userDB" ( phone ) ON DELETE CASCADE;00000000000000000000000000000000000000000000000000000000



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             2
-- CREATE INDEX                             0
-- ALTER TABLE                              2
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0