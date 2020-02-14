create database cs038;
use cs038;
create table Person(
driver_id varchar(20),
names varchar(20),
address varchar(20),
primary key(driver_id)
);
create table Car(
reg_num varchar(20),
model varchar(20),
year int,
primary key(reg_num)
);
create table Owns(
driver_id varchar(20),
reg_num varchar(20),
primary key(driver_id,reg_num),
foreign key(driver_id) references Person(driver_id),
foreign key(reg_num) references Car(reg_num)
);
create table Accident(
report_num int,
accident_date varchar(20),
location varchar(20),
primary key(report_num)
);
create table Participated(
driver_id varchar(20),
reg_num varchar(20),
report_num int,
damage_amount int,
primary key (driver_id,reg_num,report_num),
foreign key(driver_id) references Person(driver_id),
foreign key(reg_num) references Car(reg_num),
foreign key(report_num) references Accident(report_num)
);
insert into Person
values
("A01","Richard","Srinivas Nagar"),
("A02","Pradeep","Rajajinagar"),
("A03","Smith","Ashok Nagar"),
("A04","John","N R Colony"),
("A05","Venu","Hanumanth Nagar");
insert into Car
values
("KA052250","Lancer",1990),
("KA031181","Indica",1957),
("KA095477","Toyota",1998),
("KA053408","Honda",2008),
("KA041702","Audi",2005);
insert into Owns
values
("A01","KA052250"),
("A02","KA053408"),
("A03","KA031181"),
("A04","KA095477"),
("A05","KA041702");
insert into Accident
values
(11,"01-JAN-03","Mysore Road"),
(12,"02-FEB-04","South end circle"),
(13,"21-JAN-03","Bull temple road"),
(14,"17-FEB-08","Mysore road"),
(15,"04-MAR-05","kanakpura Raod");
insert into Participated
values
("A01","KA052250",11,10000),
("A02","KA053408",12,50000),
("A03","KA031181",13,25000),
("A04","KA095477",14,3000),
("A05","KA041702",15,5000);