SELECT first_name||' '||last_name AS "FULL NAME"
FROM employees
WHERE salary IN (
    select MIN(salary),department_id
    FROM employees
    GROUP BY department_id);

CREATE VIEW ALLEMPSDATA AS 
SELECT employee_id, last_name, salary, department_id, department_name, city, country_id
FROM employees
JOIN departments USING (department_id)
JOIN locations USING (location_id);

SELECT * FROM ALLEMPSDATA;
SET pagesize 400;

SELECT employee_id,last_name,salary,city
FROM ALLEMPSDATA;

SELECT SUM(salary), city
FROM ALLEMPSDATA
GROUP BY city;

UPDATE ALLEMPSDATA
SET salary=salary+100
WHERE salary IN(
    SELECT MIN(salary)
    FROM ALLEMPSDATA
    GROUP BY department_id);

DELETE FROM ALLEMPSDATA  
WHERE UPPER(last_name)=UPPER('VARGAS');


CREATE VIEW ALLDEPTS AS
SELECT department_id,department_name,city,country_id
FROM departments JOIN locations USING(location_id);

SELECT department_id,department_name,city
FROM ALLDEPTS;

SELECT city, SUM(department_id)
FROM ALLDEPTS
GROUP BY city;

CREATE VIEW ALLDEPTSUMM AS
SELECT department_id,
    DEPARTMENT_NAME,
    COUNT(employee_id) AS"NUMEMP",
    COUNT(salary)AS"NUMSAL",
    SUM(salary)AS"TOTALSAL"
FROM departments JOIN employees USING(department_id)
GROUP BY department_id,DEPARTMENT_NAME;

DROP VIEW ALLDEPTSUMM;


SELECT DEPARTMENT_NAME,NUMEMP
FROM ALLDEPTSUMM
WHERE NUMEMP > (SELECT AVG(NUMEMP)
                FROM ALLDEPTSUMM);


GRANT SELECT ON ALLEMPSDATA TO dbs301_193f33;





