create database cs038;
use cs038;

create table person(
driver_id varchar(30),
name varchar(30),
address varchar(100),
PRIMARY KEY(driver_id));
insert into person values('a01','richard','srinivas nagar'),('a02','pradeep','rajaji nagar'),('a03','smith','ashok nagar'),('a04','venu','n r colony'),('a05','jhon','hanumanth nagar'); 
select * from person;
create table car(
reg_num varchar(30),
model varchar(30),
year int,
PRIMARY KEY(reg_num)
);
insert into car values('ka052250','indica',1990),('ka031181','lancer',1957),('ka095477','toyota',1998),('ka053408','honda',2008),('ka041702','audi',2005);
select * from car;
create table owns(
driver_id varchar(30),
reg_num varchar(30),
FOREIGN KEY(driver_id) REFERENCES person(driver_id),
FOREIGN KEY(reg_num) REFERENCES car(reg_num)
);
insert into owns values('a01','ka052250'),('a02','ka053408'),('a03','ka031181'),('a04','ka095477'),('a05','ka041702');
select * from owns;
create table accident(
report_num int,
accident_date date,
location varchar(30),
PRIMARY KEY(report_num)
);
insert into accident values(11,'2003-01-01','mysore road'),(12,'2004-02-02','south end circle'),(13,'2003-01-21','bull temple road'),(14,'2008-02-17','mysore road'),(15,'2005-03-04','kanakapura road');
select * from accident;
create table participated(
driver_id varchar(30),
reg_num varchar(30),
report_num int,
damage_amount int,
PRIMARY KEY(report_num),
FOREIGN KEY(driver_id) REFERENCES person(driver_id),
FOREIGN KEY(reg_num) REFERENCES car(reg_num),
FOREIGN KEY(report_num) REFERENCES accident(report_num)
);
insert into participated values('a01','ka052250',11,10000),('a02','ka053408',12,50000),('a03','ka095477',13,25000),('a04','ka031181',14,3000),('a05','ka041702',15,5000);
select * from participated;



use csedb1_1bm18cs045;
update participated
SET damage_amount=25000
WHERE report_num=12 AND reg_num='ka053408';
select * from participated;
delete from accident
WHERE report_num=20;
select * from accident;
select count(distinct driver_id)
FROM accident,participated
WHERE accident.report_num=participated.report_num
AND accident_date LIKE '2008%';
select count(distinct model)
FROM car,accident,participated
WHERE participated.reg_num=car.reg_num;
