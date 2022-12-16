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

select * from ogrenciler3

--İsmi Mustafa Bak ve Nesibe Yılmaz olan kayıtları silelim

DELETE FROM ogrenciler3 WHERE isim='Mustafa Bak' or isim= 'Nesibe Yilmaz';

--Veli ismi Hasan olan datayı silelim

DELETE FROM ogrenciler3 WHERE veli_isim ='Hasan'

-- TRUNCATE --
-- Bir tablodaki tüm verileri geri alamayacağımız şekilde siler. Şartlı silme yapmaz

TRUNCATE TABLE ogrenciler3

--ON DELETE CASCADE 
DROP TABLE if exists talebeler --Eğer tablo var tabloyu siler

CREATE TABLE talebeler
(
id CHAR(3) primary key, 
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

CREATE TABLE notlar( 
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) 
REFERENCES talebeler(id)
on delete cascade
);

INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);

INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);

select * from talebeler;
select * from notlar;

--Notlar tablosundan talebe id'si 123 olan datatı siliniz

DELETE FROM notlar WHERE talebe_id='123'


CREATE TABLE talebe
(
id CHAR(3) primary key, 
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

CREATE TABLE not1( 
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) 
REFERENCES talebeler(id)
on delete cascade
);

INSERT INTO talebe VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebe VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebe VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebe VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebe VALUES(127, 'Mustafa Bak', 'Can',99);

INSERT INTO not1 VALUES ('123','kimya',75);
INSERT INTO not1 VALUES ('124', 'fizik',65);
INSERT INTO not1 VALUES ('125', 'tarih',90);
INSERT INTO not1 VALUES ('126', 'Matematik',90);

select * from talebe
select * from not1

--Talebeler tablosundan id'si 126 olan datayı silelim

DELETE FROM talebe WHERE id='126'

/*
    Her defasında önce child tablodaki verileri silmek yerine ON DELETE CASCADE silme özelliği ile
	parent tablodan da veri silebiliriz. Yanlız ON DELETE CASCADE komutu kullanımında parent tablodan
	sildiğimiz data child tablodan da silinir
*/

-- IN CONTIDION

DROP TABLE if exists musteriler

CREATE TABLE musteriler 
(
urun_id int, 
musteri_isim varchar(50), 
urun_isim varchar(50)
);

INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (20, 'John', 'Apple'); 
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm'); 
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple'); 
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange'); 
INSERT INTO musteriler VALUES (40, 'John', 'Apricot'); 
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

select * from musteriler

-- Musteriler tablosundan ürün ismi orange apple ve apricot olan tüm verileri listeleyiniz.

select * from musteriler where urun_isim= 'Orange' or urun_isim='Apple' or urun_isim='Apricot';

-- IN CONDITON 

select * from musteriler where urun_isim IN ('Orange','Apple','Apricot');

-- NOT IN --> Yazdığımız verilerin dışındakileri getirir

	select * from musteriler where urun_isim NOT IN ('Orange','Apple','Apricot');
	
-- BETWEEN CONTIDION

-- Müşteriler tablosundan id'si 20 ile 40 arasında olan tüm verileri listeleyiniz
select * from musteriler where urun_id>=20 and urun_id<=40;

select * from musteriler where urun_id between 20 and 40;

select * from musteriler where urun_id not between 20 and 40;

-- SUBQUERİES --> Sorgu içinde sorgu

CREATE TABLE calisanlar2 
(
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);

INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

select * from calisanlar2
select * from markalar

-- Çalışan sayısı 15.000 den cok olan markaların isimlerini ve bu markada çalısanların isimlerini
-- ve maaşlarını listeleyin.

select isim,maas,isyeri from calisanlar2 
where isyeri IN (select marka_isim from markalar where calisan_sayisi>15.000);

--Marka id'si 101 den büyük olan marka calışanlarının isim, maas ve şehirlerini listeleyiniz

select isim,maas,sehir from calisanlar2 
where isyeri IN (select marka_isim from markalar where marka_id>101);

-- AGGREGATE METHOD 
														



