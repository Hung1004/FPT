CREATE DATABASE finalPrject

USE finalPrject

CREATE TABLE admin(username nvarchar(30) primary key,fullname nvarchar(50) ,password nvarchar(32), password2 nvarchar(30))
CREATE TABLE customer(cid int  PRIMARY KEY IDENTITY(1,1), cname NVARCHAR(30), address NVARCHAR(100), phone NVARCHAR(13) , username NVARCHAR(30), password NVARCHAR(30))
CREATE TABLE category(cid NVARCHAR(10) PRIMARY KEY , cname NVARCHAR(100))
CREATE TABLE product(pid int PRIMARY KEY IDENTITY(1,1),image Nvarchar(200), pname NVARCHAR(300),title Nvarchar(300), quantity INT, price MONEY,sale float, descrition NVARCHAR(100),
			 cid NVARCHAR(10) FOREIGN KEY REFERENCES category(cid),sold int,size int,color nvarchar(50))
CREATE TABLE ProductDetail(pid int FOREIGN KEY REFERENCES dbo.product(pid),color nvarchar(50),size int,quantity int)

CREATE TABLE bill(hid int PRIMARY KEY IDENTITY(1,1),date Nvarchar(50) , cid int FOREIGN KEY REFERENCES dbo.customer(cid), Rcname NVARCHAR(100), 
			Raddress NVARCHAR(100), Rphone NVARCHAR(20), total MONEY,Description nvarchar(300), status int)

CREATE TABLE billdetail(hid int FOREIGN KEY REFERENCES dbo.bill(hid), 
			pid int FOREIGN KEY REFERENCES dbo.product(pid),name NVARCHAR(100), quantity INT, price MONEY,subtotal MONEY PRIMARY KEY(hid, pid))


insert into admin values('hungkd','Khuat Dinh Hung','a','a')
insert into category values('1','ADIDAS')
insert into category values('2','NIKE')
insert into category values('3','MLB')
insert into product values('ADIDAS ADIZERO BOSTON 8 WIDE.png','ADIDAS ADIZERO','ADIDAS ADIZERO BOSTON',100,100,0,'oke','1',5,40,'black')
insert into product values('ADIDAS ADIZERO.png','ADIDAS ADIZERO','ADIDAS ADIZERO',100,100,0,'oke','1',5,40,'white')
insert into product values('ADIDAS DURAMO 9 W.png','ADIDAS DURAMO 9','ADIDAS DURAMO 9',100,100,0,'oke','1',5,40,'white')
insert into product values('ADIDAS FALCON.jpg','ADIDAS FALCO','ADIDAS FALCO',100,100,0,'oke','1',5,40,'black')
insert into product values('Adidas EQT Support 91.jpg','Adidas EQT Support 91','Adidas EQT Support 91',100,100,0,'oke','1',5,40,'black')
insert into product values('NIKE AIR ZOOM.png','NIKE AIR ZOOM','NIKE AIR ZOOM',100,100,0,'oke','3',5,40,'black')
insert into product values('Run Star Hike.jpg','Run Star Hike','Run Star Hike',100,100,0,'oke','3',5,40,'black')
insert into product values('NIKE EPIC.jpg','NIKE EPIC','NIKE EPIC',100,100,0,'oke','3',5,40,'black')
insert into product values('NIKE ODYSSEY.jpg','NIKE ODYSSEY','NIKE ODYSSEY',100,100,0,'oke','3',5,40,'black')
insert into product values('NIKE ROSHE TWO.png','NIKE ROSHE TWO','NIKE ROSHE TWO',100,100,0,'oke','3',5,40,'black')
insert into product values('mlb-big-ball.jpg','mlb-big-ball','mlb-big-ball',100,100,0,'oke','2',5,40,'black')
insert into product values('LA Dodgers Sneaker.jpg','LA Dodgers Sneaker','LA Dodgers Sneaker',100,100,0,'oke','2',5,40,'black')

--Query
select * from bill a join billdetail b on a.hid = b.hid where cid = '2'
select a.hid,b.pid, c.image,c.pname,b.name,a.date,b.quantity, b.price, b.subtotal,a.status from bill a 
join billdetail b on a.hid = b.hid join product c on b.pid = c.pid where a.hid = '2'

			select *  from admin 
			select *  from category 
			select *  from product 
			select *  from customer 
			select *  from bill 
			select *  from billdetail 
			select *  from admin 
select * from product a
 join ProductDetail  b
 on a.pid = b.pid
 ALTER TABLE product
add 
size int, color nvarchar(30)
			select top 1 pid from product where cid = 4 order by pid desc 
			select top 1 hid from bill where cid = 1 order by hid desc  
			insert into customer  (username) values ('f')
			select quantity from product where pid =1
			select  count(hid)  from billdetail where hid='2'
			select * from admin where username = 'hung'

			Select * from product where cid = '1' and quantity > 0 order by price desc
			OFFSET 1 rows fetch next 10 row only;
			delete from billdetail where hid='2' and pid='4'