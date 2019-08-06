---Big Software CENTRAL---
--- Employee Database---


CREATE TABLE "Departments"(
	"DepartmentID" smallint IDENTITY(1, 1)NOT NULL PRIMARY KEY,
    "DepartmentName" nvarchar(40)NULL
)

CREATE TABLE "Employees"(
	"EmployeeID" smallint IDENTITY(1, 1)NOT NULL PRIMARY KEY,
    "Name" nvarchar(40)NULL,
	"Surname" nvarchar(40)NULL,
	"Adress" nvarchar(200)NULL,
    "BirthDate" Date NULL,
	"Email" nvarchar(60)NULL,
    "Gender" bit NULL,
	"Phone" nvarchar(12)NULL,
    "Salary" smallint NULL,
	"Department_id" smallint NULL FOREIGN KEY REFERENCES Departments(DepartmentID)
)


Insert Departments(DepartmentName) VALUES('Management'),
('Account'),
('Human Resources'), 
('R&D'),
('Marketing')

Insert Employees(Name,Surname,Adress,BirthDate,Email,Gender,Phone,Salary,Department_id) VALUES
('Salih','ACUR','Gebze\Kocaeli','1999-12-25','salih@developer.com','1','5374056041','10000','1'),
('İbrahim','ACUR','Darica\Kocaeli','1975-02-08','ibrahim@developer.com','1','5376892435','8000','4'),
('Salih','ACR','Cayirova\Kocaeli','1978-11-27','acr@developer.com','0','5394589756','12500','2'),
('Harun','ACUR','Izmit\Kocaeli','1999-07-22','harun@developer.com','1','5373254985','6200','5'),
('Hikmet','ACUR','Dilovasi\Kocaeli','1999-02-20','hikmet@developer.com','1','5325492567','5100','3'),
('Burhan','Bilen','Darica\Kocaeli','1999-05-16','burhan@developer.com','1','5339686362','4890','4'),
('Yasar Samet','Alic','Merkez\Kayseri','1999-10-16','yasar@developer.com','1','5339686362','8890','5'),
('Bugra Berkay','Ertugrul','Beysehir\Konya','1999-8-26','berkay@developer.com','1','5339686362','7000','3')

--- Procedures --- 
go
Create or Alter Procedure SP_EmployeeInsert(
	@Name nvarchar(40),
	@Surname nvarchar(40),
	@Adress nvarchar(200),
	@BirthDate Date,
	@Email nvarchar(60),
	@Gender bit,
	@Phone nvarchar(12),
	@Salary smallint,
	@Department_id smallint
)
AS
BEGIN

INSERT INTO Employees(Name,Surname,Adress,BirthDate,Email,Gender,Phone,Salary,Department_id)
VALUES(@Name,@Surname,@Adress,@BirthDate,@Email,@Gender,@Phone,@Salary,@Department_id)

END

go
Create or Alter Procedure SP_EmployeeUpdate(
	@EmployeeID smallint,
	@Name nvarchar(40),
	@Surname nvarchar(40),
	@Adress nvarchar(200),
	@BirthDate Date,
	@Email nvarchar(60),
	@Gender bit,
	@Phone nvarchar(12),
	@Salary smallint,
	@Department_id smallint
)
AS 
	Update Employees
	SET
		Name=@Name,
		Surname=@Surname,
		Adress=@Adress,
		BirthDate=@BirthDate,
		Email=@Email,
		Gender=@Gender,
		Phone=@Phone,
		Salary=@Salary,
		Department_id=@Department_id
WHERE EmployeeID=@EmployeeID

go
Create or Alter Procedure SP_EmployeeDelete(
	@EmployeeID smallint
)
AS 
DELETE FROM Employees WHERE EmployeeID=@EmployeeID

--- Views---

go
Create or Alter VIEW VW_EmployeeDepartment AS
SELECT Name,Surname,Adress,BirthDate,Email,Gender,Phone,Salary,DepartmentName
FROM Departments d
INNER JOIN Employees e ON d.DepartmentID = e.Department_id
