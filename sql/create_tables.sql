-- create_tables.sql

-- Each Product has 
--  one ProductIdentifier
--  one DescriptiveDetail
DROP TABLE IF EXISTS Product;
CREATE TABLE Product (
	ID INTEGER primary key auto_increment,
	Reference VARCHAR(100) unique NOT NULL, -- RecordReference
	IdentifierID integer references ProductIdentifier(ID),
	DescDetailID integer references DescriptiveDetail(ID)
);

DROP TABLE IF EXISTS ProductIdentifier;
create table ProductIdentifier (
	ID integer primary key auto_increment,
	IDTypeCode 	int(2) not null,  -- List 5
	IDTypeName 	varchar(50),
	IDValue	 	varchar(255)  -- depends on the IDTypeCode, ToDo 
);

-- A DescriptiveDetail has a ProductForm can have many FormDetails
drop table if exists FormDetail;
create table FormDetail (
	ID integer primary key auto_increment,
	DescriptiveDetailID integer references DescriptiveDetail(ID),
	FormDetail char(4) -- a letter followed by 3 digits
);


-- A DescriptiveDetail has a ProductForm can have many ProductFormFeatures.
drop table if exists ProductFormFeature;
create table ProductFormFeature (
	ID integer primary key auto_increment,
	DescriptiveDetailID integer references ProductForm(ID),
	FeatureType 	int(2),
	FeatureValue 	char(2), -- code used depends on FeatureType, add check functions in the model
	FeatureDesc 	text(500)
);

DROP TABLE IF EXISTS DescriptiveDetail;
-- Product has one descriptive detail
-- Mandatory unless NotificationType is Update, and this section is not updated
create table DescriptiveDetail (
	ID integer primary key auto_increment,
	CompositionCode int(2) not null,
	FormCode 	char(2) not null
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

-- Product has a ProductSupply for each market (and there can be many markets)
-- Product has many ProductSupply , ProductSupply belongs to a Product
-- Required, unless NotificationType is Update
drop table if exists ProductSupply;
create table ProductSupply (
	ID integer primary key auto_increment,
	productID integer references Product(ID)
);

-- a ProductSupply has many SupplyDetails
drop table if exists SupplyDetail;
create table SupplyDetail (
	ID integer primary key auto_increment,
	ProductSupplyID integer references ProductSupply(ID),
	SupplierID integer references Supplier(ID),
	ProductAvailability int(2) -- code list 65	
);


-- SupplyDetail has one Supplier
drop table if exists Supplier;
create table Supplier (
	ID integer primary key auto_increment,
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


