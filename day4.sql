CREATE TABLE calisanlar3 
(
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);

INSERT INTO calisanlar3 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar3 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar3 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar3 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar3 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar3 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar3 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');
INSERT INTO calisanlar3 VALUES(123456710, 'Fatma Yasa', 'Bursa', null, 'Vakko');

CREATE TABLE markalar1
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);

INSERT INTO markalar1 VALUES(100, 'Vakko', 12000);
INSERT INTO markalar1 VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar1 VALUES(102, 'Adidas', 10000);
INSERT INTO markalar1 VALUES(103, 'LCWaikiki', 21000);

select * from calisanlar3
select * from markalar1

-- AGGREGATE METHOD

select max(maas) from calisanlar3;
/*
Eger bir sutuna gecici olarak bir isim vermek istersek AS komutunu yazdıktan sonra
vermek istedigimiz ismi yazarız
*/
select max(maas) as maksimum_maas from calisanlar3;

-- Calısanlar tablosundan en düşük maası listeleyin
select min(maas) as en_dusuk_maas from calisanlar3

--Calısanlar tablosundaki maas'ların toplamını listeleyiniz
select sum(maas) as toplam_maas from calisanlar3

--Calısanlar tablosundaki maas'ların ortalamasını listeleyiniz
select avg(maas) from calisanlar3
select round(avg(maas)) from calisanlar3

--Calısanlar tablosundaki maas'ların sayısını listeliyiniz
select count(maas) from calisanlar3
delete from calisanlar3

/*
Eğer count(*) kullanırsak tablodaki tüm satırların sayısını verir
sutun adı kullanırsak o sutundaki sayıları verir.
*/

-- Her markanın id'sini, ismini ve toplam kac şehirde bulunduğunu listeleyen
-- bir sorgu yazınız.

select * from calisanlar3
select * from markalar1

select marka_id,marka_isim,
(select count(sehir) from calisanlar3 where marka_isim=isyeri)
from markalar;

--Her markanın ismini,çalısan sayısını ve o markaya ait çalısanların toplam maaşını listeleyiniz

select marka_isim,calisan_sayisi,
(select sum(maas) from calisanlar3 where isyeri=marka_isim)
from markalar1

--Her markanın ismini, çalısan sayısını ve o markaya iat calısanların
--maksimum ve minumum maaşını listeleyen bir sorgu yazınız.

select marka_isim,calisan_sayisi,
(select max(maas) from calisanlar3 where isyeri=marka_isim) as en_yüksek_maas,
(select min(maas) from calisanlar3 where isyeri=marka_isim) as en_düşük_maas
from markalar1

-- VIEW KULLANIMI
/*
Yaptığımız sorguları hafızaya alır ve tekrar bizden istenen sorgulama yerine
view'e atadığımız ismi select komutuyla çağırırız.
*/

CREATE VIEW maxminmaas
AS
select marka_isim,calisan_sayisi,
(select max(maas) from calisanlar3 where isyeri=marka_isim) as en_yüksek_maas,
(select min(maas) from calisanlar3 where isyeri=marka_isim) as en_düşük_maas
from markalar1;

select * from maxminmaas

--EXİSTS CONDITION

CREATE TABLE mart
(
urun_id int,
musteri_isim varchar(50), 
urun_isim varchar(50)
);

INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan 
(
urun_id int ,
musteri_isim varchar(50), 
urun_isim varchar(50)
);

INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

select * from mart
select * from nisan

--MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
--URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
--MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız. 

select urun_id,musteri_isim from mart
where exists (select urun_id from nisan where mart.urun_id=nisan.urun_id);

/*
--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
*/
select urun_isim,musteri_isim from nisan
where exists (select urun_isim from mart where mart.urun_isim=nisan.urun_isim);

DELETE FROM urunler1

--UPDATE SET --->DML

CREATE TABLE tedarikciler -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);

INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');

CREATE TABLE urunler1 -- child
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) 
REFERENCES tedarikciler(vergi_no)
on delete cascade
);

INSERT INTO urunler1 VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler1 VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler1 VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler1 VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler1 VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler1 VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler1 VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

select * from tedarikciler
select * from urunler1

--Vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz.
update tedarikciler
set firma_ismi='Vestel' where vergi_no=102;

-- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve irtibat_ismi’ni 'Ali Veli'
--olarak güncelleyiniz.
update tedarikciler
set firma_ismi= 'Casper',irtibat_ismi='Ali Veli' where vergi_no=101;

--Urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz
update urunler1
set urun_isim= 'Telefon' where urun_isim= 'Phone'

--Urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın
update urunler1
set urun_id = urun_id+1 where urun_id>1004;

--Urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun değerleri ile toplayarak 
--güncelleyiniz
update urunler1
set urun_id = urun_id+ted_vergino 

--Urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda irtibat_ismi 
--'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.
update urunler1
set urun_isim= 'Apple'
where musteri_isim= 'Ali Bak'

update urunler1
set urun_isim= (select firma_ismi from tedarikciler where irtibat_ismi = 'Adam Eve')
where musteri_isim= 'Ali Bak'

--Urunler tablosunda laptop satin alan musterilerin ismini, firma_ismi Apple’in irtibat_isim'i
--ile degistirin.
update urunler1
set musteri_isim = (select irtibat_ismi from tedarikciler where firma_ismi = 'Apple')
where urun_isim = 'Laptop';









