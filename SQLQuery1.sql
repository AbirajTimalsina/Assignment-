CREATE DATABASE DDD
use DDD

--TASK 2A
--Creating Table
create table location_Abiraj(
locationID int identity not null primary key,
location_Name varchar(50),
);

create table facility_Abiraj(
facilityId int identity not null primary key,
facility_Name varchar(50),
);

create table equipment_Abiraj(
equipmentId int identity not null primary key,
equipment_Name varchar(50),
);

create table speaker_Abiraj(
speaker_Id int identity not null primary key,
speaker_firstname varchar(30),
speaker_lastname varchar(30),
);

create table conference_organization_Abiraj(
conference_organization_ID int identity not null primary key,
conference_organization_Name varchar(100),
);


create table venue_Abiraj(
venue_ID varchar(10) not null primary key,
venue_Name varchar(50),
location_Id int not null,
constraint fk_location_ID foreign key(location_ID) REFERENCES location_Abiraj(locationID) ON DELETE CASCADE
);


create table venue_facility_Abiraj(
venue_ID varchar(10) not null,
facilityId int not null,
constraint fk_venue_facility_ID foreign key(venue_ID) REFERENCES venue_Abiraj(venue_ID) ON DELETE CASCADE,
constraint fk_facility_venu_ID foreign key(facilityId) REFERENCES facility_Abiraj(facilityID) ON DELETE CASCADE
);

create table room_Abiraj(
room_ID int identity not null primary key,
room_Name varchar(50),
venue_ID varchar(10),
constraint fk_venue_ID foreign key(venue_ID) REFERENCES venue_Abiraj(venue_ID) ON DELETE CASCADE
);



create table room_equipment_Abiraj(
room_ID int not null,
equipmentId int not null,
constraint fk_room_equipment_id foreign key(room_ID) references room_Abiraj(room_ID) ON DELETE CASCADE,
constraint fk_equipment_room_id foreign key(equipmentId) references equipment_Abiraj(equipmentId) ON DELETE CASCADE
);


create table conference_Abiraj 
(
conference_ID varchar(10) not null primary key,
conference_Name varchar(50),
date_start date,
date_end date,
conference_organization_ID int,
venue_id varchar(10),
constraint fk_conference_organization_id foreign key (conference_organization_ID) REFERENCES 
conference_organization_Abiraj(conference_organization_ID) ON DELETE CASCADE,
constraint fk_conference_venue_id foreign key(venue_ID) REFERENCES venue_Abiraj(venue_ID) ON DELETE CASCADE
);



Create table conference_room_speaker_Abiraj(
room_ID int not null,
conference_ID varchar(10) not null,
speaker_ID int not null,
speaker_date date,
slot char(5),
topic varchar(100),
constraint fk_room_speaker_conference_id foreign key (room_ID) REFERENCES room_Abiraj(room_ID), 
constraint fk_conference_room_speaker_id foreign key (conference_ID) REFERENCES conference_Abiraj(conference_ID) ON DELETE CASCADE,
constraint fk_speaker_conference_room_id foreign key (speaker_ID) REFERENCES speaker_Abiraj(speaker_ID) ON DELETE CASCADE,
)


--END----------------------------------------



--  TASK 2B---------------------------------------
--INSERTING INTO Tables
insert into location_Abiraj(location_name) values
('London'),
('Manchester'),
('Cambridge'),
('Oxford');
select * from location_Abiraj

insert into venue_Abiraj(venue_id,venue_name, location_id) values
('UCL','University College London', 1),
('MMU','Manchester Metropolitan University', 2),
('ARU','Anglia Ruskin University', 3),
('BH','Brookes Hotel', 2),
('KCL','Kings College London', 1),
('QVR','Queen Victoria Research Centre', 4),
('OXB','Oxford Brookes', 4);
select * from venue_Abiraj

insert into conference_organization_Abiraj(conference_organization_name) values
('European Languages Group'),
('Ancient History Society'),
('Development Studies Group'),
('Early Modern History Society'),
('African History Society'),
('The Victorian History Society'),
('Early Railways Group');
select * from conference_organization_Abiraj

insert into conference_Abiraj(conference_id,conference_name,date_start,date_end,conference_organization_id, venue_id) values
('CLC18','Celtic Language Conference','2018-03-01','2018-03-01', 1, 'UCL'),
('ERB18','Early Roman Britain','2018-10-03','2018-10-05', 2, 'MMU'),
('DSC19','Development Studies Conference','2019-03-01','2019-03-03', 3, 'ARU'),
('CSC18','Catalan Studies Conference','2018-05-20','2018-05-23', 1, 'MMU'),
('STW19','Symposium on the Thirty Years War','2019-01-03','2019-01-05', 4, 'BH'),
('AHS18','Studies in African History','2018-05-03','2018-05-03', 5, 'KCL'),
('VSC18','Victorian Studies Conference','2018-01-03','2018-01-04', 6, 'QVR'),
('ERG18','Early Railways Conference','2018-01-19','2018-01-21', 7, 'OXB');

select * from conference_Abiraj
-- END--------------------------------------------------

---------------Task 2C-----------------------

insert into room_Abiraj(room_name, venue_id) values
('Manston Hall','QVR'),
('Robin Hall','QVR');
select * from room_Abiraj



insert into speaker_Abiraj(speaker_firstname, speaker_lastname) values
('Joshua','Patterson'),
('Glenda','Smith'),
('Mark','Reynolds'),
('Abel','Kelani'),
('Albert','Dean');
select * from speaker_Abiraj



insert into conference_room_speaker_Abiraj(conference_id,room_id,speaker_id, speaker_date, slot, topic) values
('VSC18',1,1,'2018-01-03','AM','Poetry of Matthew Arnold'),
('VSC18',2,2,'2018-01-03','AM','Influences of Darwin on the Romantic Novel'),
('VSC18',2,3,'2018-01-03','AM','Influences of Darwin on the Romantic Novel'),
('VSC18',1,1,'2018-01-03','PM','The Oxford Movement'),
('VSC18',2,4,'2018-01-03','PM','Ruskin, Morris and responses to the industrial revolution'),
('VSC18',1,2,'2018-01-04','AM','Imperial Dreams of Popular Fiction '),
('VSC18',1,3,'2018-01-04','AM','Imperial Dreams of Popular Fiction '),
('VSC18',2,5,'2018-01-04','AM','Dickens and the City');

SELECT * from conference_room_speaker_Abiraj

---------#END#------------------------


----------------2D----------------
insert into facility_Abiraj(facility_name) values
('Swimming Pool'),
('Restaurant'),
('Gym'),
('On-site Accommodation'),
('Smart Office Space');

select *from facility_Abiraj


insert into venue_facility_Abiraj(venue_ID, facilityId) values
('UCL','1'),('UCL','2'),('UCL','3'),('UCL','4'),('UCL','5'),
('MMU','1'),('MMU','2'),('MMU','3'),('MMU','4'),('MMU','5'),
('ARU','2'),('ARU','3'),
('BH','2'),('BH','3'),
('KCL','2'),
('OXB','1'),('OXB','2'),('OXB','3'),('OXB','4'),('OXB','5');

select * from venue_facility_Abiraj

----------#END#---------------------------------

--------------2E-----------------------------

insert into equipment_Abiraj(equipment_name) values
('Projecter'),
('WIFI'),
('Smart Board'),
('PC'),
('PA System');

select * from equipment_Abiraj

insert into room_equipment_Abiraj(room_id, equipmentId) values
('1','3'),('1','4'),('1','5'),
('2','1'),('2','4'),('2','5');

select * from room_equipment_Abiraj
--------#END#-----------------------

---------------------2F----------
select c.conference_ID, co.conference_organization_Name, l.location_Name from conference_Abiraj c 
inner join venue_Abiraj v on c.venue_id=v.venue_id inner join location_Abiraj l on v.location_id=l.locationID 
inner join conference_organization_Abiraj co on c.conference_organization_id=co.conference_organization_id 
and l.location_name='Manchester'

--END-----------------
------2G--------------
select c.date_start, l.location_name from conference_Abiraj c 
inner join venue_Abiraj v on c.venue_id=v.venue_id inner join location_Abiraj l on v.location_id=l.locationID 
and l.location_name='London'

----END-------------------------

-------------------2H---------------------

select crs.speaker_date, crs.slot, r.room_name, (s.speaker_firstname+' '+s.speaker_lastname)as Name, crs.topic 
from conference_room_speaker_Abiraj crs inner join conference_Abiraj c on crs.conference_id=c.conference_id
inner join room_Abiraj r on crs.room_id=r.room_id 
inner join speaker_Abiraj s on crs.speaker_id=s.speaker_id and c.conference_id='VSC18'

-----END--------------------

------------------------2I------------------

select equipment_name, room_name from equipment_Abiraj e, room_Abiraj r, room_equipment_Abiraj re 
where (e.equipmentId=re.equipmentId AND r.room_id=re.room_id) and r.room_name='Manston Hall'    

-----END--------------------

------------------------2J------------------

select facility_name, venue_name from venue_Abiraj v, facility_Abiraj f, venue_facility_Abiraj vf 
where (v.venue_id=vf.venue_id AND f.facilityId=vf.facilityId) and v.venue_name='University College London'    

-----END--------------------

------------------------2K------------------

insert into speaker_Abiraj(speaker_firstname,speaker_lastname) values('Robert','Matthews');

update conference_room_speaker_Abiraj set speaker_id=6 from speaker_Abiraj s
inner join conference_room_speaker_Abiraj crs on s.speaker_Id=crs.speaker_ID
inner join room_Abiraj r on r.room_id=crs.room_id where (r.room_name='Manston Hall' and crs.slot='AM') 
and crs.speaker_date='2018-01-03'

select * from speaker_Abiraj 
select * from conference_room_speaker_Abiraj
-----END--------------------
