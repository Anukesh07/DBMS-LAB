use 1bm18cs038;
create table supplier(
sid int,
sname varchar(20),
city varchar(20),
primary key(sid)
);
create table parts(
pid int,
pname varchar(20),
color varchar(20),
primary key(pid)
);
create table catalog(
sid int,
pid int,
cost int,
primary key(sid,pid),
foreign key(sid) references supplier(sid) on delete cascade,
foreign key(pid) references parts(pid) on delete cascade
);
insert into supplier
values(10001,"acme widget","bangalore"),
(10002,"johns","kolkata"),
(10003,"vimal","mumbai"),
(10004,"reliance","delhi");
insert into parts
values(20001,"book","red"),
(20002,"pen","red"),
(20003,"pencil","green"),
(20004,"moblie","green"),
(20005,"charger","black");
insert into catalog
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
from catalog,parts
where catalog.pid=parts.pid and parts.color="red" or parts.color="green";
select catalog.sid
from supplier,parts,catalog
where supplier.sid=catalog.sid and catalog.pid=parts.pid and (parts.color="red" or supplier.city="bangalore");
select c1.sid
from catalog c1,catalog c2
where c1.pid=c2.pid and c1.cost>c2.cost;
