create database cs038;
use cs038;

create table person (
driverid varchar(10),
name varchar(20),
address varchar(50),
primary key(driverid)
);

create table car (
regno varchar(10),
model varchar(10),
year int,
primary key(regno)
);

create table accident (
reportno varchar(10),
accidentdate int,
location varchar(100),
primary key(reportno)
);

create table owns (
driverid varchar(10),
regno varchar(10),
primary key(driverid,regno),
foreign key(driverid) references person (driverid)
);

create table participated (
driverid varchar(10),
regno varchar(10),
reportno varchar(10),
damageamount int, 
primary key (driverid,regno,reportno),
foreign key(driverid) references person (driverid),
foreign key(regno) references car (regno),
foreign key(reportno) references accident (reportno)
);

insert into person values ("001","abc","Blore North"),("002","wxy","Blore South"),
("003","pqr","Blore Urban"),("004","mno","Blore Rural"),("005","hij","Blore Central");

insert into car values ("KA0001","abc",2011),("KA0002","lexus",2005),("KA0003","mazda",2009),
("KA0004","dc",2016),("KA0005","lotus",2019);

insert into owns values ("001","KA0001"),("002","KA0002"),("003","KA0003"),("004","KA0004"),("005","KA0005");

insert into accident values ("11",01-11-00,"kh road"),("22",02-04-10,"kr road"),
("33",03-08-12,"mysore road"),("44",04-03-16,"magadi road"),("55",05-10-19,"kolar road");

insert into participated values ("001","KA0001","11",10000),("002","KA0002","22",25000),
("003","KA0003","33",30000),("004","KA0004","44",40000),("005","KA0005","55",50000);

select * from person;
select * from car;
select * from owns;
select * from accident;
select * from participated;

update participated set damageamount = 25000 where regno = "KA0001" and reportno = "11";
insert into accident values ("15",22-03-2000,"CR road");
select count(distinct driverid) from participated,accident where participated.reportno = accident.reportno and accidentdate like '%00';
select count(participated.reportno) as count from participated,car where participated.regno = car.regno and car.model = 'mazda'; 
