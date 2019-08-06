--- lOGIN DATABASE ---

Create TABLE "UserDatas"(
	"UserDataID" int IDENTITY(1, 1)NOT NULL PRIMARY KEY,
    "Name" nvarchar(40)NULL,
	"Surname" nvarchar(40)NULL,
	"Email" nvarchar(60)NULL,
    "Gender" nvarchar(10)NULL,
	"Phone" nvarchar(12)NULL
)
Create TABLE "Roles"(
    "RoleID" int NOT NULL PRIMARY KEY,
    "RoleName" nvarchar(15),
)
--- on delete and update cascade ---
Create TABLE "Users"(
    "UserID" int IDENTITY(1, 1)NOT NULL PRIMARY KEY,
    "Username" nvarchar(40)NULL,
    "Password" nvarchar(40)NULL,
    "Role_id" int NULL FOREIGN KEY REFERENCES Roles(RoleID),
	"UserData_id" int NULL FOREIGN KEY REFERENCES UserDatas(UserDataID) ON DELETE CASCADE ON UPDATE CASCADE
)

Insert Roles VALUES
('1','admin'),
('2','user')

Insert UserDatas(Name,Surname,Email,Gender,Phone) VALUES
('Salih','ACUR','salihacur1@gmail.com','Male','5374056041'),
('Salih','ACUR','salihacur1@hotmail.com','Male','5354540415'),
('Salih','ACUR','salihacur@icloud.com','Male','5355450418')

Insert Users(Username,Password,Role_id,UserData_id)VALUES
('admin','Deneme123.','1','1'),
('salih','Deneme123.','2','2'),
('s','Deneme123.','2','3')

--- Procedures --- 

go
Create or Alter Procedure SP_UserDataInsert(
	@Name nvarchar(40),
	@Surname nvarchar(40),
	@Email nvarchar(60),
	@Gender nvarchar(10),
	@Phone nvarchar(12),
	@Username nvarchar(40),
	@Password nvarchar(40),
	@Role_id int,
	@UserData_id int
)
AS
BEGIN

INSERT INTO UserDatas(Name,Surname,Email,Gender,Phone)
VALUES(@Name,@Surname,@Email,@Gender,@Phone)

INSERT INTO Users(Username,Password,Role_id,UserData_id)
VALUES(@Username,@Password,@Role_id,@UserData_id)
END

go
Create or Alter Procedure SP_UserDataUpdate(
	@UserID int,
	@UserDataID int,
	@Name nvarchar(40),
	@Surname nvarchar(40),
	@Email nvarchar(60),
	@Gender nvarchar(10),
	@Phone nvarchar(12),
	@Username nvarchar(40),
	@Password nvarchar(40),
	@Role_id int,
	@UserData_id int
)
AS 
	Update UserDatas
	SET
		Name=@Name,
		Surname=@Surname,
		Email=@Email,
		Gender=@Gender,
		Phone=@Phone
WHERE UserDataID=@UserDataID

	Update Users
	SET
		Username=@Username,
		Password =@Password		
WHERE UserID=@UserID

--- Insert and Update Spesification == Cascade yapilmasi lazim--- 
go
Create or Alter Procedure SP_UserDataDelete(
	@UserDataID int
)
AS 
DELETE FROM UserDatas WHERE UserDataID=@UserDataID

--- Views---
go
Create or Alter VIEW VW_UserData AS
SELECT Name,Surname,Email,Gender,Phone,Username,Password FROM UserDatas ud INNER JOIN Users u 
ON ud.UserDataID = u.UserData_id

--- ---
