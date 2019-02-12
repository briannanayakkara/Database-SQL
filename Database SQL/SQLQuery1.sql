use master
if db_id('gorm') is not null
begin
drop database gorm
end

-- Opgave 2

create database gorm 
use gorm

--Opgave 3

create table Ordre(
oderID int IDENTITY(1,1) not null,
Dato date,
Tid int,
Antal int,
Totalpris int,
betalingsfrist date,
Rabatgruppe int,
vareID int
)

insert into Ordre(Dato,Tid,Antal,Totalpris,betalingsfrist,Rabatgruppe,vareID)
values
('2005-02-14',12,4,48,'2006-12-20',3,1),
('2005-02-14',12,5,60,'2006-12-21',3,1),
('2005-12-14',12,2,14,'2006-12-22',3,3),
('2005-02-14',12,3,24,'2006-12-23',3,4),
('2006-09-15',12,77,693,'2006-12-24',4,5)

--Opgave 4

create table Person(
Navn varchar (10) not null,
Vejnavn varchar (10) not null,
Postnr int not null,
Bynavn varchar(20)not null,
ID int IDENTITY (1,1)not null,
Tlf int not null,
Kategori int)

insert into Person(Navn,Vejnavn,Postnr,Bynavn,Tlf,Kategori)
values
('Bo','Kirkevej',4000,'Roskilde',30405060,3),
('Ib','Kirkevej',4000,'Roskilde',20222234,2),
('Karin','Kirkevej',4000,'Roskilde',20222334,3),
('Karin','Lærkevej',3000,'Ølstykke',50501212,2),
('Tulle','Lærkevej',3000,'Ølstykke',50501213,1),
('Bodl','Fuglevej',2200,'Frederiksberg',50501214,2)



--Opgave 5

create table Vare(vareID int IDENTITY(1,1),
Nummer int not null,
Varenavn varchar (20) not null,
Højde int not null,
Vægt int not null,
Pris int not null,
Dato date not null,
datotil int)

insert into Vare (Nummer,Varenavn,Højde,Vægt,Pris,Dato,datotil)
values
(2020,'Banan',12,100,10,'1982-10-10',101182),
(1010,'Æble',4,100,10,'1982-10-10',101182),
(1030,'Letmælk',20,1000,7,'1987-12-12',181287),
(1030,'Sødmælk',20,800,8,'2006-12-12',181206),
(1030,'Ø.letmælk',20,1000,9,'2006-12-12',181206),
(1030,'Ø.Sødmælk',20,1000,10,'2005-11-10',161105),
(1010,'Skummetmælk',20,1000,6,'2005-11-10',161105)

-- opgave 6

select * from Person where Bynavn = 'Roskilde'

-- opgave 7 

select * from Person where Kategori = 1

--opgave 8

select Navn, Bynavn from Person where Kategori = 2

--opgave 9

select * from Ordre where oderID = 1

-- opgave 10

select * from Ordre where oderID = 1 and vareID = 1


-- opgave 11

select * from Ordre where oderID > 1

--opgave 12

select * from Ordre, Vare where oderID > 1 and oderID < 5 and Vægt > 900

-- opgave 13

alter table Ordre 
add P_id int

update Ordre set P_id = 5 where oderID =1
update Ordre set P_id = 5 where oderID =2
update Ordre set P_id = 1 where oderID =3
update Ordre set P_id = 3 where oderID =4
update Ordre set P_id = 6 where oderID =5

select * from Ordre




-- opgave 14

select Navn,Totalpris from Person,Ordre where oderID =1 and ID =1

-- opgave 15 

select * from Person, Ordre, Vare where Ordre.oderID = Vare.vareID and Person.Navn = 'Bo' 

-- opgave 16

select * from Person, Ordre, Vare where Ordre.oderID = Vare.vareID and Person.Navn = 'Tulle' 

--opgave 17 

select * from Person, Ordre, Vare where Ordre.oderID = Vare.vareID and Person.Navn = 'Bo' and Ordre.oderID = Vare.vareID or Person.Navn = 'Bodil'

--opgave 18

update Ordre 
set Totalpris = 400
where oderID = 3 or oderID = 4 

select * from Ordre

--opgave 19

select * from Ordre,Vare,Person where Navn = 'Bo'

--opgave 20

select Navn,Varenavn, sum (Antal) as Antal 
from Person, Vare as V inner join Ordre as O
on V.vareID = O.vareID
group by Navn, Varenavn

-- opgave 21

--update Person
--set Navn ='Poul'
--where ID = 1

select * from Ordre
select * from Person
select * from Vare