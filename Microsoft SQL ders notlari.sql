
---------------------------------------------------BİRİNCİ HAFTA -------------------------------------------------------------------------
--Yorum satırı özel alan dışına çıkar. 
--Sorgularınızı yazarken küçük büyük harf önemsemden yazabilirisiniz. 


---DML(Data Manipulation)

use Northwind
---Northwind veritabanında üzerinde sorgulama yapılabilmesi için yazılır.
--Aynı zamanda combobox'da kullanılabilir.


--Tabloları sorgulamak
--Select <sütün_adlari> from <tablo_Adi>
--not sütün adlari arasında virgul vardır.

select * from Employees

--Employess tablosundan çalışnalara ait ad soyad ,yas, görev  ve doğum tarhilerini getiriniz

select 
FirstName as 'adı soyadı ',LastName,Title,BirthDate
from
Employees

--Seçmek istediğiniz stünlar arasında virgul olacak.


--sütün isimlerini inteliisense menüsüsü ile istediğiniz sütün arasında ctrl+space 
--kompinasyonunu kullanarak çağırabilirisi.


select [EmployeeID], [LastName], [FirstName], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [City], [Region], 
[PostalCode], [Country], [HomePhone], [Extension], [Photo], [Notes], [ReportsTo], [PhotoPath] from Employees

--employees klasörü altına direkt olarak sürekle bırak ile kolonları ekleyebilrisiniz. 

select 
FirstName,LastName,Title,BirthDate from Employees


--2.Yol 
--Birden fazla kelimeden oluşan bir değeri köşeli parant kullanarak isimlendirebilrisiniz. 

select FirstName as Ad,LastName as Soyad,  'Gorev Acıklamasi'=Title
from
Employees

---Tekil Kayıt Listeleme

select * from Employees
--Aynı sehirler Listelenir



--Farklı olan şehirlerin (tekil değerleri)      
Select   distinct City ,firstname
from Employees


---Üsteki ile aynı sonucu getirir .sebebi ise aynı ad ve şehir değerine sahip  kayıtların olmasıdır. 7
--Eğer  Firstname =Steven , City = Londan olan başka bir kayıt daha  girilseydi tabloya ,bu kayıtların sadece biri listelenirdi .




--Employess tablosunda titleofCourtesy ,Firstname,Lastname tek kolonda yanyana bastırınız.. 

--+Operatörü  ile metinleri birleştirebilrisiniz.. 


select (TitleOfCourtesy+' '+FirstName+'         '+LastName) as isim
from Employees
--Burada sabit bir kolon olmadığı için ve başlık vermedğim için başlangıçta noCloumnName yazmış oldu .



---Where Yapısı
--Sorgu Flitrelemek  için kullanılır .


--Ünvani Mr. olanlari listeleyin. 

select FirstName,LastName,TitleOfCourtesy from Employees 
where TitleOfCourtesy='Mr.' ---Metinsel ifadeler tek tırank içerisinde yazılırlar. .


---1960 yilinda doğan kaç kişi var 

select 
* from  Employees
where  YEAR(BirthDate)=1960
--Year (datetime parametre) fonksiyonu bizden datime tipinde  bir değer alır ve geriyee o tarih bilgisinin yil parçasını döner .

--EmpoyeedId  değeri 5'den büyük olanalar gelsin ..


select EmployeeID,FirstName,LastName
from Employees
where EmployeeID>5



--1950 ile 1961 yılları arısnda doğanları listeleyiniz. 

select * from 
Employees 
where YEAR(BirthDate)>=1950 and YEAR(BirthDate)<=1961


--İngilterede oturan bayanlarin adi ,soyadi mesleği ve ünvani ,ülkesi ve doğum tarihini listeleyiniz .



select TitleOfCourtesy+' '+ FirstName+' '+LastName
from Employees
Employees
where Country='UK'
AND

(TitleOfCourtesy='Mrs.' or TitleOfCourtesy='Ms.')
--ms ve mrs

---ünvani Mr. olanlar ve  60'dan büyük olanlar listelensin 
--Suanının tarihini almak istiyor isen select GETDATE()



select  (TitleOfCourtesy+' '+ FirstName+' '+LastName) as isim   , ( year(GETDATE()) - YEAR(BirthDate)) As yas
from
Employees

where TitleOfCourtesy='Mr.' 
and
year(GETDATE()) - (YEAR(BirthDate)) >60

--GetDate fonksiyonu bize güncel tarih bilgisini verir. ,Year fonkisyonu ile birlikte  o tarihe aynı where ifadesi ile 
--birlikte kendi isimdelndireceğimi sütünları kullanmamalıyız .Örneği yukırada yaş olarak isimlendirdiğim kolunu kullanmamalıyız


--null veriler sorgulamak ..


select Region
from Employees
where Region is not null


select TitleOfCourtesy ,FirstName,LastName,Region from 
Employees
where Region is null 
--Null olan sütünları bu şekilde sorgulayabilrisiniz. 
--Bölgesi belirtilen çalışanları listeleyin ..


select  TitleOfCourtesy ,FirstName,LastName,Region
FROM 
Employees
where Region is not null

--Not Null değer sorgulanırken  == veya <> büyüktür gibi operatör kullamaya çalışrsanız farklı sonuclar 

--alabilirisiniz .Bu neden ile is null ve is not null kullanılmalıdır. 

--is null 
 -- is not null
 
 --Sıralama işlemleri 
--Order By ()
select 
*
from 
Employees
where EmployeeID>2 and 
EmployeeID<=8 
order by FirstName asc (--ascending artan sıra)



select FirstName,LastName,BirthDate
from 
Employees
order by  FirstName desc




--Eğer asc ifadesini belirtmezsekde default  olarak bu şekilde sıralama yapıcaktır. 
--Bu soruda birthdate kolonuna göre artan sıra yaptık .

-------------------------------------------------------İKİNCİ HAFTA -----------------------------------------------------------------------
use Northwind

select FirstName ,LastName,BirthDate  from Employees
order by FirstName,LastName desc



select FirstName,LastName, BirthDate,HireDate,Title,TitleOfCourtesy from Employees
order by 6,4

--Sorguda yazdığınız sütünun sırasına göre sıralama işlemi yapar. 
--Burada ilk önce 6.sıradaki (titleofcourtesy) artan sirada siralama, daha sonra ayni ünvan ve değereine sahip kayırlar için
--4. sıradaki (HireDate) sütünununa bakıyor. bu sütüna göre azalan siralama yapıyor .

--Sql de indexler 1'den başlar

--between - and kullanımı 


--1952 ve 1960 arasaında doğanları listeleyin... 
--1..yol 

select  FirstName,LastName,YEAR(BirthDate) as dogumYili

from Employees

where YEAR(BirthDate)>=1952  and YEAR(BirthDate)<=1960

order by 3 desc 


--2.yoll

select FirstName,LastName,year(BirthDate) as "Dogum Yil"
from 
Employees
where YEAR(BirthDate) between 1952 and 1960
order by  "Dogum Yil "


--Alfabetik olarak Janet ile Robert arasinda olanların listelenmesi.
select FirstName,LastName  from Employees
where FirstName >='Janet'
and
FirstName<='Robert'
order by FirstName

---2.yol 
select FirstName,LastName  from  Employees
where FirstName between 'Janet' and 'Robert'
order by FirstName 

--in kullanımı 
---Ünvani Mr. veya Dr. olanların listelenemesi 
 

 select TitleOfCourtesy+' '+FirstName+' '+LastName
 from Employees
 where TitleOfCourtesy ='Mr.'
 or	
 TitleOfCourtesy='Dr.'


 --2.Yol 

 select TitleOfCourtesy,FirstName,LastName
 from Employees
 where TitleOfCourtesy IN('Dr.','Mr.')




 --1950,1955 ve 1960 yillarinda doğanların listelenmesi 

 select FirstName,LastName,YEAR(BirthDate) As 'dogumyil'
 from Employees 
 where Year(BirthDate) in (1950,1955,1960)



 ----Top Kullanimi 


 select top 3  * from Employees -- ilk uc kayıt bana gelir 


 select top 5 FirstName,LastName,TitleOfCourtesy
 from Employees
 order by TitleOfCourtesy desc 
 -- Top ifadesi bir sorguda en son çalışan kısımdır. Yani öncelikle sorgumuz çalıştıraılabilir. 
 --ve oluşacak olan sonuc kümesi (result set) ilk 5 kaydı getirir. 



 --Çalışanların yaşlarına göre azalan siraladiktan sonra ,oluşacak olan sonuc kümesinin %25 'lik kısmını listeleyin .


 select top 25 percent  FirstName,LastName,title, (YEAR(GETDATE())-YEAR(BirthDate)) as Age
 from
 Employees
 order by Age desc



 --Eğer belirttiğiniz oran  sonucu 5.3 cıktı bu gibi durumda size ilk 6  kayıt gelir.
 --Yukarı yönlü tamamlama işlemi gereçekleştirir. 


 --Like Kullanımı 

 ---1.yol bu şekilde olabailceiği gibi 
 select FirstName,LastName
 from
 Employees
 where FirstName='Michael'


 --2.Yol

 select  FirstName,LastName 
  from Employees
  where  FirstName like 'Michael'


---Adının ilk harfi A ile başlayanları getirin 

select FirstName,LastName,Title
from 
Employees  where FirstName like 'A%'


--Soyadının son harfi N olanlar 
select FirstName,LastName,Title
from 
Employees
where LastName like '%N'



--Adının içerisinde e gecenler. 

select FirstName,LastName,Title
from 
Employees 
where  FirstName like '%E%'
ORDER BY  1


--Adının ilk harfi a veya l olanlar
select FirstName,LastName,Title from 
Employees
where 
FirstName like '[AL]%'

select FirstName,LastName,Title
from Employees
where 
FirstName like 'A%'
OR
FirstName like 'L%'


--Adının içerisinde R veya t harfi bulunanlar 


select FirstName,LastName,Title
from Employees 
where 
FirstName like '%[RT]%'


--Adının ilk harfi alfabetik olarak j ile r aralığında olanlar ..

select FirstName,LastName,Title
from  Employees 
where 
FirstName like '[J-R]%'


--Adının içerisinde A ile e arasında iki adet karakter olanlar.. 

select FirstName,LastName,Title
from 
Employees 
where FirstName like  '%A__E%'

--Adı şu kelide olanlar tAmEr ,yAsEmİN 

select FirstName,LastName,Title
from 
Employees 
where FirstName like  '%A_E%'



--Adının ilk harfi m  olmayanlar ..

select FirstName,LastName,Title
from Employees 
where FirstName not like 'M%'
ORDER BY 1


--Ad, t ile bitmeyenler. 
select FirstName,LastName,Title
from Employees
where 
FirstName like '%[^T]' 

---Adının ilk harfi a ile  ı aralığında bulunmayanlar .

select FirstName,LastName,TitleOfCourtesy
from Employees 
where 
FirstName like '[^A-I]%'

select FirstName,LastName,TitleOfCourtesy
from Employees 
where 
FirstName  not like '[A-I]%'


---Adının 2.harfi a veya t olmayanlar 

select FirstName,LastName,Title
from 
Employees 
where FirstName like '_[^AT]%'

--Adının ilk iki harfi LA,LN,AA VEYA AN OLANLAR GELSİN 

--'[LA][AN]'
---İLK KARAKTER İÇİN L VEYA A'DAN BİRİNİ  
--2.KARAKTER İÇİN A VEYA N'DEN BİRİNİ SEÇER VE OLASIKLAR  ŞU ŞEKİLDE OLUR LA,LN,AA,AN

SELECT 
FirstName,LastName,TitleOfCourtesy
FROM 
Employees 
WHERE FirstName like '[LA][AN]%'


--içerisinde _ geçen isimlerin listelendirilemesi : 
--Normalde _ karakterinin özel bir anlamı vardır .ve tek bir karakter yerine geçer
--fakat sen metin içerisinde _ ifadesini aramak istiyorsan aşağıdaki gibi kaçıs yapman gerekecek.

select FirstName,LastName,TitleOfCourtesy 
from 
Employees
where FirstName like '%[_]%' 

select FirstName,LastName,TitleOfCourtesy 
from 
Employees
where FirstName like '%\%%'  escape '\'



--Custımers tablosundan customer'ıdsinin  2.Harfi A, 4.harfi  T olanların %10'luk kısmını gerein sorguyu yazınız..

select top 10 percent CustomerID,CompanyName
from
Customers where CustomerID like '_A_T%'


---İnsert ,Update,Delete 
--
--insert into <tablo_adi> value <sütün değerleri> 

use  Northwind



insert into Categories (CategoryName,Description) values ('Baklagiller','Kategori adinizi girinmelisiniz.');

select * from Categories
insert into Categories (CategoryName,Description) values (1000,'Kategori adinizi girinmelisiniz.');

insert into Products(UnitsInStock) values ('Kategori adinizi girinmelisiniz.');

insert into Categories (Description) values ('Kategori adinizi girinmelisiniz.');

--insert işlemi başarısız olacaktır. Çünkü categories tablosundaki null geçilemeyen categoryName alanına değer göndermedik. 
--Bir tabloda null geçilemelemeyen bir kolon var ise muhakkak değerini göndermelisiniz. 
--yukarıdaki sorguda sadeceDescription değerini gönderdik peki neden id için hata vermedi ? 
--Çünkü id identity olarak yapılandırılmış durumda. 
---Eğer bir tablodaki sütünların hepsine veri gireceksek tablo adından sonra kolon isimlerini açıktan belirtmenize gerek yoktur.
--Fakat datalarıa gönderirken tablosun yapısınıda göz önünde bulundurun ..


insert into Shippers Values('MNG Kargo','(212) 674 85 96')



--Eğer bir tablodaki sütünların hepsine  veri girilecek ise tablo adından sonra kolon isimlerini belirtmenize gerek yoktur.
--Fakat Hepsine değer vermeyecekseniniz vereceğiniz kolonların ismini belirtin .


insert into  Shippers (Phone ,CompanyName) values ('(255 658 96 32)','Aras Kargo')
--Eğer sütün isimlerini belirtirsek verileri belirrtiğiniz sırada vermelisiniz.. 

---Customers tablosuna bilgeAdam şirketini ekleyiniz. 

--'BLGDM','BilgeAdam'



---Customer tablosundaki customerId değeri sütün tipi nchar veya nvarchardı, Yani aslında kolon sayısal bir veri tipine sahip olmadığı için 
--identity olması beklenemez .Bu neden ile  Customer id değerinide  manuel olarak el ile göndermelisiniz. 

insert into  Customers (CustomerID ,CompanyName) values ('BLGDM','BilgeAdam')

--2)Update işlemi 
--Bir tablodaki kayıtları güncellemek için kullanılır. 
---Dikkat etmeniz gereken kısım  şartınızı açıkca belirtmelisiniz .
--Hangi  kayıt güncellenecekse belirtmelisiniz. 
---aksi halde bütün kayıtlar güncellenir.. 

select * into Calisanlar from Employees

----Update <tabloAdi>
--Set <sütünAdi>=<YeniDeger>,
--<sütünadi> = <yenideger>

--Bu durum istenmeyen bir durumdur 

Update Calisanlar
Set 
LastName ='Ümit'


Update Calisanlar 
set FirstName ='Ali',LastName ='Tas' 
where EmployeeID=9

--Sadece ıd değeri 9 olan kayıt bilgileri güncellendi .Güncelleme işlemi yapılırken Kolonlar arasında Benzersiz olan kolon bulunur .
--Şart bu kolon üzerinden yazılır. 
select * from Calisanlar
where EmployeeID = 9




select  * into Urunler from Products

select * from Urunler

Update  Urunler 
set UnitPrice=UnitPrice+(UnitPrice*0.05)



---Delete 

--Taslak 
--Delete from tabloadi
--where Kolonadiniz ='degeriniz '

Drop table Calisanlar


select * into calisanlar 
from Employees



Delete from calisanlar 
where FirstName ='Michael'
--1adet kayıt silindi

select * from calisanlar where FirstName ='Michael'

--Ünvanı Mr. ve Dr. olanları siliniz  (calisanlar tablosunda.)

delete from calisanlar 
where  TitleOfCourtesy in ('Mr.','Dr.')





------------------dml finito .-----------------------------------
--Tarih Fonksiyonları 

---Datepart () Kullanımı : 

select   FirstName ,LastName ,DATEPART(YY,BirthDate) as year 
 from Employees
 order by year desc

 --Yılın  kaçıncı günü		--Day of Year 

 select  FirstName ,LastName ,DATEPART(DY,BirthDate) as dayOfYear
 FROM Employees



 --Yılın kaçıncı ayı 
 select FirstName ,LastName ,DATEPART(M,BirthDate) as [Mouth]
 from Employees



 ---Yılın kaçıncı haftası 
 select  FirstName,LastName,DATEPART(Wk,BirthDate) 
 from Employees

 --haftanın kaçıncı günü 
 select FirstName,LastName,DATEPART(DW,BirthDate) from 
 Employees


 --saat bilgisi getirme 
 select  FirstName,LastName,DATEPART(HOUR,GETDATE())
 from
 Employees
 --Dakika Bilgisi 

 select FirstName ,LastName ,DATEPART(MI,GETDATE())
 from 
 Employees 
  
  --Saniye 
   select FirstName ,LastName ,DATEPART(SS,GETDATE())
 from 
 Employees 
   --Milisaniye 
   select FirstName ,LastName ,DATEPART(MS,GETDATE())
 from 
 Employees 


 select (FirstName+' '+LastName) as isim , DATEDIFF(YEAR,BirthDate,GETDATE()) as Yas,DATEDIFF(DAY,HireDate,GETDATE()) as ödenenPrim
 from
 Employees

 --DateDiff iki tarih arasındaki farkı verir. 

 --Doğdugunuzdan beri kaç saat geçti .


 ---Kisilerin yasını ve  Ödenen Pirim  hesaplayıp kolonda gösteriniz. 
  select  FirstName ,DATEDIFF(HOUR ,BirthDate,GETDATE()) as kacsaatgecti
  from
  Employees

  ---String Fonksiyonları
  select 5+9 as toplam  ,5-9 as fark ,5*9 as carp 
  print 5+9

  select  'YZL 3436 .NET Yazılım  '  as  metin


  select ASCII('5') AS ASCİKODU --ASCİKODUNU VERİR.
  SELECT CHAR(55) AS kARAKTER --Verdiğiniz ascii kodunun karşılığını verir.
  select CHARINDEX('~','umit.vatansever@bilgeadam.com')as Konum
  --Aratmak istediğiniz değeri  otomatik olarak index'ini sizlere döner .
  --Aradığınız değer yok ise sıfır döner

  Select  LEFT('BilgeAdam',4) as soldankarakter
  select RIGHT('BilgeAdam',6) as sagdankarakter

  select len('BilgeAdam')as karaktersayisi


  select LOWER('BilLGeAdam') as [hepsi kucuk]

  select UPPER ('BilgeAdam') as [hepsi büyük]

select LTRIM('                                BilgeAdam')as bosluklarısiler
select RTRIM('                      BilgeAdam              ')as  bosluklarıSiler 
select LTRIM(RTRIM( '           BilgeAdam          ')) as TumBosluklarıal


select REPLACE ('birbirlerine','bir','uc') as metinlerinyerineyenisiniatar

select SUBSTRING('BilgeAdam Kadikoy Center  Yazılım Teknolojileri',4,8) as 'alt strint''leri oluşturur'

Select REVERSE('Bilge Adam Kadikoy SUBESİ') AS TersCevir


SELECT  'Bilge Adam '+ SPACE(50)+'KadikoySubesi' as boslukatar


select REPLICATE ('Bilge',5) as 'BelirtilenMetin Belirtilidği adet defa cagrılır'

--Aggragate Functions 

select  COUNT(*) 

from Employees 
--Bir tablodaki toplam kayıt sayısını veriyot. 

---Datanın adeti bilgisini döner 


select COUNT (EmployeeID) as adet 
from Employees
--EmployeeId sütündaki kayıt sayısını 

select  COUNT(Region)
from Employees 
--Region sütünundaki kayıt satısı (region sütünunda null geçilebeileceği iöçin bir tablodaki kayıt sayısını) bu stündan yola cıkarak  
--öğrenmek yanlış olur. Çünkü aggreate functionlarda null değer içerinde datalar sayılmazlar.
--Bu neden ile kayıt sayısını öğrenmek için evrensel seçicimiz olan "*" kullanılmalıdır.
select count(City) --9 adet döner fakat bazı şehirler tekrar etmiştir .Bunları şimdi düşelim .

from Employees
select City from Employees

select COUNT (distinct city) as adet  ---Tekrar eden sehirlerin adetinini distinc ile düştük .
from Employees
Select sum(EmployeeID)
from Employees ---EmployeeId Sütündaki verilerin toplami 


--Calısanların yaşlarının ortalamasi 



select avg (DATEDIFF (year,BirthDate,GETDATE())) as [yasların ortalamasi ]

from Employees

select  AVG(LastName)
from Employees----Avg fonksiyonlar sayisal değerler ile kullanılmalıdır

select MAX(EmployeeID)
FROM Employees

SELECT MIN (EmployeeID)
from Employees


select Max(LastName)
from Employees --alfabetik olarak en büyük değeri verecektir... 


select  MIN(LastName)
from Employees

---Case ---When  --Then 

select FirstName,LastName,Title ,Country from Employees



select FirstName ,LastName ,

				case(Country)
					When 'USA'
					Then 'Amerika Birleşik Devletleri'
					when 'UK'
					Then 'İngiltere Birleşik Krallağı '
				else 'Ülkesi Bilinmiyor '
				end as Country 

from 
Employees

---EmployeeId, Değeri  5'den büyük ise ''ıde değeri5'den büyüktür ,Küçük ise ide'değer besden kucuktur .5 ise eşittir diyen yapıyı yazınız..


select EmployeeID,FirstName, 
		Case 
		When EmployeeID>5
		Then 'Id değeri 5 büyüktür.'
		When EmployeeID<5
		Then 'Id değeri 5 Küçüktür.'
		



		else 'Id değeri 5'' eşittir '
		end as Durum

from
Employees

----------------------------------------------------------ÜÇÜNCÜ HAFTA -23/07/2022------------------------------------------------------------


-------------------------Group by----------------
------ çalışanların ülkelerine göre guruplayın 
select Country as ülkeadı, COUNT(*) as kişisayısı 
from 
Employees
where	Country is not null 
group by Country

---çalışanların yapmış olduğu siparişleri adeti 

select  
EmployeeID, COUNT(*) as siparisAdet 
from 
Orders
group by EmployeeID
order by siparisAdet desc

---ürünün fiyatı 35 dolardan az olanları kategorilerine göre guruplayalım 

select CategoryID,COUNT (*) as adet
from 
Products
where UnitPrice<35
group by CategoryID
order by adet

---baş harfi A-K aralığında olan ve stok miktarı 5 ile 50 arasında olan ürünlerin kategorilerine göre gruplayalım 

select  COUNT(*) as adet , CategoryID
from 
Products
where ( ProductName like '[A-K]%')
and 
(UnitsInStock between 5 and 50) 
group by CategoryID
order by  adet desc 

----her bir siparişteki toplam ürün sayısını bulunuz 

select
OrderID , SUM (Quantity) as 'satın alınan ürün '
from 
[Order Details]
group by OrderID
order by [satın alınan ürün ] desc  

----her bir siparişi tutarına göre listeleme 
--unitprice * quantity *(1-discount)

select  
OrderID, sum (UnitPrice*Quantity*(1- discount) ) AS TUTAR
from 
[Order Details]
group by OrderID
order by TUTAR

------discount =>> indirim oranı 

--------------------Having -------------------

-- Sorgu sonucu gelen veri kümesi için filtreleme yapmanıza olanak sağlar 
---aggreate fonksiyonlarda bağlı olacak şekilde kullanılır 
---olaki sorgunuzda aggreate fonksiyon yoksa having bildiğiniz where gibi çalışır 


---toplam tutarı 2500 ile 3500 arasında olan siparişleri sıralanması 

select  
OrderID as siparisKodu, sum (UnitPrice*Quantity*(1- discount) ) AS ToplamTutar
from 

[Order Details]
group by OrderID
Having sum (UnitPrice*Quantity*(1- discount) ) between 2500 and 3500

order by ToplamTutar 

----HER BİR SİPARİŞTEKİ TOPLAM ÜRÜN SAYISI 200  DEN AZ OLANI GETİRELİM 

select 
OrderID, SUM (Quantity) as siparisadeti
from 
[Order Details]
group by OrderID
having SUM (Quantity) <200
order by siparisadeti

-- TOPLAM SİPARİŞ MİKTARI 1300 den fazla olan ürünlerin ürün kodlarını listeleyelim 

select
ProductID, SUM (Quantity) as toplamQuantity
from 
[Order Details]
group by ProductID
having SUM (Quantity) > 1300
order by toplamQuantity
                                                                            -----25/07/2022 tarihinde 3. hafta tekrarında burada kaldım 
---toplam sipariş miktarı 500 den küçük olanları getirsin 

select
ProductID, SUM (Quantity) as toplamsipariş
from 
[Order Details]
group by ProductID
having SUM (Quantity) < 500
order by toplamsipariş

---1000 ADETTEN FAZLA SATILAN ÜRÜNLER

select 
ProductID, SUM (Quantity) as 'satış adet '
from 
[Order Details]
group by ProductID
having SUM (Quantity)>1000
order by [satış adet ]


--normal data silmek için kullanılan komut
--delete table [tablo_adi]



-- İdentity dahil temizlemek için kullanılır 
--TRUNCATE table [tablo adı ]
-- use Northwind 
-- go 
--TRUNCATE table test 

TRUNCATE table test 

/*
ic içe sorgular 
*/


use Northwind

declare @MaxFiyat money =(select MAX (UnitPrice) from Products)


select * from Products
where UnitPrice=@MaxFiyat

print @MaxFiyat

-- products tablosundaki fiyatı en yüksek olan ürünü getirin 

select
MAX (UnitPrice)
from 
Products

--SubQuery 
select * from Products where UnitPrice= (select MAX (UnitPrice) from Products)

select * from Products where UnitPrice= 263.50

-- fiyatı ortalamanın üstünde olan ürünleri getirin 

select * 
from
Products 
where UnitPrice> (select  AVG (UnitPrice) from Products)

-- ürünler tablosundaki satılan ürünlerin listesi 

select * from Products
where ProductID in (select  ProductID from [Order Details])

---ürünler tablosunda satılamayanları listeleyiniz ..

select * from Products
where ProductID not in (select ProductID from [Order Details])




select 
p.ProductName,
p.UnitPrice,
p.UnitsInStock,

(select CategoryName from Categories c where c.CategoryID =p.CategoryID)


from 
Products p

-- kargo şirketlerinin taşıdıkları sipariş sayıları 

select 
	(select CompanyName from Shippers s where s.ShipperID= o.ShipVia ) as kargo , ShipVia as şirket,COUNT (*) as adet 

	from Orders o 

	group by ShipVia	

-- direkt  en pahalı ürünün adını getiren sorguyu yazalım 

select ProductName 
from Products 
where UnitPrice= (select MAX (UnitPrice) from Products)

-- exists içerisinde 
-- if bir karar mekanizmasıdır . if ile koşul kontrol edilir. şart true ise ilk koşul çalıştırılır. 

if exists (select * from Employees)  -- true ve false 
	print 'Dolu '

else 

	print 'Boş'


------sipariş alan çalışanlarım ---

select * from Employees e1 
where exists (select EmployeeID from orders e2 where e1. EmployeeID=e2. EmployeeID)

--- sipariş almayan çalışanların listesi 

select * from Employees e1 
where not exists (select EmployeeID from orders e2
where e1. EmployeeID=e2. EmployeeID)

---- iç içe yazılan subquery den dönen tüm kayıtlar içinde eşleşme yaptıktan sonra ana sorgunun çalışmasını sağlar 
----- exists ise subquery yi eşleşme yapılan kayıtlara göre sonuçlandırır ve ilave olarak gelen kayıtlar için
----- eşleme yapmaya gerek kalmaz 
------ exists zaten subquery den ihtiyacı olan bütün kayıtları getirmiş olur 
---- exists dilerseniz if   -else  içerisinde kullanılabilir 


------------------------- çalışma soruları ----------------------------

-- Brazil 'de bulunan müşterilerin şirket adı ve şehir ülke getir





-- Brazil de olmayan müşterileri getirin 


-- ülkesi (country ) ya spain yada france  yada germany olan müşteriler 



-- faks numarasını bilmediğimiz müşteriler 


-- london da yada paris de bulunan müşterilerin adları 


--- hem Mexico D.F de yaşayan ve hem de contacTitle bilgisi "owner " olan müşteriler 


--c ile başlayan ürünlerin isimleri ve fiyatları 



-- adı A harfi ile başlayan çalışanların adı soyadı doğum tarihi 


-- isminde Restaurant  geçen müşterilerin şirket adı 




-- 50$ ve 100$ arasındabulunan tüm ürünlerin adları ve fiyatları 


--1.07.1996 ile 31.12.1996 arasındaki tüm siparişlerin orderID 

--ürünleri pahalıdan ucuza sıralayalım ama stokları da küçükten büyüğe doğru sıralayılm 

-------------------------------------------------24/07/2022------------------------------------------------------

------------------------------------------join ----------------------------------------------------
--1) inner join : bir tablodaki her kaydın diğer tablodan bir karşılığı olan kayıtları listelenir.
---inner join ifadesi yazarken inner kelimesini yazmasanızda olur .
--(sodece join yazarsananız inner join yapmak istediğinizi belirtirsiniz)

select
ProductName,CategoryName
from 
Products inner join Categories on Categories.CategoryID=Products.CategoryID

--products tablosunda productıd, productName , categoryıd 
--categories tablosundan categoryName ,description 

select 
ProductID,ProductName,Products.CategoryID,CategoryName,Description
from 
Products inner join Categories on Categories.CategoryID=Products.CategoryID

-- not :eğer sectiğimiz sütunlar arasında her iki tabloda da bulunuyorsa o sütunu açıkça belirlememiz gerekir
--products.categoryıd gibi 

--hangi sipariş hangi çalışan tarafından hangi müşteriye yapılmıştır.

select
OrderID as siparişNo,
OrderDate as siparişTarihi ,
CompanyName as şirketAdı,
ContactName as iletişimKişisi,
(FirstName+''+LastName) as çalışan , Title as görev

from 
Customers as C inner join Orders as O on  C.CustomerID=O.CustomerID
				inner join Employees as E on E.EmployeeID=O.EmployeeID

				--------------------------
---sorguda kısaltmak amacı ile tabloda isimlerine takma isim verilebilir ancak dikkat etmeniz gereken nokta bir 
--tablodaya takma isim verdikten sonra o ismin kullanılması gerekliliği 


--suppliers tablosundan companyName , contaktname 
--products tablosundan productname ,unitprice 
--categories tablosundan categoryname 
--companyNAME Kolonuna göre artan sıralayınız



select 
CompanyName,ContactName,ProductName,UnitPrice,CategoryName


from 
Categories as c inner join Products as p on c.CategoryID=p.ProductID
				inner join Suppliers as s on s.SupplierID=p.SupplierID

order by CompanyName asc


--- her bir çalışan için toplam ne kadarlık satış yapmıştır       --- sum (UnitPrice*Quantity*(1- discount) ) 

select
(FirstName+''+LastName) as çalışan ,

CAST (sum (UnitPrice*Quantity*(1- discount) )   as decimal (20,3)) as toplam 

from 
Employees as e inner join  Orders as o   on e.EmployeeID=o.EmployeeID
				inner join [Order Details] as od on o.OrderID = od.OrderID
group by (FirstName+''+LastName)

--- not : cast(cast(sum(unitpirce *quantity *(1-discount)) as decimal (15,3)) as nvarchar (20)+'TL')
-- üst üste elde ettiğimiz değerleri stringe çevirdik 
--sql de iki tip dönüştürme fonksiyonu vardır. biri convert biride cast 


-----------UZUN UZUN BEN YAPTIM -----

select
(FirstName+''+LastName) as çalışan ,

CAST (sum (UnitPrice*Quantity*(1- discount) )   as decimal (20,3)) as toplam 

from 
Employees inner join  Orders   on Employees.EmployeeID=Orders.EmployeeID
				inner join [Order Details] on Orders.OrderID = [Order Details].OrderID
group by (FirstName+''+LastName)


-- her bir kategori için ortalama ürün fiyatını bulunuz ancak ortalama fiyatı 10 dan büyük olanı katerorileri getiriniz 
--AVG (UnitPrice) from Products)


select 
Categories.CategoryName,AVG(UnitPrice) as ortalama 


from 
Products inner join Categories on Categories.CategoryID=Products.CategoryID
group by Categories.CategoryName
having AVG(UnitPrice)>10

order by ortalama

----2) Quter join 
---2.1) QuterLeftJoin : sorguya katılan tablolarda soldaki tablonun tüm kayıtları getirilirken , sağdaki tabloda sadece ilişkili 
-------olan kalıtlar getirilir.

select 
ProductName,CategoryName
from 
Products as p left outer join Categories as c  on p.CategoryID =c.CategoryID

-- left other join ifadesinin solunda kalan (products ) tablosundaki tüm kayıtlar gelirken , 
--sağındaki categories tablosundaki sadece ilişkili kayıtlar gelecek 

-- herbir çalışanın rapor verdiği kişiyi birlikte listeleyelim 

select 
(e1.FirstName+''+e1.LastName) as çalışan , (e2.FirstName+''+e2.LastName) as müdür 
from 
Employees as e1 inner join Employees as e2 on e1.ReportsTo=e2.EmployeeID



-- tüm çalışanlar ve eğer varsa müdürleriyle birlikte listelensin 


select 
(e1.FirstName+''+e1.LastName) as çalışan , (e2.FirstName+''+e2.LastName) as müdür 
from 
Employees as e1 left outer join Employees as e2 on e1.ReportsTo=e2.EmployeeID

---2.2) Right  outer join : sorguda katılan tablolardan sağdakinin tüm kayıtları getirirken soldaki tablodaki sadece ilişkili olan
--kayıtları getirir.

select 
ProductName,CategoryName
from 
Categories right join Products on Categories.CategoryID=Products.ProductID

-- her bir çalışanı müdürüyle birlikte listeleyin 

select 
(e2.FirstName+''+e2.LastName) as müdür, (e1.FirstName+''+e1.LastName) as çalışan  
from 
Employees as e1 right  outer join Employees as e2 on e1.ReportsTo=e2.EmployeeID

select
CategoryName,ProductName
from 
Products right outer join Categories on Products.CategoryID =Categories.CategoryID

-- ikisinin birden hem right hem left join uygulandığı durumlara full join : her iki tablodaki kayıtları getirir

select 
ProductName,CategoryName
from 
Products full join Categories on Products.CategoryID=Categories.CategoryID

--4) Cross join :bir tablodaki bir kaydın diğer tüm tablodaki tüm kayıtların eşleştirilmesini sağlar 

select 
COUNT (*) from -- 11 kayıt 
Categories


select COUNT (*) from Products -- 80 kayıt 80*11 


select 
CategoryName,ProductName
from 
Categories cross join Products


---------------------view yapısı -------------------
--1-kullanım amacı 
	-- anlaşılması zor soruların tek bir sorgu üzerinde çalıştırılabilmesini sağlar 
	-- bu amaçla raporlama işlerinde kullanılır 
	-- aynı zamanda güvenlik ihtiyacı olduğu durumlarda yazmış olduğumuz sorgunun 2. veya 3. şahıslardan gizlenmesini sağlar.



----genel özellikleri :
--herhangi bir sorgu sonucunda tablo olarak ele alıp , ondan sorgu çekmemizi sağlar 
-- insert,update,delete yapılabilir. Bu  işlemler fiziksel tabloya yansıtılırlar
--view yapıları fisiksel olaarak oluşturulan yapılardır
-- view yapıları normal sorgulardan biraz daha yavaş çalışırlar 


--not : eklemek için create , silmek için dropp ky word ü kullanılır 

--create view PrdCatSup
--as 
--select 
--p.ProductName,p.UnitsInStock,c.CategoryName,s.CompanyName 
--from 
--Products p
--inner join Categories c on p.CategoryID=c.CategoryID
--inner join Suppliers s on p.SupplierID=s.SupplierID


-- ctrl+shift+r kombinasyonu intelisense günceller 

select * from prdCatSup  --- artık bunun içinde gizli altı çizgili olsa da çalışır 

select * from prdCatSup where CategoryName ='Beverages'

select * from PrdCatSup WHERE ProductName >'c'
order by 1 desc 

--Bir view 
--satış yapan çalışanların orderıd ile birlikte ad ve soyad bilgilerini getirsin 

create view SipCal
as 
select 
OrderID,Employees.FirstName+''+Employees.LastName as isimSoyisim 

from 
Orders inner join 
Employees on Orders.EmployeeID=Employees.EmployeeID

select * from SipCal


--with Encrytion komutu 

--eğer yazdığını view in kaynak kodlarının görünmesini istemiyor iseniz   . object explorer penceresinden view 
--kategorisinden sağ tıklayarak desing mode açıp görüntülemek istemiyorsanız   with encryftion komutu kullanılır
-- with Encrption işlemlerinden sonra yazdığnız kodu saklamanız lazım 


create view OrnekViewPersoneller 
with encryption 
as 
select 
FirstName,LastName,Title
from 
Employees

select * from OrnekViewPersoneller       -- bu işlemden sonras desing modu kapatılmıştır.

-- örnekler 


---hangi müşteri hiç sipariş vermemiş

select
CompanyName

from 
Customers 
where CustomerID not in (select distinct CustomerID from Orders)



-- 1000 adetten fazla satılan ürünler 

select 
p.ProductName,
SUM(Quantity)
from 
Products p inner join [Order Details] od on od.ProductID=p.ProductID
group by p.ProductName
having SUM (od.Quantity)>1000

------



-- müşterilerin içinde en uzun isme sahip müşteri hangisidir .

select Top 1 CompanyName,LEN (CompanyName) as test	
from Customers
order by test desc 


---hangi tedarikçi hangi ürünü sağlıyor 

select 

s.SupplierID,CompanyName,ProductName
from 
Suppliers s inner join Products p on p.SupplierID=s.SupplierID


-----------------------------------------DÖRDÜNCÜ HAFTA 30/07/2022---------------------------------------------------------------------


--                      ------Stored Procedure-----
--Normal sorgulardan daha hızlı çalışırlar 
--çünkü normal sorgular execute edilirken "execute plan " işlemi yapılır. bu işlem sırasında hangi tablodan , 
--hangi kolondan veri çekilecek yeri yerden herşey bellidir.
--Normal düz yazmış olduğunuz sorguyu defalarca çalıştırdığınız her çalışma için bu plan yapılır. 
--fakat procedure  bir defaya mahsus gerçekleştirir
--Bundan dolayı hız performans artışı sağlanır 

--içerisinde select ,insert,update,delete işlemleri yapılabilir
--dilerseniz iç içe kullanabilirsiniz 
--içlerinden fonksiyon yazabilirsiniz 
--sql de sorgular çalışırken gerekli değerlere ihtiyaç duyar,bu ihtiyaçları burada parametre yardımı ile çözeceğiz
--sql injection yemenizin önüne geçer Bü yönüyle güvenilirdir
--Store Procedure  denilen yapı fiziksel bir veri tabanı nesnesidir. Bu nedenile bunu oluştururken create komutu kullanılır


--fiziksel olarak ilgili bir veri tabanı tablosunun altından programmability altında ulaşabilirsiniz 

                                 ---kullanımı--
--create proc yada procedure [isim]
--(
--varsa parametre
--)
--as

-- yazılacak sorgunuz neyse ,fonk,kod,şart


create proc sp_Ornek
(
@Id int   -- aksini belirtmediğiniz taktirde bu parametrenin yapısı inputtur.
)
as 
select * from Employees where EmployeeID=@Id

sp_Ornek 5


exec sp_Ornek 5

alter proc sp_Ornek
(
@Id int   -- aksini belirtmediğiniz taktirde bu parametrenin yapısı inputtur.
)
as 
select * from Employees where EmployeeID=@Id
--Dikkat prosedürün parametrelerin tanımlarken parantez kullanmak zorunda değilsiniz 
-- ama dikkat etmeniz için hem okunabilirliği artırsın diye kullandım 
create proc sp_Ornek2
@Id int,
@Parametre2 int,
@Parametre3 nvarchar (max)
as 
select * from Employees where EmployeeID=@Id

-- Stored Procedure kullanım 
exec sp_Ornek2 5,6,'as'

-- Geriye Değer döndüren stored procedure

alter procedure UrunGetir
(
@Fiyat Money 
)
as 
select * from Products where UnitPrice>@Fiyat

return @@RowCount    --Yukarıda yapılan işlem sonucunda tabloya dönen data ların satır bilgisini sayarak bize getirecektir

declare @sonuc int 
 exec @sonuc= UrunGetir 90
 print cast(@sonuc as nvarchar (max))+'  adet ürün bu işlemden etkilenmiştir'

 -- print kullandığım için message tab ından görüntülenir.


--output ile değer döndürme 
create proc sp_ornek3
(@ıd int,
@adi nvarchar (max) output ,
@soyadi nvarchar (max) output -- output parametre içerisindeki değeri dışarı göstermek için kullanılır

)
as 
select @adi=FirstName,@soyadi=LastName
from Employees where EmployeeID =@ıd

declare @isim nvarchar(max), @soyisim nvarchar(max)
exec sp_ornek3 6,@isim output ,@soyisim output 
select @isim+''+@soyisim as adsoyad

-- Dışarıdan aldığı isim ,Soyisim ve şehir bilgilerini personeller tablosunda ilgili kolonlara ekleyen store procedure yazınız..
create proc sp_PersonelEkle
(

@Ad nvarchar (max)  ,
@soyad nvarchar (max) ,
@Sehir nvarchar(max) 
)
as 
insert Employees (FirstName,LastName,City) values (@Ad,@soyad,@Sehir)
exec sp_PersonelEkle 'Ahmet','Tas','İstanbul'
select * from Employees



------------ parametrelere varsayılan değer atama ---

alter proc sp_personelekle2
(
@Ad nvarchar (max)='Test',
@soyad nvarchar (max)='test' ,
@Sehir nvarchar(max) ='test'

)
as
insert Employees (FirstName,LastName,City) values (@Ad,@soyad,@Sehir)

exec sp_personelekle2 'ahmet'

-- subquery ler içerisinde kullanılmaz. Başlı başına bir yapıdır.
--Dışarıdan almış olduğu ürün adı , birim fiyatı ve categoryıd parametreler üzerinden gönderdiğniz bir procedure yazarak ekleme yaptırınız

alter proc [UrunEkle]
(
@CategoriId int,
@urunadı nvarchar(20),
@Birimfiyatı Money 
)
as 
insert Products(ProductName,UnitPrice,CategoryID) values (@urunadı,@Birimfiyatı,@CategoriId)

exec UrunEkle 'ananas ',15,9
exec UrunEkle 'elma',3,5
exec UrunEkle 'Armut',4,5

select * from Products

--urunekle @catecoriıd=5, @urunadı='karpuz',@birimfiyatı=10  --- bu şekilde de yapılabilir 

--yukarıdaki sorgunun aynısını update ni yazınız , urun ıd yi ekleyiniz 
create proc urunguncelle
(
@urunad nvarchar (20),
@Birimfiyat money , 
@katıd int, 
@urunıd int 
)
as 
update Products
set ProductName=@urunad, UnitPrice=@Birimfiyat,CategoryID=@katıd
where ProductID =@urunıd

exec urunguncelle 'Hindistan Cevizi',4,1,79

select * from Products                               --------bu konuya çalış biraz 

--etkinlik 
--kategoriler tablosunda others adına bir kategori ekleyin 

--kategorikontrollü ürün ekle stored  procedure yazın. bu sp amacı category id tabloda bulunmayan bir category id değeri gönderildiğinde 
--otomatik olarak sizin yukarıda açmış olduğunuz others kategorisine atansın .


alter procedure [UrunEkle]
(@urunAdi nvarchar (20),
@BirimFiyat money ,
@KatId int )
as
insert products( ProductName,UnitPrice,CategoryID ) values (@urunAdi ,@BirimFiyat,@KatId)

exec UrunEkle 'Ananas',3,5

select * from Products
--kategoriler tablosunda others adına bir kategori ekleyin 
select * from Categories
insert Categories (CategoryName) values ('others')
select * from Products

--kategorikontrollü ürün ekle stored  procedure yazın. bu sp amacı category id tabloda bulunmayan bir category id değeri gönderildiğinde
--otomatik olarak sizin yukarıda açmı ş olduğunuz others kategorisine atansın .

create proc KategoriKontrolluUrunEkleme
(@ad nvarchar (50), @fiyat money ,@KatId int , @Stok int)

as 
declare @EnbuyukKadId int 
select @EnbuyukKadId=MAX(CategoryID) from Categories
if @EnbuyukKadId<@KatId
	begin 
	print 'Girdiğiniz kategori olmadığından dolayı kadegori name''i other olan kolona eklenecektir.'
	set @KatId =80

end 
insert Products (ProductName,UnitPrice,CategoryID,UnitsInStock) values (@ad,@fiyat,@KatId,@stok)

exec KategoriKontrolluUrunEkleme 'TV',544,1020,100

select * from Products

-- ürünıd ye göre ürün adını getiren bir store procedure yazıyoruz ve ardından desing modunu kapatalım 
create proc urunıdyegöreadgetir
(@urunId int)
with encryption 

as 
select ProductName from Products where ProductID=@urunId

exec urunıdyegöreadgetir 4


declare @urunad nvarchar (50), @id int =4
exec @urunad=urunıdyegöreadgetir @id 
print cast (@id as nvarchar )+'nolu aranan ürün '+@urunad

-- Shipperİnsert -- companyname,phone,shipperId
--en son ki id değerini geriye dönüyorsunuz parametre üzerinden 
--@@identity ==>> bu field sizlere kullanıldığı yerdeki son identity değerini verir.
alter proc Shipperİnsert
(
@CN nvarchar (50) ,
@P nvarchar (20),
@shipperId int output
)
as 
insert Shippers (CompanyName,Phone) values (@CN,@P)
set @shipperId=@@IDENTITY 

declare @shpıd int 
exec Shipperİnsert 'ups','1411',@shipperId=@shpıd output   
select @shpıd


declare @shipper_ıd int 
exec Shipperİnsert 'surat kargo','2629659',@shipper_ıd output
select @shipper_ıd

select * from Shippers

---------------------------------4. HAFTA 31/70/2022 ---------------------------BURADA KALDIM 04/08/2022 TARİHİNDE BURADAN DEVAM ET 
 
--                          user Defiend Function  
--1-Scalar Function 
--2- inline table valued function 
--3- multistatement function 

--RETURN VE RETURNS anahtar kelimeleri ile geriye değer döndürme olanağı sağlar

--sadece SQL için mutlaka function denildiğinde geriye değer döner.
-- Function lar parametre alabilir veya almayabilir 
--Function ları isterseniz iç içe sorguda subquery lerin içinde kullanabilirsiniz 

--önemli not : Stored Procedure içerisinde kullanılmazlar 
--scalar ve table valued function larda sadece select sorgularında kullanılır 


--1- scalar function lar 
-- dbo 

--tanımlama 
--
create function KdvliTutarHesaplama
(@Tutar money , @Oran float )
returns money 
as 
	begin 
		return (@tutar*(1+@oran))
	end

select dbo.KdvliTutarHesaplama(124.45,0.18)

select 
ProductID,UnitPrice,dbo.KdvliTutarHesaplama(UnitPrice,0.08) as 'Kdv''li tutar'

from
Products

--Bu günün tarihini dönen bir scaler function 

create function Bugununtarihi
()
returns date
as 
	begin 
		return getdate()
	end

select dbo.Bugununtarihi()


-- kategori ıd bilgisini alan, aldığı bu kategori bilgisinden kaç ürün satıldığını gösteren bir function yazınız 

Create function KategorideSatilanUrunsayisi
(@CatId int)
returns  int
as
	begin 
		return 
		(
		select 
		SUM (od.Quantity)

		from [Order Details] od
		join Products p on p.ProductID=od.ProductID
		where p.CategoryID=@CatId 
		)
	
	end

	select dbo.KategorideSatilanUrunsayisi (2)

--ürün eklenirken categoryId bilgisi girilmezse default olarak other isimli kategoriye eklemiş olsun..

-- others isimli değerin bulunduğu categoryId döndüren bir function yazalım..

create function DefaultCategory()
returns int 
as 
	begin
	return
	(
	select 
	CategoryID
	from 
	Categories
	where CategoryName='Others'
	)
	end

--Default  constrant ekleyelim
alter table products 
add constraint dv_CategoryId default dbo.DefaultCategory() for CategoryId

insert Products (ProductName,UnitPrice) values ('Bilgeadam',80)

--------categoryıd kolonun default value sunun değerinin yukarıdaki fonksiyondan geldiğini gördük 


-- sizlerden bir fonksiyon yazmanızı istiyorum 
--bu fonksiyon dışarıdan tarih bilgisi ,ayraç bilgisi , ve format bilgisi alacak   -------------04/08/2022 PERŞEMBE GECESİ BURADA KALDIM 
--3 çeşit format olmalıdır. ==>> dmy,mdy,ymd

alter function TarihFormatla
(
@tarih datetime,@ayrac char(1),@format char(3)
)
returns nchar (10)
as
	begin
	declare @yil nchar(4)=year (@tarih)
	declare @ay nchar(2)=month (@tarih)
	declare @gun nchar(2)=day (@tarih)
	declare @formatlanmısTarih nchar(10)

	if		@format='dmy'
		set @formatlanmısTarih=@gun+@ayrac+@ay+@ayrac+@yil
	else if @format ='mdy'
		set @formatlanmısTarih=@ay+@ayrac+@gun+@ayrac+@yil
	else if @format ='ymd'
		set @formatlanmısTarih=@yil+@ayrac+@ay+@ayrac+@gun

		return @formatlanmısTarih 

	end

select dbo.TarihFormatla (GETDATE(),'/','dmy')

---------------

alter function TarihFormatla
(
@tarih datetime,@ayrac char(1),@format char(3)
)
returns nchar (10)
as
	begin
	declare @yil nchar(4)=year (@tarih)
	declare @ay nchar(2)=month (@tarih)
	declare @gun nchar(2)=day (@tarih)
	declare @formatlanmısTarih nchar(10)

	if LEN (@gun)=1
		set @gun ='0'+@gun

	if LEN (@ay)=1
		set @ay='0'+@ay


	if		@format='dmy'
		set @formatlanmısTarih=@gun+@ayrac+@ay+@ayrac+@yil
	else if @format ='mdy'
		set @formatlanmısTarih=@ay+@ayrac+@gun+@ayrac+@yil
	else if @format ='ymd'
		set @formatlanmısTarih=@yil+@ayrac+@ay+@ayrac+@gun

		return @formatlanmısTarih 

	end

select dbo.TarihFormatla (GETDATE(),'/','dmy')

--------------------------------------------------------------------------------------------------------------
--      Inkine Table Valued Func


-- sadece select sorgularında kullanılırlar 
-- geriye bir tablo dönecek şekilde returns kısmı ayarlanır
-- begin  -end  scoplarına ve dbo gerek yoktur

-- tanımlama 
create function katurunler

(
@catId int
)
returns table 
as 
return (select ProductName,CategoryID from Products where CategoryID=@catId)

select * from katurunler (1)

----------
select ProductName from katurunler (1) where ProductName like 'c%'

---------
-------------select unitprice  from katurunler(1) --------hata verir invalid column name hatası alırsınız 
--- bu arada metot=fonksiyon demek kafanız karışmasın 

--katurunler2 (@catıd) fakat düzenleme kapansın ,categoryname görelim yanında ?
create function katurunler2
(
@catId int
)
returns table
With Encryption
as 
	return 
	(
	select CategoryName,ProductName,SupplierID,CategoryID
	from 
	Products inner join Categories on Products.ProductID=Categories.CategoryID
	where Products.CategoryID=@catId
	)

select * from katurunler2 (1)

----	MultiStatemn Table Valued func

--bu fonksiyon türleri içerisinde insert update delete işlemi kullanılabilir 
--geriye yine bir tablo döner
--tanımlanan tablo local yada globa bir değişken olabilir 



--tanımlama 
------
create function kisilerim (@tip nvarchar (7))
returns @Tablom table 
(
Id int,
isim nvarchar (50)
)
as 
	begin 
		if @tip='ad'
		begin 
		insert @Tablom select EmployeeID,FirstName from Employees
	end
	else if @tip ='adsoyad'
	begin
		insert @Tablom select EmployeeID,FirstName+''+ LastName
		from Employees
	end
	return
	end

select * from kisilerim ('ad')
select * from kisilerim ('soyad')
--------------
alter function kisilerim (@tip nvarchar (7))
returns @Tablom table 
(
Id int,
isim nvarchar (50)
)
as 
	begin 
		if @tip='ad'
		begin 
		insert @Tablom select EmployeeID,FirstName from Employees
	end
	else if @tip ='adsoyad'
	begin
		insert @Tablom select EmployeeID,FirstName+''+ LastName
		from Employees
		delete from @Tablom where Id=8
	end
	return
	end

select * from Employees

--Tablo üzerinde bir veri araması yaptığımızda veri tabanında bulunan verilerin sayısı arttıkça bu performans düşüklüğüne neden olacaktır .
--dağınık yapıda bulunan verilerin sayısı arttıkça istenilen veriyi aramak bulmak zorlaşır.

--sql de index sahibi olmayan tablolara heap adı verilir. Heap bir tabloya select çektiğinizde sql tablosundaki kayıdı bulabilmek için 
--bütün kayıtları tek tek dolaşır.
-- hatta kayıt bulsa dahi bu kayıttan birden fazla olabilir diye tüm tabloyu dolaşmaya devam eder.

create database Index3436Deneme 
go 
use Index3436Deneme
go

create table Kisi 


(id int primary key identity ,
ad nvarchar (50),
soyad nvarchar (50),
Telno char(11)
)


------- drop table kisi

declare @i int =1
while @i<10000
	begin
	insert Kisi
	select ad='Bilge'+CAST(@i as nvarchar(30)),
	soyad='Adam' +CAST(@i as nvarchar()),
	Telno=cast (@i as char (11))
	set @i+=1
	end

	truncate table Kisi
	select * from Kisi

set statistics IO ON 
--sorguda okuma işlemlerini raporlarını görüntüleyebilirsiniz
set statistics IO time ON 

select * from Kisi where id=9999


--clusterd index, veriyi sql de fiziksel olarak sıraya sokan yapıdır.
--aslında cluster index suan tabloda kullanılıyor 
--tablolarımıza tanımladığımız her primary key aslında clusterd index yapısıdır
--çünkü tablolarımız bu pk ya göre fiziksel olarak sınırlanır

create clustered index kisiIndex 
on Kisi (ıd)


create nonclustered index TelNoyagoreındexle on kisi (TelNo)

set statistics IO ON
set statistics IO time on 
select ad,soyad  from Kisi where Telno= '5284'


--haftaya trigger -transtions


---------------------------------------5.HAFTA 06/08/2022 CUMARTESİ -------------------------------------------



-- trigger -transtions
create database BankaDataBase
go
use BankaDataBase
go
create table KisiselHesap
(
Id int primary key identity,
ad nvarchar (50),
HesapBakiye money,
TcKimlikNo char(11)
)
insert KisiselHesap values ('Erdi',100,'35487953154'),('Baran',0,'9879547621'),('Alper',2000,'9642154872')

select * from KisiselHesap
--Transaction kullanmazsak !!!!

begin try 

update KisiselHesap set HesapBakiye-=200 where TcKimlikNo='9642154872'
raiserror ('elektrikler kesildi',16,2)
update KisiselHesap set HesapBakiye+=200 where TcKimlikNo='9879547621'




end try
begin catch 
----Hata fırlatma bölgesi 
print'Beklenmedik bir hata oluştu.'
end catch 

select * from KisiselHesap






--------------Transaction kullanırsak nasıl olur..

--begin try
--	begin tran

--	insert KisiselHesap values ('Umit',500,'22222')  ---burada yapılan işlemler tran dışındadır. sürekli gerçekleşir(ümit i sürekli ekledi )
--
--	update KisiselHesap set HesapBakiye -=500 where TcKimlikNo='9642154872'
--	raiserror ('elektrikler kesildi',16,2) --hhata
--	update KisiselHesap set HesapBakiye +=500 where TcKimlikNo='9879547621'
--	commit tran ---tran başarılı bir şekilde sonlandırıldı 


--end try 


--begin catch 
--	print 'Beklenmetik bir hata meydana geldi '
--rollback tran  
--end catch 

--select * from KisiselHesap

------------------

--begin try 
--commit save tran BakiyeOlustu
--	begin tran 

--	insert KisiselHesap values ('Aslı',500,'66666')
	
--	update KisiselHesap set HesapBakiye -=500 where TcKimlikNo='9642154872'
--	raiserror ('elektrikler kesildi',16,2) --hhata
--	update KisiselHesap set HesapBakiye +=500 where TcKimlikNo='9879547621'
--commit tran BakiyeOlustu ---tran başarılı bir şekilde sonlandırıldı 

--end try 


--begin catch 
--print 'Beklenmetik bir hata meydana geldi '
--rollback tran  BakiyeOlustu
--end catch 

-------Triggers sql 

--bir Tabloda insert update delete işlemleri gerçekleştirildiğinde 

--inseted Table 

-- eğer bir tabloda insert işlemi gerçekleştiriyorsanıs arka planda işlemler önce ram üzerinde oluşturulan inserted isimli 
--tabloda yapılır eğer işlemde bir problem yok ise inserted tablosuna eklenen veriler fiziksel tabloya da eklenir

-- deleted table
-- eğer bir tabloda delete işlemi yapıyorsanız arka planda işlemler ilk önce ramde oluşturulan deleted isimli bir 
--tablo üzerinde yapılır. eğer işlemlerden herhangi bir problem çıkmaz ise fiziksel tabloya işlemler yansıtılır. (fiziksel tablonadn silinir)

--eğer bir tabloda update işlemi yapılıyor ise arka planda ram hem inserted hem de delete tabloları oluşturulur 
--ve işlemler bunun üzerinde yapılır.
--not : update yaparken güncellenen kaydın orjinali deleted tablosundan güncellendikten sonra hali is einserted tablosunda bulunmaktadır.
--çünkü güncellemek demek kaydı önce silmek sonra eklemek demektir.
--evet ulaşamazsınız delete ve inserted tablolarına ilgili sorgular sonucunda oluşturuldukları o sorgunun kullandığı kolonlara sahip olurlar,
--böylece delete ve inserted tablolarına select sorgusu atmak mümkün.

--trigger tanımlama 
-- create trigger [trigger adı]
--on[işlem yapılacak tablo adı ]
-- after ve delete,update,insert
-- as [kodları]
--tanımlanan triggerlara ilgili tablonun içerisinden trigger sekmesi altında erişebilirsiniz 

create trigger OrnekTrigger
on Employees
after insert 
as 
select * from Employees

insert Employees (FirstName,LastName) values ('test','test')

--Örnek 1
--Tedarikçiler tablosundan bir veri silindiğinde tüm ürünlerin fiyatını otomatik olarak 10 artsın 
create trigger TedarikcilerTrigger 

on suppliers 
after delete
as 
update urunler set unitprice =unitprice +10
select * from urunler 


Delete from urunler where ProductID=77

--------------
--ÖRNEK 2
--Region tablosundan bir veri güncellendiğinde, kategoriler tablosundan "kırmızı et  " adında bir kategori oluşturun
create trigger trgTedarikKategoriGuncelle
on Region
for update  
as 
insert categories (categoryName) values ('kırmızı et')

update region set RegionDescription ='test' where RegionID=5

---------

--Personeller tablosundan bir kayıt silindiğinde silinen kaydın adı ,soyadı, kim tarafından silindiği ve hangi tarihte silindiğini 
--başka bir tabloya ekleyin.


--Bir adet LoglaTablo oluşturun
--Id
--Rapor
create table LoglaTablo
(
Id int primary key identity,
Rapor nvarchar (max)
)
alter trigger triggerpersoneller
on employees
after delete
as
declare @adi nvarchar(max),@soyadi nvarchar (max)

select @adi = FirstName, @soyadi=LastName  from inserted
insert LoglaTablo values ('Adi + soyadi '+@adi+''+@soyadi+' olan personel '+SUSER_NAME()+'Tarafından'+ CAST(GETDATE() 
as nvarchar(max))+'tarihinde silinmiştir.')

delete from employees where EmployeeID=11

select SUSER_NAME()

select * from LoglaTablo


----------------------------select suser_name() ==> o anki server üzerindeki aktif olan kullanın bilgelir getirir

-- personeller tablosunda update gerçekleştirildiğinde anada devreye giren ve bir log tablosuna "adi .... olan personel ....
--yeni adı ile değiştirilerek ..........kunnacısı tarafından ...........tarihinden güncelleştirilmiştir " mesajını versin.

create trigger trgPersonellerRapor
on Employees 
after update 
as
declare @eskiAd nvarchar(max),@yeniAd nvarchar(max)
select @eskiAd=FirstName from deleted 
select @yeniAd =FirstName from inserted 
insert LoglaTablo values ('Adı'+@eskiAd+'olan personel'+@yeniAd+'yeni adı ile değiştirilerek '+SUSER_NAME()+'kullanıcısı tarafından 
'+CAST(GETDATE() as nvarchar (max))+'tarihinde güncellenmiştir.')

update employees set FirstName ='Mustaza ' where EmployeeId=10


------Multiple Trigger 

-- birden fazla aksiyonu tetiklemek için kullanılır 

--employees tablosunda hem delete hem insert işleminde mesaj olarak "trigger çalışmasını tamamladı " şeklinde bir mesaj veriniz 
 
create trigger MultiTrigger 
on employees 
after delete,insert 
as 
print 'Trigger çalışmasını tamamladı '

insert employees (firstname,lastname) values ('test','test')
delete from employees where employeeId=10

-- sipariş verdiğimde sipariş miktarı kadar stoktaki miktardan düşülsün 
create trigger StokGuncelle
on [Order Details]
after insert 
as
declare @satılanurunId int , @satılanmiktar int
select @satılanurunId=ProductId,@satılanmiktar=quantity from inserted

update products set u-=@satılanmiktar
where productId=@satılanurunId

insert [Order Details]
(OrderId,ProductId,UnitPrice,quantity,discount ) values (10248,4,18,3,0)


---------------------------------------------07/08/2022 PAZAR (5. HAFTA )---------------------------

------burada etkilenen tablo sayısı 2 dir birisi od diğeri ise products tablosudur

disable trigger StokGuncelle on [Order Details]
enable trigger StokGuncelle on [Order Details]

--insert update delete işlemlerini izleyen bir trigger yazınız 

create trigger mesajver
on [order details]
for insert,update,delete 
as 
	if (exists (select * from inserted)and exists (select * from deleted))
		print 'update işlemi başarı ile gerçekleşti.'
	else if (exists (select * from inserted))
		print 'insert işlemi başarı ile gerçekleşti'
	else if (exists (select*from deleted))
		print 'Delete işlemi başarı ile gerçekleşti'

select * from [Order Details]

delete from [Order Details] where OrderID=10324

---------------------------
-- bu trigger bozmadan alter layın, şu özellikler eklensin , hangi sipariş id kim tarafından ne zaman değiştirildiyse yazın      ---ÖDEV 
create trigger mesajver
on [order details]
for insert,update,delete 
as 
	if (exists (select * from inserted)and exists (select * from deleted))
		print 'update işlemi başarı ile gerçekleşti.'
	else if (exists (select * from inserted))
		print 'insert işlemi başarı ile gerçekleşti'
	else if (exists (select*from deleted))
		print 'Delete işlemi başarı ile gerçekleşti'

select * from [Order Details]

delete from [Order Details] where OrderID=10324

--------------------------


---- SHİPPERS tablosundan silinen kargo firmalarını ayrı bir YedekTest adında bir db açarak içerisinde kargolar adında bir table açınız 
-- shippers tablosundan silinen kargo firmalarını kargolar adındaki table içerisine atınız
use YedekTest
go 
create table Kargolar
(
id int primary key identity,
FirmaAdi nvarchar (max),
phone nvarchar(max)
)
create trigger KargoYedekle
on shippers 
after delete 
as 
declare @cn nvarchar (50), @p nvarchar (24)
select @cn=CompanyName , @p =phone from deleted
insert YedekTest.dbo.Kargolar
values (@cn.@p)

select * from shippers 
delete from shippers where shipperId =8
select *from YedekTest.dbo. Kargolar

--------------------------------------

-------------     instead of Triggerları 

-- şuana kadar insert update delete işlemleri yapılırken şu şu işlemleri yap mantığı ile açlıştık (yanına )

--örnek 
--personeller tablosundan update işlemi gerçekleştiği anda yapılacak olan güncelleştirme yerine bir log tablosuna şunu yazınız 
--adı...........olan personel......yeni adı ile değiştirilecek .......kullanıcısı tarafından .........tarihinde güncellenmek istendi 
--kalıbını print eden scripti yazınız.
create  Trigger trgPersonellerRapor
on Employees 
instead of update 
as 
declare @eskiadi nvarchar(max), @YeniAdi nvarchar(max) 
select @eskiadi=FirstName  from deleted
select @YeniAdi=FirstName from inserted 

insert LoglaTablo values ('Adı'+@eskiadi+'olan personel '+@YeniAdi+'yeni adı ile değiştirilerek '+ SUSER_NAME()
+'kullanıcısı tarafından  '+ cast (GETDATE() as nvarchar (max)) +'tarihinde güncellenmek istendi ')

update Employees set FirstName= 'aDAM1BİLGE' WHERE EmployeeID=18


--- personeller tablosunda adı "andrew" olan kaydın silinmesini engelleyen ama diğerlerine izin veren trigger yazınız 
alter trigger AndrewTrigger
on employees 
after delete
as 
declare @adi nvarchar (max)
select @adi=FirstName from deleted
if @adi='Test1'
	begin 
	print 'Bu kayıt silinemez'
	rollback  ---- yapılan tüm işlemleri geriye alır 
	end 
delete from Employees where EmployeeID=17

-- create ,alter,drop işlemleri sonucunda veya sürecinde devreye giren yapılardır 

create trigger DDL_TRİGGER
on database 
for drop_table, alter_table, create_function,create_procedure , drop_procedure   ---- vs devam eder 

as print 'bu işlem gerçekleştirilemez'
rollback 
drop table LogTablosu

create trigger viewolusturuldu
on database
after Drop_view
as 
print 'view silindi '

drop view 
disable trigger viewolusturuldu on database

-------------
--serverdeki tüm db ler için all server kullanılır 
create trigger VeriTabaniOlusturmaEngeli
on all server

for create_database
as 
raiserror ('yetkin yok kardeş',15,6)
rollback

create database uekukakiy

disable trigger VeriTabaniOlusturmaEngeli on all server 

--------------------Tüm server da tablo oluşturma engelei koyma ----------

select * from (select shipvia,count (*) as siparissayisi
from orders 
group by shipvia ) as tbl 
pivot 
(
sum(siparissayisi)
for shipvia in ([1],[2],[3])

)

as tbl 

--sql biter --

Select TitleOfCourtesy,Count(*)from Employees Group By TitleOfCourtesy

Select top 1 ProductName,sum(od.UnitPrice*Quantity*(1-discount))
from Employees join Orders on Orders.EmployeeID = Employees.EmployeeID Join 
[Order Details] od on od.OrderID=Orders.OrderID join Products on Products.ProductID=od.ProductID
Group by ProductName order by 2 desc

Select top 1 percent ProductName,sum(od.UnitPrice*Quantity*(1-discount))from Employees join Orders 
on Orders.EmployeeID = Employees.EmployeeID Join 
[Order Details] od on od.OrderID=Orders.OrderID join Products on Products.ProductID=od.ProductID 
Group by ProductName order by 1 desc

Select sum(od.UnitPrice*Quantity*(1-discount))from Employees join Orders on Orders.EmployeeID = Employees.EmployeeID Join 
[Order Details] od on od.OrderID=Orders.OrderID order by 1 desc

Select top 1 sum(od.UnitPrice*Quantity*(1-discount))from Employees join Orders on Orders.EmployeeID = Employees.EmployeeID Join 
[Order Details] od on od.OrderID=Orders.OrderID order by 1 desc

Select LEFT(FirstName, 1)+'. '+LastName AdSoyad,DATEDIFF(year, BirthDate,getdate()) Yaş from Employees 
where Country!='UK'and DATEDIFF(year, BirthDate,getdate())>50

Select ProductName,CompanyName,sum(od.UnitPrice*Quantity*(1-discount))
from [Order Details] od join Products p on p.ProductID=od.ProductID 
join Suppliers s on s.SupplierID=p.ProductID
Group by ProductName,CompanyName

Select ProductName,CompanyName,sum(od.UnitPrice*Quantity*(1-discount))
from [Order Details] od join Products p on p.ProductID=od.ProductID join Suppliers s on s.SupplierID=p.SupplierID 
Group by ProductName,CompanyName