CREATE TABLE CUST
(CUST#               NUMBER(6),
 CUSTNAME            VARCHAR2(30),
 CITY                VARCHAR2(20),
 RATING              CHAR(1),
 COMMENTS            VARCHAR2(200),
 SALESREP#           NUMBER(7)
);


CREATE TABLE CUST
(CUST#               NUMBER(6),
 CUSTNAME            VARCHAR2(30),
 CITY                VARCHAR2(20),
 RATING              CHAR(1),
 COMMENTS            VARCHAR2(200),
 SALESREP#           NUMBER(7),
 constraint CUST_CUST#_PK primary key(cust#),
 constraint CUST_CUSTNAME_CITY_UK UNIQUE(CUSTNAME,CITY),
 constraint CUST_rating_CK check(rating IN('A','B','C','D')),
 constraint CUST_salesrep#_fk foreign key(salesrep#) REFERENCES employees(employee_id)
);


INSERT INTO CUST VALUES (501, 'ABC LTD', 'Montreal', 'C', NULL, 201);
INSERT INTO CUST values (502,'Black Giant','Ottawa','B',NULL,202);
INSERT INTO CUST values (503,'Mother Goose','London','B',NULL,202);
INSERT INTO CUST values (701,'BLUE SKY LTD','Vancouver','B',NULL,102);
INSERT INTO CUST values (702,'MIKE and SAM inc.','Kingston','A',NULL,107);
INSERT INTO CUST values (703,'RED PLANET','Mississauga','C',NULL,107);
INSERT INTO CUST values (717,'BLUE SKY LTD','Regina','D',NULL,102);

SELECT * FROM CUST;

CREATE TABLE GOODCUST(
    CustId,
    Name,
    Location,
    Repid
    ) AS (
    SELECT CUST#,
        custname,
        city,
        salesrep#
    FROM CUST
    WHERE RATING IN('A','B')
    );

SELECT * FROM GOODCUST;


DESC SALESREPS;
DESC GOODCUST;

ALTER TABLE salesreps ADD JOBCODE VARCHAR(12);

ALTER TABLE salesreps MODIFY salary NOT NULL;
ALTER TABLE salesreps MODIFY salary NULL;
ALTER TABLE GOODCUST MODIFY location NULL;

ALTER TABLE SALESREPS MODIFY FName VARCHAR2(37);

SELECT MAX(length(name))
FROM goodcust
WHERE length(name)>any(select length(name)from goodcust);

ALTER TABLE goodcust modify name varchar2(17);

ALTER TABLE salesreps set unused(jobcode);

SELECt * FROM salesreps;


  
CREATE TABLE SALESREP (
          REP_ID,FNAME,
          LNAME NOT NULL,
          PHONE_NUMBER,
          SALARY,
          COMMISSION
          ) 
  AS(SELECT  EMPLOYEE_ID,
          FIRST_NAME, 
          LAST_NAME,
          PHONE_NUMBER,
          SALARY,
          COMMISSION_PCT
  FROM EMPLOYEES
  WHERE DEPARTMENT_ID = 80);

DROP TABLE SALESREP;

SELECT * FROM salesrep;
Alter table salesrep
Add constraint salesrep_pk primary key (REP_ID);

DESC salesrep;

ALTER TABLE salesrep MODIFY FNAME varchar2(37);

ALTER table GOODCUST ADD constraint GOODCUST_FK primary KEY(custid);

ALTER table GOODCUST ADD constraint GOODCUST_UK unique(name);
ALTER table salesrep ADD constraint salresss_UK unique(phone_number);

SELECT * FROM GOODCUST;
SELECT * FROM salesrep;

ALTER table salesrep add constraint sales_com_ck check (commission<=.50);
ALTER table salesrep add constraint saaal_ck check (salary between 3000 and 12000);

SELECT constraint_name, constraint_type, search_condition, table_name
FROM user_constraints
WHERE table_name IN('SALESREP','GOODCUST')
oRDER BY 4, 2;
