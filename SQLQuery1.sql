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


