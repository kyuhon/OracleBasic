-- 생성자 Oracle SQL Developer Data Modeler 24.3.0.275.2224
--   위치:        2024-11-08 16:59:58 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE customer (
    name         VARCHAR2(10 CHAR) NOT NULL,
    address      VARCHAR2(50 CHAR) NOT NULL,
    phone        CHAR(13 CHAR) NOT NULL,
    customer_num NUMBER(4) NOT NULL
);

ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( customer_num );
ALTER TABLE customer ADD CONSTRAINT customer_addr_uk UNIQUE (address);

CREATE TABLE delivery (
    delivery_num  NUMBER(4) NOT NULL,
    order_num     NUMBER(4) NOT NULL,
    address       VARCHAR2(50 CHAR) NOT NULL,
    delivery_date DATE NOT NULL
);

ALTER TABLE delivery ADD CONSTRAINT delivery_pk PRIMARY KEY ( delivery_num );
alter table delivery add constraint delivery_or_fk foreign key(order_num)
    references "ORDER"(order_num);
alter table delivery add constraint delivery_addr_fk foreign key(address)
    references customer(address);
    
CREATE TABLE "ORDER" (
    order_num    NUMBER(4) NOT NULL,
    customer_num NUMBER(4) NOT NULL,
    product_num  NUMBER(4) NOT NULL,
    amount       NUMBER(4) NOT NULL,
    total_price  NUMBER(10) NOT NULL
);

ALTER TABLE "ORDER" ADD CONSTRAINT order_pk PRIMARY KEY ( order_num );
alter table "ORDER" modify amount default 1;
alter table "ORDER" add constraint order_customnum_fk foreign key(customer_num)
    references customer(customer_num);
alter table "ORDER" add constraint order_product_num_fk foreign key(product_num)
    references product(product_num);
    
CREATE TABLE product (
    product_num NUMBER(4) NOT NULL,
    unit_price  NUMBER(10) NOT NULL,
    name        VARCHAR2(20 CHAR) NOT NULL,
    stock       NUMBER(4) NOT NULL
);

ALTER TABLE product ADD CONSTRAINT product_pk PRIMARY KEY ( product_num );
alter table product modify stock default 0;


-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             0
-- ALTER TABLE                              4
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
