--- on delete and update cascade ---
Create TABLE "UserGroup"(
    "UserGroupID" int IDENTITY(1, 1)NOT NULL PRIMARY KEY,
    "GroupName" nvarchar(50)NULL,
)
Create TABLE "Users"(
    "UserID" int IDENTITY(1, 1)NOT NULL PRIMARY KEY,
    "Username" nvarchar(50)NULL,
    "Password" nvarchar(50)NULL,
    "Email" nvarchar(100)NULL,
    "Phone" nvarchar(20)NULL,
    "FullName" nvarchar(100)NULL,
    "FK_UserGroup_id" int NULL FOREIGN KEY REFERENCES UserGroup(UserGroupID)
)
Create TABLE "Road"(
    "RoadID" int IDENTITY(1, 1)NOT NULL PRIMARY KEY,
    "RoadName" nvarchar(MAX)NULL
)
Create TABLE "DeviceType"(
    "DeviceTypeID" int IDENTITY(1, 1)NOT NULL PRIMARY KEY,
    "DeviceTypeName" nvarchar(50)NULL
)
Create TABLE "Device"(
    "DeviceID" int IDENTITY(1, 1)NOT NULL PRIMARY KEY,
    "DeviceCode" nvarchar(100)NULL,
    "IP" nvarchar(20)NULL,
    "Status" bit NULL,
    "FK_DeviceType_id" int NULL FOREIGN KEY REFERENCES DeviceType(DeviceTypeID),
    "FK_Road_id" int NULL FOREIGN KEY REFERENCES Road(RoadID)
)
Create TABLE "SensorCategory"(
    "SensorCategoryID" int IDENTITY(1, 1)NOT NULL PRIMARY KEY,
    "SensorCategoryName" nvarchar(50)NULL 
)
Create TABLE "AlarmLevel"(
    "AlarmLevelID" int IDENTITY(1, 1)NOT NULL PRIMARY KEY,
    "AlarmLevelName" nvarchar(50)NULL,
    "AlarmColor" nvarchar(50) NULL
)
Create TABLE "SensorErrorType"(
    "SensorErrorTypeID" int IDENTITY(1, 1)NOT NULL PRIMARY KEY,
    "HeaderError" nvarchar(MAX)NULL,
    "ErrorExplain" nvarchar(MAX)NULL
)
Create TABLE "SensorGroup"(
    "SensorGroupID" int IDENTITY(1, 1)NOT NULL PRIMARY KEY,
    "TemplateName" nvarchar(MAX)NULL,
    "FK_Device_id" int NULL FOREIGN KEY REFERENCES Device(DeviceID)
)
Create TABLE "Sensor"(
    "SensorID" int IDENTITY(1, 1)NOT NULL PRIMARY KEY,
    "SensorName" nvarchar(50)NULL,
    "FK_SensorCategory_id" int NULL FOREIGN KEY REFERENCES SensorCategory(SensorCategoryID),
    "FK_SensorGroup_id" int NULL FOREIGN KEY REFERENCES SensorGroup(SensorGroupID)
)
Create TABLE "SensorError"(
    "SensorErrorID" int IDENTITY(1, 1)NOT NULL PRIMARY KEY,
    "ErrorDate" DateTime NULL,
    "ErrorDetail" nvarchar(MAX)NULL,
    "FK_SensorErrorType_id" int NULL FOREIGN KEY REFERENCES SensorErrorType(SensorErrorTypeID)ON UPDATE CASCADE,
    "FK_AlarmLevel_id" int NULL FOREIGN KEY REFERENCES AlarmLevel(AlarmLevelID) ON UPDATE CASCADE,
    "FK_Sensor_id" int NULL FOREIGN KEY REFERENCES Sensor(SensorID) ON UPDATE CASCADE
)

CREATE TABLE "User_Device"(
    "User_DeviceID" int IDENTITY(1, 1)NOT NULL PRIMARY KEY,
    "FK_User_id" int NULL FOREIGN KEY REFERENCES Users(UserID),
    "FK_Device_id" int NULL FOREIGN KEY REFERENCES Device(DeviceID)
)

INSERT UserGroup(GroupName) VALUES
('Admin'),
('User'),
('Test')

INSERT Users(Username,Password,Email,Phone,FullName,FK_UserGroup_id) VALUES
('DsAdmin','Admin_Panel.','salihacur1@gmail.com','5374056041','ADMIN','1'),
('tcdd_burhan','Tcdd123.','burhan@tcdd.com','5394336362','test','2')

INSERT Road(RoadName) VALUES
('Test'),
('Gebze-Halkalı'),
('Istanbul - Ankara'),
('Mersin - Adana'),
('Ulukışla - Kayseri'),
('Kayseri - Sivas'),
('Samsun - Sivas'),
('Edirne - Tekirdağ'),
('Bandırma - Balıkesir'),
('Kütahya - Eskişehir'),
('Afyon - Konya'),
('Şefaatli - Kayseri'),
('Adana - Antep'),
('Gaziantep - Malatya'),
('Erzincan - Erzurum'),
('Erzurum - Kars'),
('Martigny - Brig'),
('Basel - Liestral'),
('Schaffhausen - Zürich'),
('Basel - Rodersdorf')

INSERT DeviceType(DeviceTypeName) VALUES
('Metro'),
('Tren'),
('Yüksek Hızlı Tren'),
('Rüzgar Tribün'),
('Gemi'),
('Elektrik Santrali')

INSERT Device(DeviceCode,IP,Status,FK_DeviceType_id,FK_Road_id) VALUES
('TEST01','192.168.100.2','1','2','1'),
('TEST02','192.168.100.3','1','2','1'),
('TEST03','192.168.100.3','0','2','1'),
('TEST04','192.168.100.3','1','2','1'),
('TEST05','192.168.100.3','0','2','1'),
('TR0001','192.168.100.3','1','2','5'),
('TR0002','192.168.106.1','1','2','8')

Insert SensorCategory(SensorCategoryName) VALUES
('Temperature'),
('Speed'),
('Vibration')


Insert AlarmLevel(AlarmLevelName,AlarmColor) VALUES
('Normal','#3498db'),
('Düşük Seviye','#2ecc71'),
('Orta Seviye','#f1c40f'),
('Yüksek Seviye','#e74c3c'),
('Kritik Seviye','#ccb2e5')

INSERT SensorErrorType(HeaderError,ErrorExplain) VALUES
('ERR0001','BALANS AYARI BOZUK'),
('ERR0002','RULMAN YATAK SICAKLIĞI YUKSEK'),
('ERR0003','RULMAN YATAK SICAKLIĞI AŞIRI YUKSEK'),
('ERR0004','RULMAN ARIZASI MEVCUT'),
('ERR0005','DIŞ BİLEZİK ARIZASI'),
('ERR0006','KAFES ARIZASI'),
('ERR0007','İÇ BİLEZİK ARIZASI'),
('ERR0008','YATAK SICAKLIĞI NORMAL DEGERLERİN ÜZERİNDE'),
('ERR0009','YATAK SICAKLIĞI AŞIRI YÜKSEK'),
('ERR0010','ANİ ŞOK DARBESİ'),
('ERR0011','YOLDA BOZUK ALAN'),
('ERR0012','Vibration value band violation (~25g)'),
('ERR0013','Temperature overload 35°C'),
('ERR0014','Sensör kopukluğıu'),
('ERR0015','Yüksek seviye aks arızası'),
('ERR0016','Düşük seviye aks arızası'),
('ERR0017','Orta seviye aks arızası'),
('ERR0018','Yüksek seviye aks sıcaklık arızası'),
('ERR0019','Düşük seviye aks sıcaklık arızası'),
('ERR0020','Orta seviye aks sıcaklık arızası'),
('ERR0021','Düşük seviye cer arızası'),
('ERR0022','Orta seviye cer arızası'),
('ERR0023','Yüksek seviye cer sıcaklık arızası'),
('ERR0024','Düşük seviye cer sıcaklık arızası'),
('ERR0025','Orta seviye cer sıcaklık arızası'),
('ERR0026','Yüksek seviye sol ray arızası'),
('ERR0027','Düşük seviye sol ray arızası'),
('ERR0028','Orta seviye sol ray arızası'),
('ERR0029','Yüksek seviye sağ ray arızası'),
('ERR0030','Düşük seviye sağ ray arızası'),
('ERR0031','Orta seviye sağ ray arızası')

INSERT SensorGroup(TemplateName,FK_Device_id) VALUES
('Test_SensorGroup','1'),
('Bogie1_SensorGroup','2'),
('Bogie2_SensorGroup','2'),
('Bogie3_SensorGroup','2'),
('Bogie4_SensorGroup','2'),
('Bogie5_SensorGroup','2'),
('Bogie6_SensorGroup','2'),
('DataLogger_SensorGroup','3')

INSERT Sensor(SensorName,FK_SensorCategory_id,FK_SensorGroup_id) VALUES
('IMI Sensor','1','1'),
('IMI Sensor','2','1'),
('IMI Sensor','3','1'),
('IMI Sensor','2','1'),
('IMI Sensor','2','1'),
('IMI Sensor','2','1'),
('IMI Sensor','2','1'),
('IMI Sensor','2','1'),
('IMI Sensor','1','1'),
('IMI Sensor','3','1')

INSERT SensorError(ErrorDate,ErrorDetail,FK_SensorErrorType_id,FK_AlarmLevel_id,FK_Sensor_id) VALUES
('2019-06-23','test','1','1','1'),
('2019-06-24','test','1','2','1'),
('2019-06-25','test','1','3','1'),
('2019-06-26','test','1','4','2'),
('2019-06-27','test','1','5','2'),
('2019-06-28','test','1','2','2'),
('2019-06-29','test','1','4','3'),
('2019-06-30','test','1','4','3')

INSERT User_Device(FK_User_id,FK_Device_id) VALUES
('1','1'),
('1','2'),
('1','3'),
('1','4'),
('1','5'),
('1','6'),
('1','7'),
('2','6'),
('2','7')
