use cs038;
create table Student(
snum int,
sname varchar(20),
major varchar(20),
lvl varchar(20),
age int,
primary key(snum)
);
create table Faculty(
fid int,
fname varchar(20),
deptid int,
primary key(fid)
);
create table Class(
cname varchar(20),
meets_at time,
room varchar(20),
fid int ,
primary key(cname),
foreign key(fid) references Faculty(fid)
);
create table Enrolled(
snum int,
cname varchar(20),
primary key(snum,cname),
foreign key(snum) references Student(snum),
foreign key(cname) references Class(cname)
);
insert into Student
values
(1,"Jai","COA","SJ",18),
(2,"Jain","MP","JR",19),
(3,"Arun","DS","SR",21),
(4,"Harsha","JAVA","SS",22);
insert into Faculty
values
(2774,"NV",1),
(2874,"NM",10),
(2794,"PM",11),
(2704,"KV",100);
insert into Class
values
("3-A", "03:00:00","C-207",2774),
("4-A", "04:00:00","C-207",2874),
("5-A", "03:00:00","C-208",2794),
("6-A", "05:00:00","C-207",2704);
insert into Enrolled
values
(1,"3-A"),
(2,"4-A"),
(3,"5-A"),
(4,"6-A");

select distinct sname 
   from student s,class c,enrolled e,faculty f
   where s.snum = e.snum and e.cname = c.cname and c.fid = f.fid and f.fname = 'NV' and s.lvl = 'jr';
select c.cname  
   from class c
   where c.room = 'C-207'
   or c.cname in (select e.cname from enrolled e group by e.cname having count(*) >= 5);
select distinct sname
   from student s
   where s.snum in (select e1.snum
   from enrolled e1,enrolled e2,class c1,class c2
   where e1.snum=e2.snum and e1.cname=c1.cname and e2.cname=c2.cname and c1.meets_at='11:15:02');
select distinct f.fname
   from faculty f
   where not exists((select c.room from class c)
   minus
   (select c1.room from class c1 where c1.fid=f.fid));
select distinct fname 
   from faculty f where 5>(select count(e.snum)
   from class c,enrolled e where c.cname=e.cname and c.fid=f.fid);
select distinct sname 
   from student s
   where s.snum not in(select e.snum from enrolled e);
select s.age,s.lvl 
   from student s
   group by s.age,s.lvl
   having s.lvl in(select s1.lvl from student s1 where s1.age=s.age
                   group by s1.lvl,s1.age
                   having count(*)>=all(select count(*)
                   from student s2 where s1.age=s2.age group by s2.lvl,s2.age));
