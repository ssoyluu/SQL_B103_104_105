CREATE TABLE ogrenciler5
(
ogrenci_no char(7),
isim varchar(28),	
soyisim varchar(25),
not_ort real,--Ondalıklı sayılar için kullanılır(Double gibi)	
kayıt_tarih date 
);

--VAR OLAN BİR TABLODAN YENİ BİR TABLO OLUSTURMA
CREATE TABLE notlar
AS
SELECT isim,not_ort FROM ogrenciler5

select * from notlar;

--INSERT TABLO İÇİNE VERİ EKLEME

INSERT INTO notlar VALUES ('Melih',82);
INSERT INTO notlar VALUES ('Dursun',89.5);
INSERT INTO notlar VALUES ('Rabia',100);
INSERT INTO notlar VALUES ('Mert',74);
INSERT INTO notlar VALUES ('Ayşe',81.5);
INSERT INTO notlar VALUES ('Özkan',75);

select * from notlar;

CREATE TABLE talebeler
(
isim char(10),
notlar real	
);
INSERT INTO talebeler VALUES ('Melih',82);
INSERT INTO talebeler VALUES ('Dursun',89.5);
INSERT INTO talebeler VALUES ('Rabia',100);
INSERT INTO talebeler VALUES ('Mert',74);
INSERT INTO talebeler VALUES ('Ayşe',81.5);
INSERT INTO talebeler VALUES ('Özkan',75); 

select * from talebeler;

select isim from notlar;

-- CONSTRAINT
-- UNİQUE

CREATE TABLE ogrenciler6
(
ogrenci_no char(7) unique,
isim varchar(28) not null,	
soyisim varchar(25),
not_ort real,--Ondalıklı sayılar için kullanılır(Double gibi)	
kayıt_tarih date 
);

select * from ogrenciler6;

CREATE TABLE ogrenciler7
(
ogrenci_no char(7) unique,
isim varchar(28) not null,	
soyisim varchar(25),
not_ort real,	
kayıt_tarih date 
);

select * from ogrenciler7;

INSERT INTO ogrenciler7 VALUES ('1234567','Samet','Soylu',80.5,now());
INSERT INTO ogrenciler7 VALUES ('1234568','Ali','Veli',80.5,now());
INSERT INTO ogrenciler7 (ogrenci_no,soyisim,not_ort) VALUES('1234569','Samet',83.5)--NOT NULL kısıtlaması oldugu icin bu veri eklenemez

--PRAMERY KEY ataması

CREATE TABLE ogrenciler8
(
ogrenci_no char(7) PRIMARY KEY,
isim varchar(28),	
soyisim varchar(25),
not_ort real,	
kayıt_tarih date 
);

--PRAMERY KEY ATAMASI 2.YOL
--Eğer contraınt ismini kendimiz vermek istersek bu yolu kullanabiliriz.
CREATE TABLE ogrenciler9
(
ogrenci_no char(7),
isim varchar(28),	
soyisim varchar(25),
not_ort real,	
kayıt_tarih date,
CONSTRAINT ogr PRIMARY KEY(ogrenci_no) 
);

--FOREIGN KEY
/*
“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”, 
“iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
“tedarikci_id” yi Foreign Key yapin.
*/

CREATE TABLE tedarikciler3
(
tedarikci_id char(6) PRIMARY KEY,
tedarikci_ismi varchar(20),
iletisim_isim varchar(23)
);

CREATE TABLE urunler 
(
tedarikci_id char(6),
urun_id char(6),
FOREIGN KEY(tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)
);

select * from urunler;
select * from tedarikciler3;

/*
“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”
, 
“ise_baslama” field’lari 
olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id ”
,
“sokak”
, 
“cadde” ve “sehir”
fieldlari olsun. “adres_id” field‘i ile Foreign Key oluşturun.
*/

CREATE TABLE calisanlar
(
id varchar(15)PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int NOT NULL,
ise_baslama date	
); 

CREATE TABLE adresler
(
adres_id varchar(30),	
sokak varchar(30),
cadde varchar(30),
sehir varchar(30),
FOREIGN KEY(adres_id)	REFERENCES calisanlar(id)
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14'); 
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14'); --UNIQUE CONS. kabul etmez
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); --NOT NULL CONS. kabul etmez
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); --UNIQUE CONS. kabul etmez
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); --ING STRİNG girilmez
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); --PRIMARY KEY
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); --PRIMARY KEY
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); --PRIMARY KEY

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

-- Parent tabloda olmayan id ile child a ekleme yapamayiz 
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');

-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

select * from calisanlar;
select * from adresler;

CREATE TABLE calisanlar1 
(
id varchar(15)PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int CHECK(maas>10000),
ise_baslama date	
); 

INSERT INTO calisanlar1 VALUES('10002', 'Mehmet Yılmaz' ,11000, '2018-04-14'); 

select * from calisanlar1;

--DQL --WHERE KULLANIMI

select * from calisanlar;
select isim from calisanlar;

--Calısanlar tablosundan massı 5.000 den buyuk olanları listeleyiniz.
select isim,maas from calisanlar where maas>5000;

--Calısanlar tablosundan ismi Veli Han olan tüm verileri listeleyiniz.
select * from calisanlar where isim='Veli Han';

--Calısanlar tablosundan massı 5.000 olan tüm verileri listeleyiniz.
select * from calisanlar where maas=5000;

--DML --DELETE KOMUTU
delete from calisanlar; --Eğer parent table baska bir child tablo ile iliskili ise önce child table silinmelidir
delete from adresler;
select * from adresler;

--Adresler tablosundan sehri Antep olan verileri silelim
delete from adresler where sehir='Antep';

CREATE TABLE ogrenciler3
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int 
);
INSERT INTO ogrenciler3 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler3 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler3 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler3 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Ali', 99);


