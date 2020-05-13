use cs038;
create table Suppliers(
sid int,
sname varchar(20),
city varchar(20),
primary key(sid)
);
create table Parts(
pid int,
pname varchar(20),
color varchar(20),
primary key(pid)
);
create table Catalog(
sid int,
pid int,
cost int,
primary key(sid,pid),
foreign key(sid) references Suppliers(sid),
foreign key(pid) references Parts(pid)
);
insert into Suppliers
values(10001,"Acme Widget","Bangalore"),
(10002,"Johns","Kolkata"),
(10003,"Vimal","Mumbai"),
(10004,"Reliance","Delhi");
insert into Parts
values(20001,"Book","Red"),
(20002,"Pen","Red"),
(20003,"Pencil","Green"),
(20004,"Moblie","Green"),
(20005,"Charger","Black");
insert into Catalog
values(10001,20001,10),
(10001,20002,10),
(10001,20003,30),
(10001,20004,10),
(10001,20005,10),
(10002,20001,10),
(10002,20002,20),
(10003,20003,30),
(10004,20003,40);
select distinct sid
from Catalog,Parts
where Catalog.pid=Parts.pid and Parts.color="Red" or Parts.color="Green";
select Catalog.sid
from Suppliers,Parts,Catalog
where Suppliers.sid=Catalog.sid and Catalog.pid=Parts.pid and (Parts.color="Red" or Suppliers.city="Bangalore");
select c1.sid
from catalog c1,catalog c2
where c1.pid=c2.pid and c1.cost>c2.cost;
