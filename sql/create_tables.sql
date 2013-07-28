-- create_tables.sql

DROP TABLE IF EXISTS Product;
CREATE TABLE Product (
	ID INTEGER primary key auto_increment,
	Reference VARCHAR(100) unique not null, -- RecordReference
	IdentifierID integer references ProductIdentifier(ID)
);

DROP TABLE IF EXISTS ProductIdentifier;
create table ProductIdentifier (
	ID integer primary key auto_increment,
	IDTypeCode 	int(2) not null,  -- List 5
	IDTypeName 	varchar(50),
	IDValue	 	varchar(255)  -- depends on the IDTypeCode, ToDo 
);


DROP TABLE IF EXISTS ProductForm;
-- part of Descriptive Detail
create table ProductForm (
	ID integer primary key auto_increment,
	CompositionCode int(2) not null,
	FormCode 	char(2) not null,
	FeatureType 	int(2),
	FeatureValue 	char(2), -- code used depends on FeatureType, add check functions in the model
	FeatureDesc 	text(500)
);


DROP TABLE IF EXISTS DescriptiveDetail;
-- Product has one descriptive detail
-- Mandatory unless NotificationType is Update, and this section is not updated
create table DescriptiveDetail (
	ID integer primary key auto_increment,
	FormID integer references ProductForm(ID)
);

drop table if exists CodeList;
CREATE TABLE CodeList (
	Number INT(2),
	Value INT(2),
	Description VARCHAR(100),
	Notes TEXT,
	IssueNumber int(3),
	primary key (Number, Value)
)  ;


drop table if exists SupplierIdentifier;
create table SupplierIdentifier (
	ID integer primary key auto_increment
	
);

-- Product has a ProductSupply for each market
-- Product has many ProductSupply , ProductSupply belongs to a Product
-- Required, unless NotificationType is Update
drop table if exists ProductSupply;
create table ProductSupply (
	ID integer primary key auto_increment,
	productID integer references Product(ID)
);

drop table if exists SupplyDetail;
create table SupplyDetail (
	ID integer primary key auto_increment,
	ProductSupplyID integer references ProductSupply(ID),
	ProductAvailability int(2) -- code list 65	
);


-- SupplyDetail has one Supplier
drop table if exists Supplier;
create table Supplier (
	ID integer primary key auto_increment,
	SupplyDetailID integer references SupplyDetail(ID),
	RoleCode int(2), -- code list 93
	Name varchar(100)
);

-- Supplier must have at least one SupplierIdentifier, or one SupplierName or both
-- Supplier can have more than one SupplierIdentifier
drop table if exists SupplierIdentifier;
create table SupplierIdentifier (
	ID integer primary key auto_increment,
	SupplierID integer references Supplier(ID),
	TypeCode int(2), -- code list 92
	TypeName varchar(50),  -- Read doc for this later
	IDValue	varchar(255) -- depends on the TypeCode	
);

drop table  if exists OnOrderDetail;
create table OnOrderDetail (
	ID integer primary key auto_increment,
	SupplyDetailID integer references SupplyDetail(ID),
	ShipmentExpectedDate date -- format YYYYMMDD, unless format is specified
);


