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
