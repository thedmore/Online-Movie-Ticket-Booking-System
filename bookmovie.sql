CREATE DATABASE bookmyday_db;
USE bookmyday_db;

CREATE TABLE customer(
	c_id VARCHAR(15) PRIMARY KEY NOT NULL,
	c_name VARCHAR(50) DEFAULT NULL,
	mobile_no VARCHAR(15) UNIQUE NOT NULL,
	email_id VARCHAR(50) NOT NULL,
	c_password VARCHAR(50) NOT NULL
);

CREATE TABLE multiplex(
	mp_id VARCHAR(15) PRIMARY KEY NOT NULL,
    mp_name VARCHAR(50) DEFAULT NULL,
    mp_owner VARCHAR(15) NOT NULL,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(15) NOT NULL
);

CREATE TABLE screen(
	screen_id VARCHAR(15) NOT NULL,
	seat_id VARCHAR(15) PRIMARY KEY NOT NULL,
	seat_type VARCHAR(15) NOT NULL,
    mp_id VARCHAR(15) NOT NULL,
    FOREIGN KEY(mp_id) REFERENCES multiplex(mp_id) 
);        

CREATE TABLE admins(
	admin_id VARCHAR(15) PRIMARY KEY NOT NULL,
    admin_password VARCHAR(50) NOT NULL,
    mp_id VARCHAR(15) NOT NULL,
    FOREIGN KEY(mp_id) REFERENCES multiplex(mp_id) 
);

CREATE TABLE work_for(
	mp_id VARCHAR(15) NOT NULL,
    admin_id VARCHAR(15) PRIMARY KEY NOT NULL,
    FOREIGN KEY(mp_id) REFERENCES multiplex(mp_id) ,
    FOREIGN KEY(admin_id) REFERENCES admins(admin_id) 
);
    
CREATE TABLE shows(
	show_id VARCHAR(15) PRIMARY KEY NOT NULL,
    m_id VARCHAR(15) NOT NULL,
	screen_id VARCHAR(15) NOT NULL,
	start_time TIME,
	end_time TIME,
	show_language char(100),
    FOREIGN KEY(m_id) REFERENCES movie(m_id) 
); 

CREATE TABLE ticket(
	ticket_no VARCHAR(15) PRIMARY KEY NOT NULL,
    show_id VARCHAR(15) NOT NULL,
    screen_id VARCHAR(15) NOT NULL,
    seat_id VARCHAR(15) NOT NULL,
    show_date_time DATETIME NOT NULL,
    price INT NOT NULL,
    payment_id VARCHAR(15) NOT NULL
);

CREATE TABLE movie(
	m_id VARCHAR(15) PRIMARY KEY NOT NULL,
    show_id VARCHAR(15) NOT NULL,
    m_name VARCHAR(50) NOT NULL,
    duration VARCHAR(20) NOT NULL,
    director VARCHAR(50) NOT NULL,
    cast VARCHAR(100),
    about VARCHAR(100),
    release_date DATE NOT NULL
);

CREATE TABLE books(
		c_id VARCHAR(15) NOT NULL,
        booking_date DATE NOT NULL,
        ticket_no VARCHAR(15) NOT NULL,
        FOREIGN KEY(c_id) REFERENCES customer(c_id),
        FOREIGN KEY(ticket_no) REFERENCES ticket(ticket_no)
);   

CREATE TABLE payment(
	payment_id VARCHAR(15) PRIMARY KEY NOT NULL,
	m_id VARCHAR(15) NOT NULL,
	price INT NOT NULL,
	payment_type VARCHAR(50),
	payment_time VARCHAR(50) NOT NULL,
	FOREIGN KEY(m_id) REFERENCES movie(m_id) ON DELETE CASCADE
);

show tables;

desc admin;
insert into admins values('riteshbmda1','riteshbmda@123','MP01');  
insert into admins values('rahulbmda3','rahulbmda2@123','MP02');
insert into admins values('shyambmdb2','shyambmdb2@123','MP03');
insert into admins values('riyabmdc1','riyabmdc1@123','MP04');
insert into admins values('niharikabmdc3','niharikabmdc3@123','MP05');
select * from admin;

desc customer;
insert into customer values('C01','Manoj','9980714815','manoj@gmail.com','manoj#123');
insert into customer values('C02','Ankur','9965717815','ankur@gmail.com','ankur#123');
insert into customer values('C03','Shreya','8880714815','shreya@gmail.com','shreya#123');
insert into customer values('C04','Karan','9160714158','karan@gmail.com','karan#123');
insert into customer values('C05','Nikita','7906714812','nikita@gmail.com','nikita#123');
insert into customer values('C06','Ira','7180994851','ira@gmail.com','ira#123');  
insert into customer values('C07','Rakesh','9880554518','rakesh@gmail.com','rakesh#123');    
insert into customer values('C08','Ramya','9904714333','ramya@gmail.com','ramya#123');
insert into customer values('C09','Neha','9980564397','neha@gmail.com','neha#123');
insert into customer values('C10','Sam','9980749861','sam@gmail.com','sam#123');
insert into customer values('C11','Naveen','7980714161','naveen@gmail.com','naveen#123');
insert into customer values('C12','Natasha','7980714645','natasha@gmail.com','natasha#123');
insert into customer values('C13','Mayank','7880714639','mayank@gmail.com','mayank#123');
insert into customer values('C14','Pranav','7780174822','pranav@gmail.com','pranav#123');
insert into customer values('C15','Shweta','7764714825','manoj@gmail.com','manoj#123');

desc multiplex;
insert into multiplex values('MP01','PVR','Ajay Bijli','Shantiniketan road','Bangalore');
insert into multiplex values('MP02','INOX','Pavan Jain','Bangalore highway','Mysore');
insert into multiplex values('MP03','Big Cinemas','Reliance Group','Balthakre road','Mumbai');
insert into multiplex values('MP04','Cinépolis','Organización R','Balthakre road','Mumbai');
insert into multiplex values('MP05','IMAX Multiplex','A R Prasad','Kukatpally abades road','Hyderabad');
select * from multiplex;

desc screen;
insert into screen values('SC01','M1S1G1','Gold','MP01');
insert into screen values('SC01','M1S1G2','Gold','MP01');
insert into screen values('SC01','M1S1G3','Gold','MP01');
insert into screen values('SC02','M1S2C1','Classic','MP01');
insert into screen values('SC02','M1S2C2','Classic','MP01');
insert into screen values('SC02','M1S2C3','Classic','MP01');
insert into screen values('SC03','M1S3R1','Recliner','MP01');
insert into screen values('SC03','M1S3R2','Recliner','MP01');
insert into screen values('SC03','M1S3R3','Recliner','MP01');
insert into screen values('SC01','M2S1G1','Gold','MP02');
insert into screen values('SC01','M2S1G2','Gold','MP02');
insert into screen values('SC01','M2S1G3','Gold','MP02');
insert into screen values('SC02','M2S2R1','Recliner','MP02');
insert into screen values('SC02','M2S2R2','Recliner','MP02');
insert into screen values('SC02','M2S2R3','Recliner','MP02');
insert into screen values('SC03','M2S3C1','Classic','MP02');
insert into screen values('SC03','M2S3C2','Classic','MP02');
insert into screen values('SC03','M2S3C3','Classic','MP02');
insert into screen values('SC01','M3S1G1','Gold','MP03');
insert into screen values('SC01','M3S1G2','Gold','MP03');
insert into screen values('SC01','M3S1G3','Gold','MP03');
insert into screen values('SC02','M3S2R1','Recliner','MP03');
insert into screen values('SC02','M3S2R2','Recliner','MP03');
insert into screen values('SC02','M3S2R3','Recliner','MP03');
insert into screen values('SC03','M3S3C1','Classic','MP03');
insert into screen values('SC03','M3S3C2','Classic','MP03');
insert into screen values('SC03','M3S3C3','Classic','MP03');
insert into screen values('SC01','M4S1R1','Recliner','MP04');
insert into screen values('SC01','M4S1R2','Recliner','MP04');
insert into screen values('SC01','M4S1R3','Recliner','MP04');
insert into screen values('SC02','M4S2C1','Classic','MP04');
insert into screen values('SC02','M4S2C2','Classic','MP04');
insert into screen values('SC02','M4S2C3','Classic','MP04');
insert into screen values('SC03','M4S3G1','Gold','MP04');
insert into screen values('SC03','M4S3G2','Gold','MP04');
insert into screen values('SC03','M4S3G3','Gold','MP04');
insert into screen values('SC01','M5S1C1','Classic','MP05');
insert into screen values('SC01','M5S1C2','Classic','MP05');
insert into screen values('SC01','M5S1C3','Classic','MP05');
insert into screen values('SC02','M5S2R1','Recliner','MP05');
insert into screen values('SC02','M5S2R2','Recliner','MP05');
insert into screen values('SC02','M5S2R3','Recliner','MP05');
insert into screen values('SC03','M5S3G1','Gold','MP05');
insert into screen values('SC03','M5S3G2','Gold','MP05');
insert into screen values('SC03','M5S3G3','Gold','MP05');
select * from screen;

desc ticket;
insert into ticket values('T01','SH01','SC01','R1','2022-12-10 12:00:00','245','pid01');
insert into ticket values('T02','SH01','SC01','G2','2022-12-10 12:00:00','245','pid02');
insert into ticket values('T03','SH01','SC01','C3','2022-12-10 12:00:00','245','pid03');
insert into ticket values('T04','SH02','SC02','C2','2022-12-10 12:00:00','250','pid04');
insert into ticket values('T05','SH02','SC02','C1','2022-12-10 12:00:00','245','pid05');
insert into ticket values('T06','SH02','SC02','C3','2022-12-10 18:15:00','345','pid06');
insert into ticket values('T07','SH01','SC03','G3','2022-12-11 12:00:00','245','pid07');
insert into ticket values('T08','SH03','SC02','R2','2022-12-10 18:00:00','345','pid08');
insert into ticket values('T09','SH02','SC01','R3','2022-12-10 17:00:00','245','pid09');
insert into ticket values('T10','SH01','SC01','C1','2022-12-10 12:00:00','245','pid10');
select * from ticket;

desc movie;
insert into movie values('M01','SHM01','Kantara','hours 45 minutes','Rishab Shetty','Rishab Shetty, Sapthami Gowda','Drama/Thriller',20220930);
insert into movie values('M02','SHM02','Avatar 2','3 hour','David Miller','John, Elizabeth','Sci-fi/Action',20221230);
insert into movie values('M03','SHM03','Goodbye','2 hours 45 minutes','Vikas Bahi','Amitabh Bachan, Rashmika Mandanna','Comedy/Drama',20221007);
insert into movie values('M04','SHM04','Godfather','2 hours 37 minutes','Mohan Raja','Chiranjeevi, Tanya Ravichandran, Nayanthara','Action',20220930);
insert into movie values('M05','SHM05','Liger','2 hours 20 minutes','Puri Jagannadh','Vijay Devarakonda, Ananya Pandey','Action/Romance',20220930);
select * from movie;

desc payment;
insert into payment values('pid01','M01','250','UPI','9 am');
insert into payment values('pid02','M01','250','UPI','8:45 am');
insert into payment values('pid03','M03','350','Debit card','9 am');
insert into payment values('pid04','M01','250','UPI','9:05 am');
insert into payment values('pid05','M01','250','UPI','9:03 am');
insert into payment values('pid06','M02','320','UPI','10 am');
insert into payment values('pid07','M05','270','UPI','10:01 am');
insert into payment values('pid08','M04','330','UPI','9:30 am');
insert into payment values('pid09','M04','330','UPI','11:45 am');
insert into payment values('pid10','M02','320','Debit card','8:29 am');
select * from payment;

desc shows;
insert into shows values('SHM01','M01','SC01','12:00:00','14:45:00','Kannada');
insert into shows values('SHM02','M01','SC02','12:00:00','14:45:00','Hindi');
insert into shows values('SHM03','M02','SC01','12:00:00','14:45:00','English');
insert into shows values('SHM04','M02','SC02','12:00:00','14:45:00','Hindi');
insert into shows values('SHM05','M03','SC01','12:00:00','14:45:00','Hindi');
insert into shows values('SHM06','M04','SC03','12:00:00','14:45:00','Telugu');
insert into shows values('SHM07','M04','SC02','12:00:00','14:45:00','Tamil');
insert into shows values('SHM08','M05','SC01','12:00:00','14:45:00','Telugu');
insert into shows values('SHM09','M05','SC02','12:00:00','14:45:00','Hindi');
select * from shows;

desc ticket;
insert into books values('C01',20221209,'T01');
insert into books values('C02',20221210,'T02');
insert into books values('C03',20221209,'T03');
insert into books values('C04',20221209,'T04');
insert into books values('C05',20221209,'T05');
insert into books values('C06',20221209,'T06');
insert into books values('C07',20221209,'T07');
insert into books values('C08',20221210,'T08');
insert into books values('C09',20221209,'T09');
insert into books values('C10',20221209,'T10');
select * from ticket;


