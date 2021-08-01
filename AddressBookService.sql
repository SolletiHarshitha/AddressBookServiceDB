----------------UC1:Create Database----------------
create database AddressBookService;
----------------UC2:Create Table----------------
create table AddressBookTable
(
FirstName varchar(100),
LastName varchar(100),
Address varchar(250),
City varchar(100),
State varchar(100),
zip BigInt,
PhoneNumber BigInt,
Email varchar(200)
)
------ UC3:Insert Values into Table ------
Insert into AddressBookTable(FirstName,LastName,Address,City,State,zip,PhoneNumber,Email) 
values('Arjun','A','Nellore Road','Pamur','AndhraPradesh',523108,8858548393,'arjun@gmail.com'),
('Vanitha','P','Gandhi Nagar','Ongole','AndhraPradesh',523001,9995559955,'vanitha@gamil.com'),
('Sameera','S','Magunta Layout','Nellore','AndhraPradesh',524003,8393839475,'sameera@gmail.com');

