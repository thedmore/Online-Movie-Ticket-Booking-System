CREATE DATABASE sampledb;
USE sampledb;

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

insert into customer values
('C01','Manoj','9980714815','manoj@gmail.com','manoj#123'),
('C02','Ankur','9965717815','ankur@gmail.com','ankur#123'),
('C03','Shreya','8880714815','shreya@gmail.com','shreya#123'),
('C04','Karan','9160714158','karan@gmail.com','karan#123'),
('C05','Nikita','7906714812','nikita@gmail.com','nikita#123'),
('C06','Ira','7180994851','ira@gmail.com','ira#123'),  
('C07','Rakesh','9880554518','rakesh@gmail.com','rakesh#123'),    
('C08','Ramya','9904714333','ramya@gmail.com','ramya#123'),
('C09','Neha','9980564397','neha@gmail.com','neha#123'),
('C10','Sam','9980749861','sam@gmail.com','sam#123'),
('C11','Naveen','7980714161','naveen@gmail.com','naveen#123'),
('C12','Natasha','7980714645','natasha@gmail.com','natasha#123'),
('C13','Mayank','7880714639','mayank@gmail.com','mayank#123'),
('C14','Pranav','7780174822','pranav@gmail.com','pranav#123'),
('C15','Shweta','7764714825','manoj@gmail.com','manoj#123');

insert into multiplex values
('MP01','PVR','Ajay Bijli','Shantiniketan road','Bangalore'),
('MP02','INOX','Pavan Jain','Bangalore highway','Mysore'),
('MP03','Big Cinemas','Reliance Group','Balthakre road','Mumbai'),
('MP04','Cinépolis','Organización R','Balthakre road','Mumbai'),
('MP05','IMAX Multiplex','A R Prasad','Kukatpally abades road','Hyderabad');

insert into admins values
('riteshbmda1','riteshbmda@123','MP01'),  
('rahulbmda3','rahulbmda2@123','MP02'),
('shyambmdb2','shyambmdb2@123','MP03'),
('riyabmdc1','riyabmdc1@123','MP04'),
('niharikabmdc3','niharikabmdc3@123','MP05');

insert into screen values
('SC01','M1S1G1','Gold','MP01'),
('SC01','M1S1G2','Gold','MP01'),
('SC01','M1S1G3','Gold','MP01'),
('SC02','M1S2C1','Classic','MP01'),
('SC02','M1S2C2','Classic','MP01'),
('SC02','M1S2C3','Classic','MP01'),
('SC03','M1S3R1','Recliner','MP01'),
('SC03','M1S3R2','Recliner','MP01'),
('SC03','M1S3R3','Recliner','MP01'),
('SC01','M2S1G1','Gold','MP02'),
('SC01','M2S1G2','Gold','MP02'),
('SC01','M2S1G3','Gold','MP02'),
('SC02','M2S2R1','Recliner','MP02'),
('SC02','M2S2R2','Recliner','MP02'),
('SC02','M2S2R3','Recliner','MP02'),
('SC03','M2S3C1','Classic','MP02'),
('SC03','M2S3C2','Classic','MP02'),
('SC03','M2S3C3','Classic','MP02'),
('SC01','M3S1G1','Gold','MP03'),
('SC01','M3S1G2','Gold','MP03'),
('SC01','M3S1G3','Gold','MP03'),
('SC02','M3S2R1','Recliner','MP03'),
('SC02','M3S2R2','Recliner','MP03'),
('SC02','M3S2R3','Recliner','MP03'),
('SC03','M3S3C1','Classic','MP03'),
('SC03','M3S3C2','Classic','MP03'),
('SC03','M3S3C3','Classic','MP03'),
('SC01','M4S1R1','Recliner','MP04'),
('SC01','M4S1R2','Recliner','MP04'),
('SC01','M4S1R3','Recliner','MP04'),
('SC02','M4S2C1','Classic','MP04'),
('SC02','M4S2C2','Classic','MP04'),
('SC02','M4S2C3','Classic','MP04'),
('SC03','M4S3G1','Gold','MP04'),
('SC03','M4S3G2','Gold','MP04'),
('SC03','M4S3G3','Gold','MP04'),
('SC01','M5S1C1','Classic','MP05'),
('SC01','M5S1C2','Classic','MP05'),
('SC01','M5S1C3','Classic','MP05'),
('SC02','M5S2R1','Recliner','MP05'),
('SC02','M5S2R2','Recliner','MP05'),
('SC02','M5S2R3','Recliner','MP05'),
('SC03','M5S3G1','Gold','MP05'),
('SC03','M5S3G2','Gold','MP05'),
('SC03','M5S3G3','Gold','MP05');

insert into ticket values
('T01','SH01','SC01','R1','2022-12-10 12:00:00','245','pid01'),
('T02','SH01','SC01','G2','2022-12-10 12:00:00','245','pid02'),
('T03','SH01','SC01','C3','2022-12-10 12:00:00','245','pid03'),
('T04','SH02','SC02','C2','2022-12-10 12:00:00','250','pid04'),
('T05','SH02','SC02','C1','2022-12-10 12:00:00','245','pid05'),
('T06','SH02','SC02','C3','2022-12-10 18:15:00','345','pid06'),
('T07','SH01','SC03','G3','2022-12-11 12:00:00','245','pid07'),
('T08','SH03','SC02','R2','2022-12-10 18:00:00','345','pid08'),
('T09','SH02','SC01','R3','2022-12-10 17:00:00','245','pid09'),
('T10','SH01','SC01','C1','2022-12-10 12:00:00','245','pid10');

insert into books values
('C01',20221209,'T01'),
('C02',20221210,'T02'),
('C03',20221209,'T03'),
('C04',20221209,'T04'),
('C05',20221209,'T05'),
('C06',20221209,'T06'),
('C07',20221209,'T07'),
('C08',20221210,'T08'),
('C09',20221209,'T09'),
('C10',20221209,'T10');

insert into movie values
('M01','SHM01','Kantara','hours 45 minutes','Rishab Shetty','Rishab Shetty, Sapthami Gowda','Drama/Thriller',20220930),
('M02','SHM02','Avatar 2','3 hour','David Miller','John, Elizabeth','Sci-fi/Action',20221230),
('M03','SHM03','Goodbye','2 hours 45 minutes','Vikas Bahi','Amitabh Bachan, Rashmika Mandanna','Comedy/Drama',20221007),
('M04','SHM04','Godfather','2 hours 37 minutes','Mohan Raja','Chiranjeevi, Tanya Ravichandran, Nayanthara','Action',20220930),
('M05','SHM05','Liger','2 hours 20 minutes','Puri Jagannadh','Vijay Devarakonda, Ananya Pandey','Action/Romance',20220930);

insert into payment values
('pid01','M01','250','UPI','9 am'),
('pid02','M01','250','UPI','8:45 am'),
('pid03','M03','350','Debit card','9 am'),
('pid04','M01','250','UPI','9:05 am'),
('pid05','M01','250','UPI','9:03 am'),
('pid06','M02','320','UPI','10 am'),
('pid07','M05','270','UPI','10:01 am'),
('pid08','M04','330','UPI','9:30 am'),
('pid09','M04','330','UPI','11:45 am'),
('pid10','M02','320','Debit card','8:29 am');

insert into shows values
('SHM01','M01','SC01','12:00:00','14:45:00','Kannada'),
('SHM02','M01','SC02','12:00:00','14:45:00','Hindi'),
('SHM03','M02','SC01','12:00:00','14:45:00','English'),
('SHM04','M02','SC02','12:00:00','14:45:00','Hindi'),
('SHM05','M03','SC01','12:00:00','14:45:00','Hindi'),
('SHM06','M04','SC03','12:00:00','14:45:00','Telugu'),
('SHM07','M04','SC02','12:00:00','14:45:00','Tamil'),
('SHM08','M05','SC01','12:00:00','14:45:00','Telugu'),
('SHM09','M05','SC02','12:00:00','14:45:00','Hindi');





