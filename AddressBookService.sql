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

------ UC4:Update Values in Table ------
update AddressBookTable set Email='vani123@gmail.com' where FirstName='Vanitha';

------ UC5:Delete Values in Table ------
delete AddressBookTable where FirstName='Vanitha';

------ UC6:Retrieve Data using City or State------
select * from AddressBookTable where city='Nellore' or State='AndhraPradesh';

------ UC7:Count of City and State------
Select Count(*) As Count,City,State from AddressBookTable group by City,State;

------ UC8:Sort the name alphabetically using city------
Insert into AddressBookTable 
values('Rahul','P','Kanigiri Road','Pamur','AndhraPradesh',523108,9995559955,'rahul@gamil.com');
select * from AddressBookTable where city='Pamur' order by FirstName;

----------UC9:Add the address book name and type columns-----------
alter table AddressBookTable add AddressBookName varchar(50),RelationType varchar(50);

update AddressBookTable set AddressBookName='Friends',RelationType='Friend' where FirstName='Sameera' ;
update AddressBookTable set AddressBookName ='Family',RelationType ='Family' where zip=523108;

----------UC10:Count the values using address book type -----------
select RelationType,COUNT(RelationType) as Count from AddressBookTable group by RelationType

----------UC11:Insert the values into table for each type -----------
Insert into AddressBookTable 
values('Kalyani','P','CMBT','Chennai','TamilNadu',600068,93839284839,'kalyani@gamil.com','Office','Profession'),
('Harini','K','T-Nagar','Chennai','TamilNadu',600068,83938392848,'harini@gamil.com','Friends','Friend');

---------------UC12:Creating tables for ER Diagram----------------
create table AddressBook
(
AddressBookID int identity(1,1) primary key,
AddressBookName varchar(200)
);
Insert into AddressBook values('Family'),('Friends'),('Office');

create table ContactType
(
AddressBook_ID int,
ContactTypeID int identity(1,1) primary key,
ContactTypeName varchar(200),
foreign key (AddressBook_ID) references AddressBook(AddressBookID)
);
Insert into ContactType values(1,'Family'),(2,'Friend'),(3,'Profession');

create table Contact_Person
(
AddressBook_ID int,
ContactID int identity(1,1) primary key,
FirstName varchar(100),
LastName varchar(100),
Address varchar(250),
City varchar(100),
State varchar(100),
zip BigInt,
PhoneNumber BigInt,
Email varchar(200),
foreign key (AddressBook_ID) references AddressBook(AddressBookID));
Insert into Contact_Person values
(1,'Arjun','A','Nellore Road','Pamur','AndhraPradesh',523108,8858548393,'arjun@gmail.com'),
(1,'Rahul','P','Kanigiri Road','Pamur','AndhraPradesh',523108,9995559955,'rahul@gamil.com'),
(2,'Sameera','S','Magunta Layout','Nellore','AndhraPradesh',524003,8393839475,'sameera@gmail.com'),
(3,'Kalyani','P','CMBT','Chennai','TamilNadu',600068,93839284839,'kalyani@gamil.com'),
(2,'Harini','K','T-Nagar','Chennai','TamilNadu',600068,83938392848,'harini@gamil.com');

select AddressBookName,Concat(FirstName,' ',LastName) as Name,Concat(Address,' ,',City,' ,',State,' ,',zip) as Address,PhoneNumber,Email,ContactTypeName
from AddressBook 
Full JOIN Contact_Person on AddressBookID=Contact_Person.AddressBook_ID 
Full JOIN ContactType on AddressBookID=ContactType.AddressBook_ID;
