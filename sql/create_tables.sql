-- create_tables.sql  -- for mysql only

-- Each Product has 
--  one ProductIdentifier, one DescriptiveDetail...
DROP TABLE IF EXISTS Product;
CREATE TABLE Product (
	ID INTEGER primary key auto_increment,
	Reference VARCHAR(100) unique NOT NULL, -- RecordReference
	IdentifierID integer NOT NULL references ProductIdentifier(ID),
	DescDetailID integer NOT NULL references DescriptiveDetail(ID)
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
	DescriptiveDetailID integer NOT NULL references DescriptiveDetail(ID),
	FormDetail char(4) -- a letter followed by 3 digits
);


-- A DescriptiveDetail has a ProductForm can have many ProductFormFeatures.
drop table if exists ProductFormFeature;
create table ProductFormFeature (
	ID integer primary key auto_increment,
	DescriptiveDetailID integer NOT NULL references ProductForm(ID),
	FeatureType 	int(2),
	FeatureValue 	varchar(20), -- code used depends on FeatureType, add check functions in the model
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

-- May use this to validate the Codes from the .csv file of code list values
drop table if exists CodeList;
CREATE TABLE CodeList (
	Number INT(2),
	Value CHAR(4),
	Description VARCHAR(100),
	Notes TEXT,
	IssueNumber int(3),
	primary key (Number, Value)
)  ;


-- Product has a ProductSupply for each market (and there can be many markets)
-- Product has many ProductSupply , ProductSupply belongs to a Product
-- Required, unless NotificationType is Update
drop table if exists ProductSupply;
create table ProductSupply (
	ID integer primary key auto_increment,
	productID integer NOT NULL references Product(ID)
);

-- a ProductSupply has many SupplyDetails
drop table if exists SupplyDetail;
create table SupplyDetail (
	ID integer primary key auto_increment,
	ProductSupplyID integer NOT NULL references ProductSupply(ID),
	SupplierID integer references Supplier(ID),
	ProductAvailability int(2) NOT NULL -- code list 65	
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
	SupplierID integer NOT NULL references Supplier(ID),
	TypeCode int(2), -- code list 92
	TypeName varchar(50),  -- Read doc for this later
	IDValue	varchar(255) -- depends on the TypeCode	
);

drop table  if exists OnOrderDetail;
create table OnOrderDetail (
	ID integer primary key auto_increment,
	SupplyDetailID integer NOT NULL references SupplyDetail(ID),
	ShipmentExpectedDate date -- format YYYYMMDD, unless format is specified
);

-- SupplyDetail can have more than one SupplyDate
-- For now, store the date and the date format (or just assume default format)
-- To Do: Convert the String into a DateTime and store it.
drop table if exists SupplyDate;
create table SupplyDate (
	ID integer primary key auto_increment,
	SupplyDetailID integer NOT NULL references SupplyDetail(ID),
	SupplyDateRole int(2), -- List 166, 08 is code for Expected Availability Date
	Date varchar(12)  -- maybe DateTime or Varchar.. need to see docs and decide
);

-- Stock has many OnHand, but only one or zero OnOrder
-- OnHand is mandatory, but can be zero
drop table if exists Stock;
create table Stock (
	ID integer primary key auto_increment,
	SupplyDetailID integer NOT NULL references SupplyDetail(ID),
	OnOrder int(7)
);

drop table if exists OnHand;
create table OnHand (
	ID integer primary key auto_increment,
	StockID integer NOT NULL references Stock(ID),
	OnHand int(7)
);

drop table if exists Price;
create table Price (
	ID integer primary key auto_increment,
	SupplyDetailID integer NOT NULL references SupplyDetail(ID),
	PriceType int(2), -- code list 58	
	PriceAmount decimal(16,4), -- assuming no one uses more decimal points
	CurrencyCode char(3) -- code list 96	
);
