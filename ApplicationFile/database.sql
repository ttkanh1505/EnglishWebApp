create database toeiconline;
use toeiconline;
/*create table sql*/
create table user(
userid bigint not null primary key auto_increment , /*table user*/
name varchar(255) null,
password varchar(255) null,
fullname varchar(300) null,
createddate timestamp null
);
create table role(									/*table role*/
roleid bigint not null primary key,
name varchar(100) null
);

create table comment(								/*table comment*/
commentid bigint not null primary key auto_increment,
 userid bigint,
 content varchar(255),
 createddate timestamp null
 );
 create table listenguideline(						/*table listenguideline*/
 listenguidelineid bigint not null primary key auto_increment,
 title varchar(100),
 content varchar(255),
 image varchar(100) null,
 createddate timestamp null,
 modifieddate timestamp null
 );
 CREATE TABLE exercisetype (						/*table exercisetype*/
  exercisetypeid bigint NOT NULL PRIMARY KEY auto_increment,
  name VARCHAR(100) NOT NULL,
  code VARCHAR(100) NOT NULL,
  createddate TIMESTAMP null,
  modifieddate TIMESTAMP null,
  unique(name)
);
CREATE TABLE exercise (								/*table exercise*/
  exerciseid bigint NOT NULL PRIMARY KEY auto_increment,
  name VARCHAR(100) NOT NULL,
  exercisetypeid BIGINT NULL,
  createddate TIMESTAMP null,
  modifieddate TIMESTAMP null,
type varchar(100),
  unique(name)
);

 CREATE TABLE exercisequestion (					/*table exercisequestion*/
  exercisequestionid bigint NOT NULL PRIMARY KEY auto_increment,
  image VARCHAR(255),
  audio VARCHAR(255),
  question TEXT NOT NULL,
  option1 VARCHAR(300) NOT NULL,
  option2 VARCHAR(300) NOT NULL,
  option3 VARCHAR(300) NOT NULL,
  option4 VARCHAR(300) NOT NULL,
  correctanswer VARCHAR(10) NOT NULL,
  exerciseid BIGINT NOT NULL,
  createddate TIMESTAMP null,
  modifieddate TIMESTAMP null
);
CREATE TABLE examination (							/*table examination*/
  examinationid bigint NOT NULL PRIMARY KEY auto_increment,
  name VARCHAR(255) NOT NULL,
  createddate TIMESTAMP null,
  modifieddate TIMESTAMP null,
  unique(name)
);

CREATE TABLE examinationquestion (					/*table examinationquestion*/
  examinationquestionid bigint NOT NULL PRIMARY KEY auto_increment,
  image VARCHAR(255),
  audio VARCHAR(255),
  question TEXT NOT NULL,
  paragraph TEXT,
  option1 VARCHAR(300) NOT NULL,
  option2 VARCHAR(300) NOT NULL,
  option3 VARCHAR(300) NOT NULL,
  option4 VARCHAR(300) NOT NULL,
  correctanswer VARCHAR(10) NOT NULL,
  examinationid BIGINT NOT NULL,
  createddate TIMESTAMP null,
  modifieddate TIMESTAMP null
);
 CREATE TABLE result (								/*table result*/
  resultid bigint NOT NULL PRIMARY KEY auto_increment,
  listenscore INT NOT NULL,
  readingscore INT NOT NULL,
  examinationid BIGINT NOT NULL,
  userid BIGINT NOT NULL,
  createddate TIMESTAMP null,
  modifieddate TIMESTAMP null
);
/*alter table sql*/
alter table user add column roleid bigint ;
alter table user add constraint fk_user_role foreign key(roleid) references role(roleid);
ALTER TABLE user MODIFY COLUMN name VARCHAR(255) NOT NULL;
ALTER TABLE user MODIFY COLUMN password VARCHAR(255) NOT NULL;
ALTER TABLE user MODIFY COLUMN roleid BIGINT(20) NOT NULL;

ALTER TABLE exercise ADD CONSTRAINT fk_exercise_exercisetype FOREIGN KEY (exercisetypeid) REFERENCES exercisetype(exercisetypeid);
ALTER TABLE exercisequestion ADD CONSTRAINT fk_exercisequestion_exercise FOREIGN KEY (exerciseid) REFERENCES exercise(exerciseid);
ALTER TABLE examinationquestion ADD CONSTRAINT fk_examinationquestion_examination FOREIGN KEY (examinationid) REFERENCES examination(examinationid);
ALTER TABLE result ADD CONSTRAINT fk_result_examination FOREIGN KEY (examinationid) REFERENCES examination(examinationid);
ALTER TABLE result ADD CONSTRAINT fk_result_user FOREIGN KEY (userid) REFERENCES user(userid);

/* different SQL server and Oracle : 'drop foreign key' vs 'drop constraint' to delete a table have constraint */
alter table exercise drop foreign key fk_exercise_exercisetype;
alter table exercisequestion drop foreign key fk_exercisequestion_exercise;
alter table examinationquestion drop foreign key fk_examinationquestion_examination ;

ALTER TABLE listenguideline MODIFY COLUMN title VARCHAR(512) NOT NULL;
ALTER TABLE listenguideline MODIFY COLUMN content TEXT NOT NULL;
ALTER TABLE listenguideline MODIFY COLUMN createddate TIMESTAMP NOT NULL;
ALTER TABLE listenguideline ADD UNIQUE (title);
ALTER TABLE listenguideline MODIFY COLUMN image VARCHAR(255) NOT NULL;
/*update sql*/
UPDATE listenguideline SET image = 'Java-Framework.png' WHERE listenguidelineid =1;
UPDATE listenguideline SET image = 'Java-Framework.png' WHERE listenguidelineid =2;

/*insert sql*/
INSERT INTO role(roleid, name)values(1, 'admin'), (2, 'leader'), (3,'diretor');
INSERT INTO user(name, password, fullname, createddate, roleid) VALUES('admin', '123456', 'admin',CURRENT_TIMESTAMP, 1);
INSERT INTO user(name, password, fullname, createddate, roleid) VALUES('ttm', '123456', 'ttkanh',CURRENT_TIMESTAMP, 2);

INSERT INTO listenguideline(title, content, createddate) VALUES ('Bai hd 1', 'Noi dung bai hd 1', CURRENT_TIMESTAMP);
INSERT INTO listenguideline(title, content, createddate) VALUES ('Bai hd 2', 'Noi dung bai hd 2', CURRENT_TIMESTAMP);
INSERT INTO listenguideline(title, content, createddate) VALUES ('Bai hd 3', 'Noi dung bai hd 3', CURRENT_TIMESTAMP);
INSERT INTO listenguideline(title, content, createddate) VALUES ('Bai hd 4', 'Noi dung bai hd 4', CURRENT_TIMESTAMP);
INSERT INTO listenguideline(title, content, createddate) VALUES ('Bai hd 5', 'Noi dung bai hd 5', CURRENT_TIMESTAMP);
INSERT INTO listenguideline(title, content, createddate) VALUES ('Bai hd 6', 'Noi dung bai hd 6', CURRENT_TIMESTAMP);
INSERT INTO listenguideline(title, content, createddate) VALUES ('Bai hd 7', 'Noi dung bai hd 7', CURRENT_TIMESTAMP);
INSERT INTO listenguideline(title, content, createddate) VALUES ('Bai hd 8', 'Noi dung bai hd 8', CURRENT_TIMESTAMP);
insert into listenguideline(title, content, createddate) values ('Bai hd 9','Noi dung bai hd 9',CURRENT_TIMESTAMP);

INSERT INTO exercisetype(name, code, createddate) VALUES ('Bài tập phần nghe', 'listening', CURRENT_TIMESTAMP);
INSERT INTO exercisetype(name, code, createddate) VALUES ('Bài tập phần đọc', 'reading', CURRENT_TIMESTAMP);

INSERT INTO exercise(name, createddate, type) VALUES ('Bài tập nghe 1', CURRENT_TIMESTAMP, 'listening');
INSERT INTO exercise(name, createddate, type) VALUES ('Bài tập đọc 1', CURRENT_TIMESTAMP, 'reading');



insert into exercisequestion(image, audio, question, option1, option2, option3, option4, correctanswer, createddate, exerciseid )values(
'exercise/image_1.jpg', 'listenexercise/audio_1.mp3', 'Look at the picture and listen to the sentences in the Part 1 TOEIC Test. Choose the sentence that best describes the picture:',
'A', 'B', 'C', 'D', 'A', CURRENT_TIMESTAMP, 1);

INSERT INTO exercisequestion
(image, audio, question, option1, option2, option3, option4, correctanswer, createddate, exerciseid)
VALUES ('exercise/image_2.jpg', 'listenexercise/audio_2.mp3', 'Look at the picture and listen to the sentences in the Part 1 TOEIC Test. Choose the sentence that best describes the picture:',
        'A', 'B', 'C', 'D', 'B', CURRENT_TIMESTAMP, 1);
INSERT INTO exercisequestion
(image, audio, question, option1, option2, option3, option4, correctanswer, createddate, exerciseid)
VALUES ('exercise/image_3.jpg', 'listenexercise/audio_3.mp3', 'Look at the picture and listen to the sentences in the Part 1 TOEIC Test. Choose the sentence that best describes the picture:',
        'A', 'B', 'C', 'D', 'C', CURRENT_TIMESTAMP, 1);
INSERT INTO exercisequestion
(image, audio, question, option1, option2, option3, option4, correctanswer, createddate, exerciseid)
VALUES ('exercise/image_4.jpg', 'listenexercise/audio_4.mp3', 'Look at the picture and listen to the sentences in the Part 1 TOEIC Test. Choose the sentence that best describes the picture:',
        'A', 'B', 'C', 'D', 'D', CURRENT_TIMESTAMP, 1);

INSERT INTO exercisequestion(question, option1, option2, option3, option4, correctanswer, createddate, exerciseid)
VALUES ('I dont think he will remember the appointment you remind him.','so', 'if', 'unless', 'lest', 'C', CURRENT_TIMESTAMP, 2);

INSERT INTO exercisequestion(question, option1, option2, option3, option4, correctanswer, createddate, exerciseid)
VALUES ('The river has overflowed his banks _____ it has been raining continuously for several days.','still', 'yet', 'when', 'as', 'D', CURRENT_TIMESTAMP, 2);

INSERT INTO exercisequestion(question, option1, option2, option3, option4, correctanswer, createddate, exerciseid)
VALUES ('Those village folk are poor _____ they always seem so contented.','still', 'yet', 'when', 'as', 'C', CURRENT_TIMESTAMP, 2);

INSERT INTO exercisequestion(question, option1, option2, option3, option4, correctanswer, createddate, exerciseid)
VALUES ('he was not interested in music, he agreed to go to the concert.','still', 'yet', 'when', 'as', 'A', CURRENT_TIMESTAMP, 2);
/*drop sql

drop database toeiconline;
drop table user;
drop table role;
drop table comment;
drop table listenguideline;
drop table exercisetype;
drop table exercise;
drop table exercisequestion;
drop table examinationquestion;
drop table examination;
drop table result;



*/
/* select table sql*/
use toeiconline;

select * from user;
select * from role;
select * from comment;
select * from listenguideline;
select * from exercisetype;
select * from exercise;
select * from exercisequestion;
select * from examinationquestion;
select * from result;

