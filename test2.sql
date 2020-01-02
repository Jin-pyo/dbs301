REGION [REGION_ID, REGION_NAME]
    DIV [DIVISION_ID, DIVISION_NAME, REGION_ID (FK)]
    WHS [WAREHOUSE_ID, CITY, rating, FOUND_DATE, DIVISION_ID (FK)]
    EMP [EMPLOYEE_ID, ENAME, JOB, SAL, COMM, DIVISION_ID (FK)]
    SEC [WAREHOUSE_ID (FK), SECTION_ID, DESCRIPTION, capacity]

/* Answer 3 */
CREATE TABLE REGION
(
    REGION_ID number(2),
    REGION_NAME char(20) NOT NULL unique,
    CONSTRAINT region_pk PRIMARY KEY(REGION_ID)
);
/* Answer 4 */
ALTER TABLE SEC ADD CONSTRAINT sec_pk PRIMARY KEY(SECTION_ID);
/* Answer 4 prof */
alter table sec
    add constraint sec_warehouse_id_section_id_pk
    primary key(warehouse_id, section_id);

/* Answer 5 */
ALTER TABLE SEC 
ADD CONSTRAINT sec_FK 
FOREIGN KEY (WAREHOUSE_ID) REFERENCES WHS(WAREHOUSE_ID);

/* Answer 6 */
INSERT INTO SEC VALUES(402,3,'JINPYO',2000);

/* Answer 7 */
DESC REGION;

/* Answer 8 */
SELECT * FROM SEC;

/* Answer 9 */
CREATE sequence whse_SEQ
START WITH 500
INCREMENT BY 2
MAXVALUE 600
cache 20;

/* Answer 10 */
INSERT INTO WHS values(whse_seq.nextval,'Hamilton','',sysdate,60);
INSERT INTO WHS values(whse_seq.nextval,'Niagara Fall','A',sysdate,60);
INSERT INTO WHS values(whse_seq.nextval,'Quebec','G',sysdate,60);


/* Answer 11 */
/* delete fk first*/
alter table sec drop constraint sec_fk;
DELETE FROM WHS WHERE UPPER(rating)='A';

/* Answer 12 */
SELECT * FROM WHSE;

/* Answer 13 */
CREATE TABLE MANAGERS AS
(
    SELECT *
    FROM EMP
    WHERE UPPER(JOB)=UPPER('MANAGER')
);

/* Answer 14 */
SELECT * FROM managers;

/* Answer 15 */
ROLLBACK to SAVEPOINT Delete_Done;

/* Answer 16 */
 create view manView as
    select
      e2.ename "Manager_Name",
      d2.division_name "Manager Division name",
      e1.ename "Employee Name",
      d1.division_name "Employee Division Name"
    from emp e1
    join div d1 using (division_id)
    join emp e2 on (e1.mgr_id = e2.employee_id)
    join div d2 on (e2.division_id = d2.division_id);

/* Answer 17 */
SELECT * FROM manView
ORDER BY Manager_name





