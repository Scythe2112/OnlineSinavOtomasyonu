-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Anamakine: localhost
-- Üretim Zamanı: 16 Şubat 2014 saat 22:22:17
-- Sunucu sürümü: 5.0.51
-- PHP Sürümü: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Veritabanı: `sinav`
-- 

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `altbolum`
-- 

CREATE TABLE `altbolum` (
  `AltBolum_Ad` varchar(30) collate utf8_unicode_ci NOT NULL,
  `Bolum_ID` int(6) NOT NULL,
  `AltBolum_ID` int(6) NOT NULL auto_increment,
  PRIMARY KEY  (`AltBolum_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

-- 
-- Tablo döküm verisi `altbolum`
-- 

INSERT INTO `altbolum` VALUES ('Word', 13, 17);

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `birim`
-- 

CREATE TABLE `birim` (
  `Birim_ID` int(6) NOT NULL,
  `Birim_Ad` varchar(60) collate utf8_unicode_ci NOT NULL,
  `UstBirim_ID` int(6) NOT NULL,
  PRIMARY KEY  (`Birim_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Tablo döküm verisi `birim`
-- 

INSERT INTO `birim` VALUES (1, 'Enformatik Bölümü', 1);

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `bolum`
-- 

CREATE TABLE `bolum` (
  `Bolum_Ad` varchar(30) collate utf8_unicode_ci NOT NULL,
  `Bolum_ID` int(6) NOT NULL auto_increment,
  `Ders_ID` int(6) NOT NULL,
  PRIMARY KEY  (`Bolum_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

-- 
-- Tablo döküm verisi `bolum`
-- 

INSERT INTO `bolum` VALUES ('Ofis Ürünleri', 13, 1);

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `cevap`
-- 

CREATE TABLE `cevap` (
  `Cevap_ID` int(11) NOT NULL auto_increment,
  `Ozellik_ID` int(11) NOT NULL,
  `Cevap` varchar(100) collate utf8_unicode_ci NOT NULL,
  `resim_Ad` varchar(50) collate utf8_unicode_ci default NULL,
  `DogruYanlis_ID` varchar(15) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`Cevap_ID`),
  KEY `Ozellik_ID` (`Ozellik_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=335 ;

-- 
-- Tablo döküm verisi `cevap`
-- 

INSERT INTO `cevap` VALUES (334, 8, 'Ctrl + V', NULL, '0');
INSERT INTO `cevap` VALUES (333, 8, 'Ctrl + C', NULL, '1');
INSERT INTO `cevap` VALUES (332, 8, 'Ctrl + A', NULL, '0');
INSERT INTO `cevap` VALUES (331, 8, 'Ctrl + X', NULL, '0');
INSERT INTO `cevap` VALUES (329, 7, '.txt', NULL, '0');
INSERT INTO `cevap` VALUES (330, 8, 'Ctrl + Z', NULL, '0');
INSERT INTO `cevap` VALUES (327, 7, '.dot', NULL, '0');
INSERT INTO `cevap` VALUES (328, 7, '.doc', NULL, '1');
INSERT INTO `cevap` VALUES (325, 7, '.xls', NULL, '0');
INSERT INTO `cevap` VALUES (326, 7, '.bmp', NULL, '0');
INSERT INTO `cevap` VALUES (324, 6, 'Düzen/Sütunlar', NULL, '0');
INSERT INTO `cevap` VALUES (323, 6, 'Biçim/Yazı tipi', NULL, '0');
INSERT INTO `cevap` VALUES (322, 6, 'Biçim/Sütunlar', NULL, '0');
INSERT INTO `cevap` VALUES (321, 6, 'Araçlar/Otomatik düzeltme Seçenekleri', NULL, '1');
INSERT INTO `cevap` VALUES (304, 2, 'Hiçbiri', NULL, '0');
INSERT INTO `cevap` VALUES (320, 6, 'Araçlar/Otomatik Özet ', NULL, '0');
INSERT INTO `cevap` VALUES (303, 2, 'Sayfa Ön izleme', NULL, '0');
INSERT INTO `cevap` VALUES (301, 2, 'Sayfa Yapısı', NULL, '0');
INSERT INTO `cevap` VALUES (302, 2, 'Sayfa Düzeni Görünümü', NULL, '0');
INSERT INTO `cevap` VALUES (300, 2, 'Baskı Ön izleme', NULL, '1');
INSERT INTO `cevap` VALUES (299, 1, 'Görünüm–Sayfa Yapısı– Kâğıt –Yatay ', NULL, '0');
INSERT INTO `cevap` VALUES (298, 1, 'Dosya – Sayfa Yapısı – Kâğıt – Yatay', NULL, '0');
INSERT INTO `cevap` VALUES (297, 1, 'Dosya–Sayfa Yapısı – Kenar Boşlukları – Yatay', NULL, '1');
INSERT INTO `cevap` VALUES (296, 1, 'Görünüm–Sayfa Yapısı– Düzen–Yatay ', NULL, '0');
INSERT INTO `cevap` VALUES (295, 1, 'Düzen- Sayfa yapısı –Kâğıt - Yatay ', NULL, '0');
INSERT INTO `cevap` VALUES (319, 5, 'Düzen', NULL, '0');
INSERT INTO `cevap` VALUES (318, 5, 'Araçlar', NULL, '0');
INSERT INTO `cevap` VALUES (317, 5, 'Tablo', NULL, '0');
INSERT INTO `cevap` VALUES (316, 5, 'Ekle', NULL, '1');
INSERT INTO `cevap` VALUES (315, 5, 'Görünüm', NULL, '0');
INSERT INTO `cevap` VALUES (314, 4, 'Ekle - Kenarlık ve Gölgelendirme', NULL, '0');
INSERT INTO `cevap` VALUES (313, 4, 'Tablo ve Kenarlıklar Araç Çubuğu', NULL, '0');
INSERT INTO `cevap` VALUES (312, 4, 'Görünüm – Sayfa Düzeni ', NULL, '0');
INSERT INTO `cevap` VALUES (311, 4, 'Biçim – Kenarlık ve Gölgelendirme', NULL, '1');
INSERT INTO `cevap` VALUES (310, 4, 'Dosya –Kenarlık ve Gölgelendirme', NULL, '0');
INSERT INTO `cevap` VALUES (309, 3, 'Görünüm - Sayfa Numarası ', NULL, '0');
INSERT INTO `cevap` VALUES (308, 3, 'Ekle – Sayfa Numarası ', NULL, '1');
INSERT INTO `cevap` VALUES (307, 3, 'Dosya – Sayfa Numarası', NULL, '0');
INSERT INTO `cevap` VALUES (306, 3, 'Dosya – Sayfa Numarası', NULL, '0');
INSERT INTO `cevap` VALUES (305, 3, ' Düzen - Sayfa Numarası ', NULL, '0');

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `ders`
-- 

CREATE TABLE `ders` (
  `Ders_ID` int(6) NOT NULL,
  `Ders_Ad` varchar(30) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`Ders_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Tablo döküm verisi `ders`
-- 

INSERT INTO `ders` VALUES (1, 'Temel Bilgi Teknolojisi');

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `hoca`
-- 

CREATE TABLE `hoca` (
  `Hoca_ID` int(11) NOT NULL,
  `Hoca_Ad` varchar(25) collate utf8_unicode_ci NOT NULL,
  `Hoca_Soyadi` varchar(25) collate utf8_unicode_ci NOT NULL,
  `Hoca_Sifre` varchar(11) collate utf8_unicode_ci NOT NULL,
  `Hoca_Email` varchar(100) collate utf8_unicode_ci default NULL,
  `Birim_ID` int(6) default NULL,
  PRIMARY KEY  (`Hoca_ID`),
  KEY `Birim_ID` (`Birim_ID`),
  KEY `Birim_ID_2` (`Birim_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Tablo döküm verisi `hoca`
-- 

INSERT INTO `hoca` VALUES (10, 'Fatih', 'ERTAM', '123456', 'fertam@firat.edu.tr', 1);
INSERT INTO `hoca` VALUES (20, 'Galip', 'Aydin', '123456', 'gaydin@firat.edu.tr', 260);

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `mesaj`
-- 

CREATE TABLE `mesaj` (
  `mesaj_Alan` varchar(25) collate utf8_unicode_ci NOT NULL,
  `mesaj_Gonderen` varchar(25) collate utf8_unicode_ci NOT NULL,
  `mesaj_Mesaj` varchar(127) collate utf8_unicode_ci NOT NULL,
  `mesaj_Durum` varchar(2) collate utf8_unicode_ci NOT NULL,
  `mesaj_ID` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`mesaj_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

-- 
-- Tablo döküm verisi `mesaj`
-- 


-- --------------------------------------------------------

-- 
-- Tablo yapısı: `ogrenci`
-- 

CREATE TABLE `ogrenci` (
  `Ogrenci_ID` int(11) NOT NULL,
  `Ogrenci_TC` varchar(45) collate utf8_unicode_ci default NULL,
  `Ogrenci_Ad` varchar(45) collate utf8_unicode_ci NOT NULL,
  `Ogrenci_Soyad` varchar(45) collate utf8_unicode_ci NOT NULL,
  `Ogrenci_DogumYeri` varchar(45) collate utf8_unicode_ci default NULL,
  `Ogrenci_DogumTarih` varchar(45) collate utf8_unicode_ci default NULL,
  `Birim_ID` int(6) default NULL,
  `Ogrenci_Sifre` varchar(11) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`Ogrenci_ID`),
  KEY `Birim_ID` (`Birim_ID`),
  KEY `Birim_ID_2` (`Birim_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Tablo döküm verisi `ogrenci`
-- 

INSERT INTO `ogrenci` VALUES (10260046, '15401701470', 'Nurettin', 'Toparli', 'Mardin', '14/01/1992', 260, '123456');
INSERT INTO `ogrenci` VALUES (10260065, '11111111111', 'Merve Gizem', 'Aktas', 'Elazig', '18/02/1992', 260, '123456');
INSERT INTO `ogrenci` VALUES (10260051, '11111111111', 'Mustafa', 'Karataş', 'Adana', '11.11.1991', 260, '123456');
INSERT INTO `ogrenci` VALUES (10260006, '22222222222', 'Yusuf', 'Uğurlu', 'Şanlıurfa', '12.10.1992', 260, '123456');

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `ogrenci_cevap`
-- 

CREATE TABLE `ogrenci_cevap` (
  `ID` int(11) NOT NULL auto_increment,
  `Ogrenci_ID` int(11) NOT NULL,
  `Sinav_ID` int(11) NOT NULL,
  `Ozellik_ID` int(11) NOT NULL,
  `Cevap` int(2) NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `Ogrenci_ID` (`Ogrenci_ID`),
  KEY `Sinav_ID` (`Sinav_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=240 ;

-- 
-- Tablo döküm verisi `ogrenci_cevap`
-- 


-- --------------------------------------------------------

-- 
-- Tablo yapısı: `ogrenci_sonuc`
-- 

CREATE TABLE `ogrenci_sonuc` (
  `ID` int(11) NOT NULL auto_increment,
  `Ogrenci_ID` int(11) NOT NULL,
  `Sinav_ID` int(11) NOT NULL,
  `SinavNotu` int(4) NOT NULL,
  `Tekrar` int(2) NOT NULL,
  `GirisSaat` varchar(25) collate utf8_unicode_ci NOT NULL,
  `CikisSaat` varchar(25) collate utf8_unicode_ci NOT NULL,
  `GirisZaman` varchar(45) collate utf8_unicode_ci NOT NULL,
  `Giris_IP` varchar(45) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`ID`),
  KEY `Ogrenci_ID` (`Ogrenci_ID`),
  KEY `Sinav_ID` (`Sinav_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=72 ;

-- 
-- Tablo döküm verisi `ogrenci_sonuc`
-- 


-- --------------------------------------------------------

-- 
-- Tablo yapısı: `ogrenme`
-- 

CREATE TABLE `ogrenme` (
  `ogrenme_id` int(11) NOT NULL,
  `ozellik_id` int(11) NOT NULL,
  `dogru_sayi` int(11) NOT NULL,
  `yanlis_sayi` int(11) NOT NULL,
  PRIMARY KEY  (`ogrenme_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Tablo döküm verisi `ogrenme`
-- 

INSERT INTO `ogrenme` VALUES (1, 1, 1, 0);
INSERT INTO `ogrenme` VALUES (2, 2, 1, 0);
INSERT INTO `ogrenme` VALUES (3, 3, 1, 0);
INSERT INTO `ogrenme` VALUES (4, 4, 2, 0);
INSERT INTO `ogrenme` VALUES (5, 5, 1, 0);
INSERT INTO `ogrenme` VALUES (6, 6, 1, 0);
INSERT INTO `ogrenme` VALUES (7, 7, 1, 0);
INSERT INTO `ogrenme` VALUES (8, 8, 5, 2);

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `sinav_anahat`
-- 

CREATE TABLE `sinav_anahat` (
  `Sinav_ID` int(11) NOT NULL,
  `Ders_ID` int(6) NOT NULL,
  `Birim_ID` int(6) NOT NULL,
  `Tarih` varchar(20) collate utf8_unicode_ci NOT NULL,
  `Saat` varchar(10) collate utf8_unicode_ci NOT NULL,
  `Sure` varchar(10) collate utf8_unicode_ci NOT NULL,
  `SinavTur` varchar(15) collate utf8_unicode_ci NOT NULL,
  `AcikKapali` varchar(15) collate utf8_unicode_ci NOT NULL,
  `Hoca_ID` int(11) NOT NULL,
  PRIMARY KEY  (`Sinav_ID`),
  KEY `Birim_ID` (`Birim_ID`),
  KEY `Hoca_ID` (`Hoca_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Tablo döküm verisi `sinav_anahat`
-- 

INSERT INTO `sinav_anahat` VALUES (14, 1, 1, '14/1/114', '19:39', '5', 'Vize1', '1', 10);
INSERT INTO `sinav_anahat` VALUES (6, 1, 1, '19/0/114', '0:28', '5', 'Final', '1', 10);
INSERT INTO `sinav_anahat` VALUES (8, 1, 1, '23/0/114', '11:51', '5', 'Vize1', '1', 10);

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `sinav_bolum`
-- 

CREATE TABLE `sinav_bolum` (
  `ID` int(11) NOT NULL auto_increment,
  `Bolum_ID` int(6) NOT NULL,
  `AltBolum_ID` int(6) NOT NULL,
  `SoruSayisi` varchar(5) collate utf8_unicode_ci NOT NULL,
  `Zorluk` varchar(15) collate utf8_unicode_ci NOT NULL,
  `Sinav_ID` int(11) NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `Bolum_ID` (`Bolum_ID`),
  KEY `AltBolum_ID` (`AltBolum_ID`),
  KEY `Sinav_ID` (`Sinav_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=27 ;

-- 
-- Tablo döküm verisi `sinav_bolum`
-- 

INSERT INTO `sinav_bolum` VALUES (10, 13, 17, '2', '5', 14);
INSERT INTO `sinav_bolum` VALUES (8, 13, 17, '4', '5', 8);
INSERT INTO `sinav_bolum` VALUES (6, 13, 17, '2', '2', 6);
INSERT INTO `sinav_bolum` VALUES (1, 13, 17, '4', '1', 6);

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `sinav_icerik`
-- 

CREATE TABLE `sinav_icerik` (
  `Sinav_ID` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `Soru_ID` int(11) NOT NULL,
  `Cevap1_ID` int(11) NOT NULL,
  `Cevap2_ID` int(11) NOT NULL,
  `Cevap3_ID` int(11) NOT NULL,
  `Cevap4_ID` int(11) NOT NULL,
  `Cevap5_ID` int(11) NOT NULL,
  `DogruCevap_ID` int(2) NOT NULL,
  KEY `Sinav_ID` (`Sinav_ID`),
  KEY `Ozellik_ID` (`ID`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Tablo döküm verisi `sinav_icerik`
-- 

INSERT INTO `sinav_icerik` VALUES (14, 10, 60, 303, 300, 301, 302, 304, 2);
INSERT INTO `sinav_icerik` VALUES (14, 10, 61, 305, 307, 308, 309, 306, 3);
INSERT INTO `sinav_icerik` VALUES (8, 8, 66, 333, 332, 334, 331, 330, 1);
INSERT INTO `sinav_icerik` VALUES (8, 8, 64, 322, 320, 324, 323, 321, 5);
INSERT INTO `sinav_icerik` VALUES (8, 8, 65, 325, 329, 326, 328, 327, 4);
INSERT INTO `sinav_icerik` VALUES (8, 8, 60, 304, 303, 302, 301, 300, 5);
INSERT INTO `sinav_icerik` VALUES (6, 6, 59, 295, 297, 298, 296, 299, 2);
INSERT INTO `sinav_icerik` VALUES (6, 6, 63, 315, 319, 316, 318, 317, 3);
INSERT INTO `sinav_icerik` VALUES (6, 1, 61, 309, 305, 307, 306, 308, 5);
INSERT INTO `sinav_icerik` VALUES (6, 1, 62, 311, 313, 310, 312, 314, 1);
INSERT INTO `sinav_icerik` VALUES (6, 1, 65, 325, 328, 329, 326, 327, 2);
INSERT INTO `sinav_icerik` VALUES (6, 1, 66, 334, 333, 332, 330, 331, 2);

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `soru`
-- 

CREATE TABLE `soru` (
  `Soru_ID` int(11) NOT NULL auto_increment,
  `Ozellik_ID` int(11) NOT NULL,
  `Soru` varchar(300) collate utf8_unicode_ci NOT NULL,
  `resim_Ad` varchar(50) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`Soru_ID`),
  KEY `Ozellik_ID` (`Ozellik_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=67 ;

-- 
-- Tablo döküm verisi `soru`
-- 

INSERT INTO `soru` VALUES (66, 8, 'Belge üzerinde seçili olan alan klavyeden nasıl kopyalanır?', NULL);
INSERT INTO `soru` VALUES (65, 7, 'Word programında hazırlanan dosyaların (belge) uzantısı aşağıdakilerden \r\nhangisidir?', NULL);
INSERT INTO `soru` VALUES (64, 6, 'Belge içerindeki yazılan bir kısaltmayı kendiliğinden düzeltebilmeyi sağlayan \r\nkomut aşağıdakilerden hangisidir?', NULL);
INSERT INTO `soru` VALUES (63, 5, 'Bir pencerede KÖPRÜ komutu hangi menü içindedir?', NULL);
INSERT INTO `soru` VALUES (62, 4, 'Sayfaya kenarlık eklemek veya gölgelendirme yapmak için kullandığımız \r\nmenü aşağıdakilerden hangisidir?', NULL);
INSERT INTO `soru` VALUES (61, 3, 'Belgeye sayfa numarası eklemek için aşağıdakilerden hangisi kullanılır?', NULL);
INSERT INTO `soru` VALUES (60, 2, 'Bir belgenin yazıcıdan çıkmadan önceki en son hâlini görmek için kullandığımız işlev aşağıdakilerden hangisidir?', NULL);
INSERT INTO `soru` VALUES (59, 1, 'Sayfayı dikey durumdan yatay duruma getirmek için aşağıdakilerden hangisi \r\nkullanılır?', NULL);

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `soruozellik`
-- 

CREATE TABLE `soruozellik` (
  `Ozellik_ID` int(11) NOT NULL auto_increment,
  `AltBolum_ID` int(6) NOT NULL,
  `Hoca_ID` int(11) NOT NULL,
  `Zorluk` varchar(20) character set utf8 collate utf8_unicode_ci NOT NULL,
  `Durum` smallint(2) NOT NULL default '0',
  PRIMARY KEY  (`Ozellik_ID`),
  KEY `AltBolum_ID` (`AltBolum_ID`),
  KEY `Hoca_ID` (`Hoca_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

-- 
-- Tablo döküm verisi `soruozellik`
-- 

INSERT INTO `soruozellik` VALUES (8, 17, 10, '2', 1);
INSERT INTO `soruozellik` VALUES (7, 17, 10, '2', 1);
INSERT INTO `soruozellik` VALUES (5, 17, 10, '4', 1);
INSERT INTO `soruozellik` VALUES (4, 17, 10, '4', 1);

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `ustbirim`
-- 

CREATE TABLE `ustbirim` (
  `UstBirim_ID` int(6) NOT NULL auto_increment,
  `UstBirim_Ad` varchar(45) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`UstBirim_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=261 ;

-- 
-- Tablo döküm verisi `ustbirim`
-- 

INSERT INTO `ustbirim` VALUES (1, 'Enformatik Bölümü');

-- --------------------------------------------------------

-- 
-- Tablo yapısı: `yonetici`
-- 

CREATE TABLE `yonetici` (
  `Yonetici_ID` int(11) NOT NULL,
  `Yonetici_Ad` varchar(45) collate utf8_unicode_ci NOT NULL,
  `Yonetici_Soyad` varchar(45) collate utf8_unicode_ci NOT NULL,
  `Yonetici_Sifre` varchar(15) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`Yonetici_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Tablo döküm verisi `yonetici`
-- 

INSERT INTO `yonetici` VALUES (23, 'Fatih', 'ERTAM', '123456');
INSERT INTO `yonetici` VALUES (47, 'Nurettin', 'TOPARLI', '123456');
