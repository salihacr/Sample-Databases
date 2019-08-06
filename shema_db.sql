CREATE TABLE "Users"(
	"UserID" int(8)IDENTITY(1, 1)NOT NULL,
    "Name" nvarchar(40)NULL,
	"Surname" nvarchar(40)NULL,
	"Address" nvarchar(200)NULL,
	"Email" nvarchar(60)NULL,
    "Gender" nvarchar(10)NULL,
	"Phone" nvarchar(12)NULL,
    "Username" nvarchar(30)NULL,
    "Password" nvarchar(30)NULL,
	CONSTRAINT "PK_Users" PRIMARY KEY  CLUSTERED 
	(
		"UserID"
	)
)
CREATE TABLE "Customers"(
	"CustomerID" int(8)IDENTITY(1, 1)NOT NULL,
	"CompanyName" nvarchar(40)NULL,
	"ContactName" nvarchar(40)NULL,
	"Address" nvarchar(200)NULL,
	"Phone" nvarchar(12)NULL,
	"Email" nvarchar(60)NULL,
	CONSTRAINT "PK_Customers" PRIMARY KEY  CLUSTERED 
	(
		"CustomerID"
	)
)
CREATE TABLE "Products"(
	"ProductID" int(8)IDENTITY(1, 1)NOT NULL,
	"ProductName" nvarchar(40)NULL,
    "Price" float(40)NULL,
	"Category_id" int(8)NULL,
	CONSTRAINT "PK_Products" PRIMARY KEY  CLUSTERED 
	(
		"ProductID"
	)
)
CREATE TABLE "Categories"(
	"CategoryID" int(8)IDENTITY(1, 1)NOT NULL,
	"CategoryName" nvarchar(40)NULL,
	CONSTRAINT "PK_Categories" PRIMARY KEY  CLUSTERED 
	(
		"CategoryID"
	)
)
CREATE TABLE "Stocks"(
	"Quantity" float(40)NULL,
    "Product_id" int(8)NULL
)

CREATE TABLE "Orders"(
	"OrderID" int(8)IDENTITY(1, 1)NOT NULL,
	"OrderDate" DateTime NULL,
    "Status" nvarchar(40)NULL,
	CONSTRAINT "PK_Orders" PRIMARY KEY  CLUSTERED 
	(
		"OrderID"
	)
)

CREATE TABLE "Sales"(
	"SaleID" int(8)IDENTITY(1, 1)NOT NULL,
    "Product_id" int(8)NULL,
	"Customer_id" int(8)NULL,
	CONSTRAINT "PK_Sales" PRIMARY KEY  CLUSTERED 
	(
		"SaleID"
	)
)

CREATE TABLE "Staffs"(
	"StaffID" int(8)IDENTITY(1, 1)NOT NULL,
    "Name" nvarchar(40)NULL,
	"Surname" nvarchar(40)NULL,
	"Adress" nvarchar(200)NULL,
    "BirthDate" Date NULL,
	"Email" nvarchar(60)NULL,
    "Gender" nvarchar(10)NULL,
	"Phone" nvarchar(12)NULL,
	"Department_id" int(8)NULL,
	CONSTRAINT "PK_Staffs" PRIMARY KEY  CLUSTERED 
	(
		"StaffID"
	)
)
CREATE TABLE "Departments"(
	"DepartmentID" int(8)IDENTITY(1, 1)NOT NULL,
    "DepartmentName" nvarchar(60)NULL,
	CONSTRAINT "PK_Departments" PRIMARY KEY  CLUSTERED 
	(
		"DepartmentID"
	)
)


INSERT INTO Users(UserID,Name,Surname,Address,Email,Gender,Phone,Username,Password)
VALUES()

INSERT INTO Customers(CustomerID,CompanyName,ContactName,Address,Phone,Email)
VALUES()

INSERT INTO Products(ProductID,ProductName,Price,Category_id)
VALUES()

INSERT INTO Categories(CategoryID,CategoryName)
VALUES()

INSERT INTO Stocks(Quantity,Product_id)
VALUES()

INSERT INTO Orders(OrderID,OrderDate,Status)
VALUES()

INSERT INTO Sales(SaleID,Product_id,Customer_id)
VALUES()

INSERT INTO Staffs(StaffID,Name,Surname,Adress,BirthDate,Email,Gender,Phone,Department_id)
VALUES()

INSERT INTO Departments(DepartmentID,DepartmentName)
VALUES()