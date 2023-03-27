create table Store
(Store_ID int primary key ,
	Store_Name varchar(50) not null,
	Store_Add varchar(100) not null,
	Store_Manager varchar(50) not null)


create table Products
(Product_Code int primary key,
	Product_Name varchar(50) not null,
	Production_Date date not null,
	Expire_Date date not null)


create table ItemMeasurements 
(Product_Code int not null,
	Measure varchar(20) not null,
	FOREIGN KEY (Product_Code) REFERENCES Products(Product_Code))


create table Customers 
(Customer_ID int primary key,
	Customer_Name varchar(50) not null,
	Customer_Fax varchar(50),
	Customer_Phone varchar(50) not null,
	Customer_Email varchar(50),
	Customer_Website varchar(50))


create table Suppliers 
(Supplier_ID int primary key,
	Supplier_Name varchar(50) not null,
	Supplier_Fax varchar(50),
	Supplier_Phone varchar(50) not null,
	Supplier_Email varchar(50),
	Supplier_Website varchar(50))


create table Store_Products
(Store_ID int,
	Product_Code int,
	ProductTotal_Count int,
	primary key(Store_ID, Product_Code),
	FOREIGN KEY (Store_ID) REFERENCES Store(Store_ID),
	FOREIGN KEY (Product_Code) REFERENCES Products(Product_Code))


create table ImportPermission
(ImpPermission_ID int primary key,
	Store_ID int not null,
	Supplier_ID int not null,
	Permission_Date date not null,
	FOREIGN KEY (Store_ID) REFERENCES Store(Store_ID),
	FOREIGN KEY (Supplier_ID) REFERENCES Suppliers(Supplier_ID))


create table Product_ImpPermission
(ProdPermission_ID int primary key,
	ImpPermission_ID int,
	Product_Code int,
	Product_Count int,
	Production_Date date not null,
	Expire_Date date not null,
	FOREIGN KEY (ImpPermission_ID) REFERENCES ImportPermission(ImpPermission_ID),
	FOREIGN KEY (Product_Code) REFERENCES Products(Product_Code))


create table ExportPermission
(ExpPermission_ID int primary key,
	Store_ID int not null,
	Supplier_ID int not null,
	Permission_Date date not null,
	FOREIGN KEY (Store_ID) REFERENCES Store(Store_ID),
	FOREIGN KEY (Supplier_ID) REFERENCES Suppliers(Supplier_ID))


create table Product_ExpPermission
(ProdPermission_ID int primary key,
	ExpPermission_ID int,
	Product_Code int,
	Product_Count int,
	FOREIGN KEY (ExpPermission_ID) REFERENCES ExportPermission(ExpPermission_ID),
	FOREIGN KEY (Product_Code) REFERENCES Products(Product_Code))


create table ProductTransfer
(Transfer_ID int primary key,
	FromStore_ID int not null,
	ToStore_ID int not null,
	Supplier_ID int,
	Product_Code int,
	Product_Count int,
	Production_Date date not null,
	Expire_Date date not null,
	FOREIGN KEY (FromStore_ID) REFERENCES Store(Store_ID),
	FOREIGN KEY (ToStore_ID) REFERENCES Store(Store_ID),
	FOREIGN KEY (Supplier_ID) REFERENCES Suppliers(Supplier_ID),
	FOREIGN KEY (Product_Code) REFERENCES Products(Product_Code))



INSERT INTO ItemMeasurements
VALUES (4, '100 ml')

alter table ProductTransfer
add Transfer_Date date 


alter table ItemMeasurements add constraint c1 
	primary key(Product_Code, Measure)


	

