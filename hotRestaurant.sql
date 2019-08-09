drop database hotrestaurant;
create database IF NOT EXISTS  hotrestaurant;
use hotrestaurant;
create table IF NOT EXISTS Reservation(
GuestName varchar(30) not null,
Phonenumber varchar(20) not null,
EmailID char(40) not null,
noofGuests int not null,
UniqueID int not null auto_increment primary key 
);

alter table Reservation AUTO_INCREMENT=5100;

create table IF NOT EXISTS ReservationWaitlist(
GuestName varchar(30) not null,
Phonenumber varchar(20) not null,
EmailID char(40) not null,
noofGuests int not null,
WaitListUniqueID int not null auto_increment primary key 
);

ALTER table Reservation ADD dateCreation DATETIME not null default CURRENT_TIMESTAMP ;

ALTER table ReservationWaitlist ADD dateCreation DATETIME not null default CURRENT_TIMESTAMP ;


show create table Reservation; -- To check the data structure 

-- Reservation, CREATE TABLE `Reservation` (
--   `GuestName` varchar(30) NOT NULL,
--   `Phonenumber` varchar(20) NOT NULL,
--   `EmailID` char(40) NOT NULL,
--   `noofGuests` int(11) NOT NULL,
--   `UniqueID` int(11) NOT NULL AUTO_INCREMENT,
--   `dateCreation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
--   PRIMARY KEY (`UniqueID`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=5102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

insert into Reservation values('James','+1 480-217-5223','James@gmail.com',4,default);

insert into Reservation (GuestName,Phonenumber,EmailID,noofGuests) values('Aaron','+1 480-217-5223','Aaron@gmail.com',2);

select * from Reservation; 

update Reservation set Phonenumber='+1 847-975-0129'  where  UniqueID=5101; 

insert into ReservationWaitlist values('Jogi','+1 480-217-5223','jogeskolla@gmail.com',4,default,default);

select * from ReservationWaitlist; 