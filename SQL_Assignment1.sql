create database org;
use org;

create table SalesPeople (Snum int primary key, Sname varchar(10) unique, City varchar(60), Comm int);

create table Customers (Cnum int primary key, Cname varchar(50), City varchar(30) not null, Snum int, foreign key(Snum) references SalesPeople(Snum));

create table Orders (Onum int primary key, Amt int, Odate date, Cnum int, Snum int, foreign key(Cnum) references Customers(Cnum), foreign key(Snum) references SalesPeople(Snum));

alter table Orders modify column Amt float8; 

select * from SalesPeople order by Comm asc; 

insert into SalesPeople (Snum, Sname, City, Comm) values(1001,"Peel","London",12),(1002,"Serres","Sanjose",13),(1004,"Motika","London",11),(1007,"Rifkin","Barcelona",15),(1003,"Axelrod","Newyork",10);

select * from Customers;
delete from Customers where Cnum=2001;
delete from Orders where Onum=3001;
select * from Orders;
insert into Customers (Cnum,Cname,City,Snum) values(2001,"Hoffman","London",1001),(2002,"Giovanni","Rome",1003),(2003,"Liu","Sanjose",1002),(2004,"Grass","Berlin",1002),(2006,"Clemens","London",1001),(2008,"Cisneros","Sanjose",1007),(2007,"Pereira","Rome",1004);
insert into Orders(Onum,Amt,Odate,Cnum,Snum) values 
(3001,18.69,'3-10-1990',2008,1007),
(3003,767.19,'3-10-1990',2001,1001),
(3002,1900.10,'3-10-1990',2007,1004),
(3005,5160.45,'3-10-1990',2003,1002),
(3006,1098.16,'3-10-1990',2008,1007),
(3009,1713.23,'4-10-1990',2002,1003),
(3007,75.75,'4-10-1990',2004,1002),
(3008,4273.00,'5-10-1990',2006,1001),
(3010,1309.95,'6-10-1990',2004,1002),
(3011,9891.88,'6-10-1990',2006,1001);

select * from SalesPeople where Sname like 'A%' or Sname like 'a%';

select count(*) from SalesPeople where Sname like 'A%' or Sname like 'a%';

select * from SalesPeople where Snum in (select Snum from Orders where Amt > 2000);

select * from SalesPeople where City='Newyork';

select count(*) from SalesPeople where City='Newyork';

select * from SalesPeople where City in ('London', 'Paris');

Select Count(*),Odate,Snum from Orders Group by Snum,Onum;
