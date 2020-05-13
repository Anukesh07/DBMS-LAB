CREATE DATABASE cs038;
use cs038;

create table Person(
driver_id varchar(30),
name varchar(30),
address varchar(100),
PRIMARY KEY(driver_id));
insert into Person values('A01','Richard','Srinivas nagar'),('A02','Pradeep','Rajaji nagar'),('A03','Smith','Ashok nagar'),('A04','Venu','N R Colony'),('A05','Jhon','Hanumanth nagar'); 
select * from Person;
create table Car(
reg_num varchar(30),
model varchar(30),
year int,
PRIMARY KEY(reg_num)
);
insert into Car values('KA052250','Indica',1990),('KA031181','Lancer',1957),('KA095477','Toyota',1998),('KA053408','Honda',2008),('KA041702','Audi',2005);
select * from Car;
create table Owns(
driver_id varchar(30),
reg_num varchar(30),
FOREIGN KEY(driver_id) REFERENCES person(driver_id),
FOREIGN KEY(reg_num) REFERENCES car(reg_num)
);
insert into Owns values('A01','KA052250'),('A02','KA053408'),('A03','KA031181'),('A04','KA095477'),('A05','KA041702');
select * from Owns;
create table Accident(
report_num int,
accident_date date,
location varchar(30),
PRIMARY KEY(report_num)
);
insert into Accident values(11,'2003-01-01','Mysore Road'),(12,'2004-02-02','South end Circle'),(13,'2003-01-21','Bull temple Road'),(14,'2008-02-17','Mysore Road'),(15,'2005-03-04','Kanakapura Road');
select * from Accident;
create table Participated(
driver_id varchar(30),
reg_num varchar(30),
report_num int,
damage_amount int,
PRIMARY KEY(report_num),
FOREIGN KEY(driver_id) REFERENCES person(driver_id),
FOREIGN KEY(reg_num) REFERENCES car(reg_num),
FOREIGN KEY(report_num) REFERENCES accident(report_num)
);
insert into Participated values('A01','KA052250',11,10000),('A02','KA053408',12,50000),('A03','KA095477',13,25000),('A04','KA031181',14,3000),('A05','KA041702',15,5000);
select * from Participated;
update Participated
SET damage_amount=25000
WHERE report_num=12 AND reg_num='KA053408';
select * from Participated;
delete from Accident
WHERE report_num=20;
select * from Accident;
select count(distinct driver_id)
FROM Accident,Participated
WHERE Accident.report_num=Participated.report_num
AND accident_date LIKE '2008%';
select count(distinct model)
FROM Car,Accident,Participated
WHERE Participated.reg_num=Car.reg_num;