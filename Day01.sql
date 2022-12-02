--DDL - DATA DEFINITION LANG.
--CREATE TABLO OLUŞTURMA
CREATE TABLE ogrenciler1
(
ogrenci_no char(7),
isim varchar(28),	
soyisim varchar(25),
not_ort real,--Ondalıklı sayılar için kullanılır(Double gibi)	
kayıt_tarih date 
);

--VAROLAN TABLODAN YENİ BİR TABLO OLUSTURMA
CREATE TABLE ogrenci_notları
AS -- Benzer tablodaki başlıklarla ve data tibleriyle yeni bir tablo oluşturmak için
--normal tablo oluşturuken ki parantezler yerine AS kullanıp
--SELECT komutuyla almak istediğimiz verileri alırız
SELECT isim,soyisim,not_ort FROM ogrenciler1;

--DML - DATA MANUPULATİON LAN.
--İNSERT  (Database'e veri ekleme)
INSERT INTO ogrenciler1 VALUES ('1234567','Samet','Soylu',85.5,now());
INSERT INTO ogrenciler1 VALUES ('1234567','Samet','Soylu',85.5,'2022-12-11');

--BİR TABLOYA PARÇALI VERİ EKLEMEK İSTERSEK 

INSERT INTO ogrenciler1 (isim,soyisim) VALUES ('Samet','Soylu');

-- DQL - DATA QUERY LANG.
-- SELECT

select * FROM ogrenciler1; -- Burdaki * sembolü herşey anlamındadır.


