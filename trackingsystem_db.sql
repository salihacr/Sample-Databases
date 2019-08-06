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
Create TABLE "SensorCategory"(
    "SensorCategoryID" int IDENTITY(1, 1)NOT NULL PRIMARY KEY,
    "SensorCategoryName" nvarchar(50)NULL 
)
Create TABLE "Road"(
    "RoadID" int IDENTITY(1, 1)NOT NULL PRIMARY KEY,
    "RoadName" nvarchar(MAX)NULL
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
    "TemplateName" nvarchar(MAX)NULL
)

Create TABLE "Sensor"(
    "SensorID" int IDENTITY(1, 1)NOT NULL PRIMARY KEY,
    "SensorName" nvarchar(50)NULL,
    "FK_SensorCategory_id" int NULL FOREIGN KEY REFERENCES SensorCategory(SensorCategoryID),
    "FK_SensorGroup_id" int NULL FOREIGN KEY REFERENCES SensorGroup(SensorGroupID)
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
    "FK_Road_id" int NULL FOREIGN KEY REFERENCES Road(RoadID),
    "FK_SensorGroup_id" int NULL FOREIGN KEY REFERENCES SensorGroup(SensorGroupID),
    "FK_User_id" int NULL FOREIGN KEY REFERENCES Users(UserID)
)
Create TABLE "SensorError"(
    "SensorErrorID" int IDENTITY(1, 1)NOT NULL PRIMARY KEY,
    "ErrorDate" DateTime NULL,
    "ErrorDetail" nvarchar(MAX)NULL,
    "FK_SensorErrorType_id" int NULL FOREIGN KEY REFERENCES SensorErrorType(SensorErrorTypeID),
    "FK_AlarmLevel_id" int NULL FOREIGN KEY REFERENCES AlarmLevel(AlarmLevelID),
    "FK_Sensor_id" int NULL FOREIGN KEY REFERENCES Sensor(SensorID),
    "FK_Device_id" int NULL FOREIGN KEY REFERENCES Device(DeviceID)
)
INSERT UserGroup(GroupName) VALUES
('Admin'),
('User'),
('Test')

INSERT Users(Username,Password,Email,Phone,FullName,FK_UserGroup_id) VALUES
('DsAdmin','Admin_Panel.','salihacur1@gmail.com','5374056041','ADMIN','1'),
('tcdd_burhan','Tcdd123.','burhan@tcdd.com','5394336362','test2','2'),
('tcdd_ibrahim','Tcdd123.','ibrahim@tcdd.com','5342465075','test3','2')

Insert SensorCategory(SensorCategoryName) VALUES
('Temperature'),
('Speed'),
('Vibration')

INSERT Road(RoadName) VALUES
('TestRoad'),
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

Insert AlarmLevel(AlarmLevelName,AlarmColor) VALUES
('Minimum Seviye','#3498db'),
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
('ERR0014','Sensör kopukluğu'),
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

INSERT SensorGroup(TemplateName) VALUES
('Test_SensorGroup'),
('Bogie1_SensorGroup'),
('Bogie2_SensorGroup'),
('Bogie3_SensorGroup'),
('Bogie4_SensorGroup'),
('Bogie5_SensorGroup'),
('Bogie6_SensorGroup'),
('DataLogger_SensorGroup')

INSERT Sensor(SensorName,FK_SensorCategory_id,FK_SensorGroup_id) VALUES
('IMI Sensor1','1','1'),
('IMI Sensor2','2','1'),
('IMI Sensor3','3','1'),
('IMI Sensor4','2','1'),
('IMI Sensor5','2','1'),
('IMI Sensor6','2','2'),
('IMI Sensor7','2','3'),
('IMI Sensor8','2','2'),
('IMI Sensor9','1','2'),
('IMI Sensor0','3','2')

INSERT DeviceType(DeviceTypeName) VALUES
('Metro'),
('Tren'),
('Yüksek Hızlı Tren'),
('Rüzgar Tribün'),
('Gemi'),
('Elektrik Santrali')

INSERT Device(DeviceCode,IP,Status,FK_DeviceType_id,FK_Road_id,FK_User_id) VALUES
('TEST01','192.168.100.2','1','2','1','1'),
('TEST02','192.168.100.1','1','2','1','1'),
('TEST03','192.168.100.8','0','2','1','1'),
('TEST04','192.168.100.5','1','2','1',,'1'),
('TEST05','192.168.100.3','0','2','1','1'),
('TR0001','192.168.100.3','1','2','5','2'),
('TR0002','192.168.106.1','0','2','8','2'),
('TR0003','192.165.106.9','1','2','11','3')

INSERT SensorError(ErrorDate,ErrorDetail,FK_SensorErrorType_id,FK_AlarmLevel_id,FK_Sensor_id,FK_Device_id) VALUES
('2019-06-23','test1','1','1','1','1'),
('2019-06-24','test2','2','2','1','2'),
('2019-06-25','test3','3','3','1','1'),
('2019-06-26','test4','14','4','1','2'),
('2019-06-27','test5','15','5','1','1'),
('2019-06-28','test6','16','2','1','2'),
('2019-06-29','test7','19','4','1','1'),
('2019-06-30','test8','23','4','1','2'),
('2019-07-01','test9','25','3','1','1'),
('2019-07-02','test0','28','5','1','8')

