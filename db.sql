
CREATE TABLE uzytkownik (id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
login VARCHAR(15) NOT NULL, 
pwd VARCHAR(60) NOT NULL, 
email VARCHAR(200) NOT NULL); 

CREATE TABLE project (
 id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 label VARCHAR(50) NOT NULL, 
 id_creator BIGINT NOT NULL,
 collected float NOT NULL,
 amount float NOT NULL,
 endDate  DATETIME NOT NULL, 
 startDate  DATETIME NOT NULL, 
 dsc VARCHAR(2000), 
 CONSTRAINT fk_Project_Uzytkownik FOREIGN KEY(id_creator) REFERENCES uzytkownik(id)
 ); 
 
  CREATE TABLE daily (
  id BIGINT  NOT NULL PRIMARY KEY AUTO_INCREMENT ,
  title VARCHAR(500) NOT NULL,
  createdDate  DATETIME NOT NULL, 
  dsc VARCHAR(3000),
  id_project BIGINT NOT NULL,
  CONSTRAINT fk_Daily_Project FOREIGN KEY(id_project) REFERENCES project(id)
);
 
CREATE TABLE image (
  id BIGINT  NOT NULL PRIMARY KEY AUTO_INCREMENT ,
  path VARCHAR(500) NOT NULL,
  dsc VARCHAR(500),
  id_project BIGINT,
  id_daily BIGINT,
  CONSTRAINT fk_Image_Project FOREIGN KEY(id_project) REFERENCES project(id),
   CONSTRAINT fk_Image_Daily FOREIGN KEY(id_daily) REFERENCES daily(id)
);

 
CREATE TABLE video (
  id BIGINT  NOT NULL PRIMARY KEY AUTO_INCREMENT ,
  path VARCHAR(500) NOT NULL,
  dsc VARCHAR(500),
  id_project BIGINT,
  id_daily BIGINT,
  CONSTRAINT fk_Video_Project FOREIGN KEY(id_project) REFERENCES project(id),
   CONSTRAINT fk_Video_Daily FOREIGN KEY(id_daily) REFERENCES daily(id)
);

 CREATE TABLE role (
  id BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL ,
  role VARCHAR(50) NOT NULL
);

CREATE TABLE uzytkownik_role (
  id_uzytkownik BIGINT NOT NULL,
  id_role BIGINT NOT NULL,
  CONSTRAINT fk_Klient_roleKlient FOREIGN KEY(id_uzytkownik) REFERENCES uzytkownik(id),
  CONSTRAINT fk_Klient_roleRole FOREIGN KEY(id_role) REFERENCES role(id)
);
 
CREATE TABLE donation (
 id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 amount float NOT NULL,
 dsc VARCHAR(50), 
 id_project BIGINT NOT NULL,
 id_donator BIGINT,
 CONSTRAINT fk_Donation_Project FOREIGN KEY(id_project) REFERENCES project(id),
 CONSTRAINT fk_Donation_Uzytkownik FOREIGN KEY(id_donator) REFERENCES uzytkownik(id)
 ); 
 
insert into uzytkownik (login,pwd,email) values ('jaguar','$2a$06$GaupHA1XhamsHE1P0ful2e5Ov/ZxSY05E6Kmiottf0f8I4yA4zATC','jaguar@jaguar.pl');

insert into uzytkownik (login,pwd,email) values ('ford','$2a$06$GaupHA1XhamsHE1P0ful2e5Ov/ZxSY05E6Kmiottf0f8I4yA4zATC','jaguar@jaguar.pl');

INSERT INTO role (id,role)
VALUES (1,'ROLE_ADMIN');

INSERT INTO role (id,role)
VALUES (2,'ROLE_KLIENT');

INSERT INTO uzytkownik_role(id_uzytkownik,id_role) VALUES (1,1);
INSERT INTO uzytkownik_role(id_uzytkownik,id_role) VALUES (2,1);

INSERT INTO video(id_daily,path,dsc) VALUES (1,'http://www.youtube.com/embed/Yz7AsfJVhN0','koldi');

INSERT INTO daily(title,createdDate,dsc,id_project) VALUES ('Dzien 2','2016-02-02 12:37:09','Opis 2',1);

delete FROM uzytkownik_role WHERE uzytkownik_role.id_uzytkownik = 1
delete FROM uzytkownik WHERE uzytkownik.ID = 1

DELETE FROM image where image.id = 5

update image set id_project=1 where 
