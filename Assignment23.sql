/*
Group Information

Jinpyo Ju / ID: wiredbs301_193f13 / 24493246 / NEF
Taewoo Han/ ID: dbs301_193e09 / 21144495 / NEF
Rodrigo Piedade / ID : dbs301_193f26 / 19746450 / NEF
Carlos Falconett/ ID: dbs301_193f08/ 140845181 / NEF
Xiang Wu/ID: dbs301_193f33/ 140852187 / NEF
Gangyeon Lee / ID: dbs301_193e35 / NEF


*/

CREATE TABLE COUNTRY(
    country_cd char(4) primary key,
    country varchar2(40)
);

CREATE TABLE Branches(
    branch_cd char(4) primary key,
    branch varchar(20)
    );
    
CREATE TABLE CUSTOMERS(
    cust_no integer primary key,
    customer varchar2(30),
    site_no char(1),
    country_cd char(4),
    branch_cd char(4),
    address1 varchar2(35),
    address2 varchar2(35),
    city varchar2(20),
    prov_state varchar2(20),
    post_zip varchar2(20),
    phone_no varchar2(20),
    fax_no varchar2(20),
    contact varchar2(25)
);

CREATE TABLE REPS(
    rep_no integer primary key,
    rep_name varchar2(25),
    sales_2018 decimal(9,2)
    );
    
CREATE TABLE ORDERS(
    order_no integer primary key,
    rep_no integer,
    cust_no integer,
    order_dt char(11),
    channel varchar2(15),
    comments varchar2(30)
);

CREATE TABLE ORDERLINES(
    order_no integer,
    line_no integer,
    prod_no integer,
    price decimal(5,2),
    qty integer,
    CONSTRAINT orderlines_orderNo_prodNo_pk primary key(order_no,prod_no)
);

CREATE TABLE PRODUCTS(
    prod_no integer primary key,
    prod_line varchar2(20),
    prod_type varchar2(20),
    product varchar2(30),
    prod_cost decimal(5,2),
    prod_price decimal(5,2),
    status char(1),
    pricture varchar2(10)
);

CREATE TABLE SUPPLIER(
    supplier_id integer primary key,
    supplier_name varchar2(50),
    supplier_street varchar2(50),
    supplier_city varchar2(25),
    supplier_postal_zip varchar2(20),
    supplier_sales_rep varchar2(50),
    supplier_phone varchar2(21),
    supplier_terms varchar2(20)
);


ALTER TABLE customers ADD CONSTRAINT cust_country_cd_fk foreign key (country_cd) references country(country_cd);
ALTER TABLE customers ADD CONSTRAINT cust_branch_cd_fk foreign key (branch_cd) references Branches(branch_cd);


ALTER TABLE orders ADD CONSTRAINT orders_cust_no_fk foreign key (cust_no) references CUSTOMERS(cust_no);

ALTER TABLE orders ADD CONSTRAINT orders_rep_no_fk foreign key (rep_no) references reps(rep_no);

ALTER TABLE ORDERLINES ADD CONSTRAINT ORDERL_order_no_fk foreign key(order_no) references orders(order_no);
ALTER TABLE ORDERLINES ADD CONSTRAINT ORDERL_prod_no_fk foreign key(prod_no) references products(prod_no);




INSERT ALL
INTO country VALUES('CAN', 'Canada')
INTO country VALUES('USA', 'United States')
INTO country VALUES('AUS', 'Australia')
INTO country VALUES('BEL', 'Belgium')
INTO country VALUES('BRA', 'Brazil')
INTO country VALUES('CHI', 'Chile')
INTO country VALUES('CHN', 'China')
INTO country VALUES('JAP', 'Japan')
INTO country VALUES('KOR', 'South Korea')
INTO country VALUES('MEX', 'Mexico')
select 1 from dual;


INSERT ALL
INTO branches VALUES('MTL', 'Montreal, Que')
INTO branches VALUES('BOS', 'Boston, MA')
INTO branches VALUES('VAN', 'Vancouver, BC')
INTO branches VALUES('SFR', 'San Fran., CA')
INTO branches VALUES('TOR', 'Toronto, Ont')
INTO branches VALUES('CHG', 'Chicago, IL')
INTO branches VALUES('DAL', 'Dallas, TX')
INTO branches VALUES('DEN', 'Denver, CO')
INTO branches VALUES('FRNK', 'Frankfurt, Ger')
INTO branches VALUES('LA', 'Los Angeles, CA')
select 1 from dual;

INSERT ALL
INTO customers VALUES(1000, 'Go Outlet Montrel 1', '1', 'CAN', 'MTL', '500 Place d`Armes', 'Suite 1061', 'Montreal', 'Quebec', 'H2Y 2W2', '5142780993', '5142789000', 'Martine Vachon')
INTO customers VALUES(1001, 'GO Outlet Montreal 2', '2', 'CAN', 'MTL', '500 Piux IX', NULL, 'Montreal', 'Quebec', 'H2Y 2B2', '5142220993', '5142229000', 'Paul Martin')
INTO customers VALUES(1002, 'Ultra Sports 5', '1', 'USA', 'BOS', '4770 Duke Drive', 'Suite 201', 'Boston', 'Massachusetts', '01803-5235', '6174450917', '6172330762', 'Martha Burke')
INTO customers VALUES(1003, 'Vacation Central 5', '1', 'CAN', 'VAN', '1166 Alberi Street', 'Suite 1505', 'Burnaby', 'British Columbia', 'V6E 3Z3', '6046820446', '6046823005', 'Jeffrey Vales')
INTO customers VALUES(1004, 'Mountain Madness 5', '1', 'USA', 'SFR', '45 Stateside Gardens', 'Main Floor', 'San Francisco', 'California', '90288-1277', '4153851634', '4153851275', 'Janet Harrison')
INTO customers VALUES(1005, 'GO Outlet Boston', '1', 'USA', 'BOS', '453 Old Creek Road', '12th Floor', 'Boston', 'Massachusetts', '01803-6540', '6175552345', '6175553453', 'Donald Taylor')
select 1 from dual;

INSERT INTO customers values(1006,'Bergsteiger G.m.b.H.','3','CAN','MTL','L0yoner Strasse 14',null,'Frankfurt',null,'60386','49696666802','49696661061','Wolfgang Steinhammer');
INSERT INTO customers values(1007,'Backwoods Equipment(Rom)','5','USA','BOS','1020 Pacific Highway','Suite 118','Sydney','NSW','2255','6124778899','6124331542','Jake Jenkins');
INSERT INTO customers values(1008,'Botanechi K.K.','5','USA','BOS','60F Green Life Building','2-21-12 Sasazuka','Tokyo',null,'151','81353900600','81353115403','Shujimo Yamataki');
INSERT INTO customers values(1038,'GO Outlet Kista AB','5','CAN','MTL','V0illagatan 45 II',null,'Stockholm',null,'114 57','468663442','468666775','Kirsten Johannsson');





INSERT ALL
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(1, 'Bjorn Flertjan', 30602)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(3, 'Gus Grovlin', 59996)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(4, 'Bill Smertal', 28707)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(5, 'Dave Mustaine', 42624)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(6, 'Henry Harve', 28683)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(7, 'Henri LeDuce', 47218)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(9, 'Kurt Gruber', 71753)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(11, 'Miguel Sanchez', 71733)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(12, 'Dan Chancevente', 7876)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(14, 'Greg Torson', 23156)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(15, 'Chris Cornel', 12787)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(16, 'Bill Gibbons', 54675)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(17, 'Russ Pallomine', 0)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(18, 'Lyn Jacobs', 46739)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(19, 'Sally Strandherst', 37861)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(21, 'Thomas Brigade', 26258)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(22, 'Jane Litrand', 36390)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(23, 'Tony Armarillo', 40173)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(24, 'Matt Casgot', 45864)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(25, 'Gilles Turcotte', 25386)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(26, 'Francoise LeBlanc', 24426)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(27, 'Carlos Rodriguez', 16796)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(28, 'Malcom Young', 36726)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(29, 'Charles Loo Nam', 12003)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(30, 'Lee Chan', 8965)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(33, 'Torey Wandiko', 8398)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(34, 'Kaley Gregson', 43733)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(35, 'Hari Krain', 42203)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(36, 'Ingrid Termede', 17889)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(39, 'Lisa Testorok', 21273)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(40, 'Marthe Whiteduck', 47529)
INTO REPS (REP_NO, REP_NAME, SALES_2018) VALUES(41, 'Inigo Montoya', 7320)
select 1 from dual;


INSERT ALL
INTO ORDERS (ORDER_NO, REP_NO, CUST_NO, ORDER_DT, CHANNEL) VALUES(24, 7, 1001, '07-Apr-08', 'Internet Orders')
INTO ORDERS (ORDER_NO, REP_NO, CUST_NO, ORDER_DT, CHANNEL) VALUES(67, 7, 1001, '26-Aug-08', 'Internet Orders')
INTO ORDERS (ORDER_NO, REP_NO, CUST_NO, ORDER_DT, CHANNEL) VALUES(115, 23, 1004, '02-Dec-08', 'Telephone Sales')
INTO ORDERS (ORDER_NO, REP_NO, CUST_NO, ORDER_DT, CHANNEL) VALUES(132, 14, 1005, '02-Feb-09', 'Telephone Sales')
INTO ORDERS (ORDER_NO, REP_NO, CUST_NO, ORDER_DT, CHANNEL) VALUES(153, 14, 1005, '22-Mar-09', 'Mail Sales')
INTO ORDERS (ORDER_NO, REP_NO, CUST_NO, ORDER_DT, CHANNEL) VALUES(196, 5, 1004, '20-Jul-09', 'Internet Orders')
INTO ORDERS (ORDER_NO, REP_NO, CUST_NO, ORDER_DT, CHANNEL) VALUES(256, 14, 1005, '05-Dec-09', 'Internet Orders')
INTO ORDERS (ORDER_NO, REP_NO, CUST_NO, ORDER_DT, CHANNEL) VALUES(318, 16, 1038, '09-Apr-10', 'Internet Orders')
select 1 from dual;



/* ================================================*/
INSERT INTO products VALUES( 40100,'Outdoor Products','Tents','Star Lite',130,165,'A','P40100');
INSERT INTO products VALUES( 40101,'Outdoor Products','Tents','Star Gazer-2',343,518,'A','P40101');
INSERT INTO products VALUES( 40102,'Outdoor Products','Tents','Star Gazer-3',370,555,'A','P40102');    	
INSERT INTO products VALUES( 40103,'Outdoor Products','Tents','StarDome',410,615,'A','P40103'); 	  	
INSERT INTO products VALUES( 40200,'Outdoor Products','Sleeping Bags','MoonBeam',80,120,'A','P40200');     	
INSERT INTO products VALUES( 40201,'Outdoor Products','Sleeping Bags','MoonGlow',86,129,'A','P40201'); 	
INSERT INTO products VALUES( 40202,'Outdoor Products','Sleeping Bags','MoonLite',56,84,'A','P40202');
INSERT INTO products VALUES( 40300,'Outdoor Products','Back Packs','Day Tripper',9,14,'A','P40300'); 	
INSERT INTO products VALUES( 40301,'Outdoor Products','Back Packs','Pack n` Hike',88,131,'A','P40301');   	
INSERT INTO products VALUES( 40302,'Outdoor Products','Back Packs','GO Small Waist Pack',12,18,'A','P40302');	
INSERT INTO products VALUES( 40303,'Outdoor Products','Back Packs','GO Large Waist Pack',16,24,'A','P40303');
INSERT INTO products VALUES( 40400,'Outdoor Products','Cooking Equipment','Dover-1',43,65,'A','P40400');    	
INSERT INTO products VALUES( 40401,'Outdoor Products','Cooking Equipment','Dover-2',74,111,'A','P40401');
INSERT INTO products VALUES( 40402,'Outdoor Products','Cooking Equipment','GO Cookset',36,54,'A','P40402');
INSERT INTO products VALUES( 40403,'Outdoor Products','Cooking Equipment','GO Camp Kettle',14,21,'A','P40403');
INSERT INTO products VALUES( 50100,'GO Sport Line','Carry-Bags','GO Sport  Bag',14,28,'A','P50100');
INSERT INTO products VALUES( 50101,'GO Sport Line','Carry-Bags','GO Ski Gear Bag',16,32,'A','P50101');
INSERT INTO products VALUES( 50102,'GO Sport Line','Carry-Bags','GO Duffel Bag',28,56,'A','P50102');
INSERT INTO products VALUES( 50201,'GO Sport Line','Sport Wear','GO Headband',5,10,'A','P50201');
INSERT INTO products VALUES( 50202,'GO Sport Line','Sport Wear','GO Wristband',4,8,'A','P50202');    	
INSERT INTO products VALUES( 50203,'GO Sport Line','Sport Wear','GO Water Bottle',4,8,'A','P50203');    	
INSERT INTO products VALUES( 60100,'Environmental Line','Alert Devices','Pocket U.V. Alerter',3,9,'A','P60100');    	
INSERT INTO products VALUES( 60101,'Environmental Line','Alert Devices','Microwave Detective',4,12,'A','P60101');
INSERT INTO products VALUES( 60102,'Environmental Line','Alert Devices','Pocket Radon Alerter',13,39,'A','P60102');
INSERT INTO products VALUES( 60200,'Environmental Line','Recycled Products','EnviroSak',2,6,'A','P60200');
INSERT INTO products VALUES( 60201,'Environmental Line','Recycled Products','Enviro-Kit',4,12,'A','P60201');    	
INSERT INTO products VALUES( 60202,'Environmental Line','Recycled Products','Enviro-T',10,30,'A','P60202');
INSERT INTO products VALUES( 60300,'Environmental Line','Bio-Friendly Soaps','RiverKind Shampoo',3,9,'A','P60300');
INSERT INTO products VALUES( 60301,'Environmental Line','Bio-Friendly Soaps','RiverKind Soap',4,11,'A','P60301');
INSERT INTO products VALUES( 60302,'Environmental Line','Bio-Friendly Soaps','RiverKind Detergent',2,6,'A','P60302');    	
INSERT INTO products VALUES( 60400,'Environmental Line','Sunblock','Sun Shelter-8',2,6,'A','P60400');
INSERT INTO products VALUES( 60401,'Environmental Line','Sunblock','Sun Shelter-15',3,9,'A','P60401');
INSERT INTO products VALUES( 60402,'Environmental Line','Sunblock','Sun Shelter-30',3,9,'A','P60402');    	
INSERT INTO products VALUES( 60500,'Environmental Line','Water Purifiers','Pro-Lite Water Filter',55,165,'A','P60500');    	
INSERT INTO products VALUES( 60501,'Environmental Line','Water Purifiers','Pocket Water Filter',90,270,'A','P60501');

INSERT ALL
INTO orderlines VALUES(24, 1, 40101, 518, 2)
INTO orderlines VALUES(24, 2, 40401, 111, 37)
INTO orderlines VALUES(24, 3, 40402, 54, 62)
INTO orderlines VALUES(24, 4, 60300, 11, 10)
INTO orderlines VALUES(132, 1, 60300, 11, 165)
INTO orderlines VALUES(132, 2, 60101, 13, 77)
INTO orderlines VALUES(132, 3, 50202, 9, 80)
INTO orderlines VALUES(132, 4, 40101, 111, 10)
INTO orderlines VALUES(153, 2, 40401, 111, 37)
INTO orderlines VALUES(153, 3, 40402, 54, 62)
SELECT 1 FROM dual;


ALTER TABLE PRODUCTS ADD SID integer;

ALTER TABLE products ADD CONSTRAINT prod_sid_fk foreign key(sid) references SUPPLIER(supplier_id);

INSERT INTO supplier VALUES(1,'NG Outdoor Supplier','125 Hilltop Grove','Mississauga','M2D3T3',NULL,'905 876 1234','2/10 net30');


SELECT * from supplier;

SELECT * FROM PRODUCTS;

UPDATE products SET sid=1;

/* It fails because sid can't find value from parents table(supplier)*/
/*INSERT INTO products VALUES( 75502,'Envirental Line','WaPurifiers','Pot Water Filter',90,270,'A','P60501',2);*/

UPDATE reps SET rep_name='Taewoo' WHERE rep_no=1; 
UPDATE reps SET rep_name='Jinpyo' WHERE rep_no=3; 
UPDATE reps SET rep_name='Xiang' WHERE rep_no=4; 
UPDATE reps SET rep_name='Rodrigo' WHERE rep_no=5; 
UPDATE reps SET rep_name='Carlos' WHERE rep_no=6; 
UPDATE reps SET rep_name='Gangyeon' WHERE rep_no=7; 

SELECT * FROM reps;



CREATE VIEW DBS_ASSIGNMENT2_3 AS(
    SELECT cust_no,
            customer,
            order_no,
            rep_name,
            sum(price*qty) AS "total dollars"
    from customers JOIN orders USING(cust_no)
    JOIN reps USING(rep_no)
    JOIN orderlines USING(order_no)
    group by cust_no,customer,order_no,rep_name
    );

SELECT * FROM DBS_ASSIGNMENT2_3;
