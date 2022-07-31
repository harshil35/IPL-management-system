CREATE DATABASE IPL;
USE IPL;

CREATE TABLE Team(
    team_code VARCHAR(255) NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Player(
     player_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
     first_name VARCHAR(255) NOT NULL,
     last_name VARCHAR(255) NOT NULL,
     nationality VARCHAR(255) NOT NULL,
     date_of_birth DATE NOT NULL,
     role VARCHAR(255) NOT NULL,
     team_code VARCHAR(255) NOT NULL,
     matches_played INT NOT NULL,
     runs INT NOT NULL,
     wickets INT NOT NULL,
     strike_rate DOUBLE NOT NULL,
	 economy DOUBLE NOT NULL
);

CREATE TABLE Points_table(
    team_code VARCHAR(255) NOT NULL PRIMARY KEY,
    matches_played INT NOT NULL,
    wins INT NOT NULL,
    losses INT NOT NULL,
    no_result INT NOT NULL,
    net_rr DOUBLE NOT NULL,
    points INT NOT NULL,
    rank_ INT NOT NULL
);
CREATE TABLE Match_(
    match_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    team1 VARCHAR(255) NOT NULL,
    team2 VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    stadium_name VARCHAR(255) NOT NULL
);
CREATE TABLE Match_stats(
    match_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_batting_team VARCHAR(255) NOT NULL,
    runs1 INT NOT NULL,
    wickets1 INT NOT NULL,
    runs2 INT NOT NULL,
    wickets2 INT NOT NULL,
    playes_or_not TINYINT(1) NOT NULL,
    result VARCHAR(255) NOT NULL
);
DROP Table Match_stats;

CREATE TABLE Venue(
    stadium_name VARCHAR(255) NOT NULL PRIMARY KEY,
    city VARCHAR(255) NOT NULL,
    stadium_capacity INT NOT NULL
);

ALTER TABLE
Player ADD CONSTRAINT player_team_code_foreign 
FOREIGN KEY(team_code) REFERENCES Team(team_code);

ALTER TABLE
Match_ ADD CONSTRAINT match_team1_foreign 
FOREIGN KEY(team1) REFERENCES Team(team_code);

ALTER TABLE
Match_ ADD CONSTRAINT match_team2_foreign 
FOREIGN KEY(team2) REFERENCES Team(team_code);

ALTER TABLE
Points_table ADD CONSTRAINT points_table_team_code_foreign 
FOREIGN KEY(team_code) REFERENCES Team(team_code);

ALTER TABLE
Match_ ADD CONSTRAINT match_stadium_name_foreign 
FOREIGN KEY(stadium_name) REFERENCES Venue(stadium_name);

ALTER TABLE
Match_stats ADD CONSTRAINT match_stats_match_id_foreign 
FOREIGN KEY(match_id) REFERENCES Match_(match_id);

INSERT INTO Team
VALUES ('CSK', 'Chennai Super Kings'),('MI', 'Mumbai Indians'), ('KKR', 'Kolkata Knight Riders'),
('DC', 'Delhi Capitals'), ('RCB', 'Royal Challengers Banglore'),('SRH', 'Sunrisers Hyderabad');

SELECT * FROM Team;

INSERT INTO Points_table
VALUES ('CSK',5,4,0,1,1.2,9,1),('MI',5,3,1,1,0.4,7,2),('KKR',5,3,2,0,0.1,6,3),
('DC',5,2,3,0,-0.11,4,4),('RCB',5,1,4,0,-0.3,2,5),('SRH',5,0,5,0,-0.8,0,6);

SELECT * FROM Points_table;

INSERT INTO Venue
VALUES ('WANKHEDE STADIUM','MUMBAI',90000),('EDEN GARDEN STADIUM','KOLKATA',70000),
('M CHINNASWAMY STADIUM','BENGALURU',40000);

SELECT * FROM Venue;

INSERT INTO Match_
VALUES (1,'CSK','KKR','2021-04-03','WANKHEDE STADIUM'), 
(2,'KKR','DC','2021-04-04','EDEN GARDEN STADIUM'),(3,'RCB','SRH','2021-04-05','M CHINNASWAMY STADIUM'),
(4,'CSK','MI','2021-04-06','WANKHEDE STADIUM'),(5,'KKR','RCB', '2021-04-07','EDEN GARDEN STADIUM'),
(6,'SRH','DC','2021-04-08','M CHINNASWAMY STADIUM'),(7,'CSK','DC','2021-04-09','WANKHEDE STADIUM'),
(8,'MI','SRH','2021-04-10','EDEN GARDEN STADIUM'),(9,'DC','RCB','2021-04-11','M CHINNASWAMY STADIUM'),
(10,'RCB','CSK','2021-04-12','WANKHEDE STADIUM'),(11,'KKR','MI','2021-04-13','EDEN GARDEN STADIUM'),
(12,'MI','RCB','2021-04-14','M CHINNASWAMY STADIUM'),(13,'CSK','SRH','2021-04-15','WANKHEDE STADIUM'),
(14,'DC','MI','2021-04-16','EDEN GARDEN STADIUM'),(15,'KKR','SRH','2021-04-17','M CHINNASWAMY STADIUM');

SELECT * FROM Match_;

INSERT INTO Match_stats VALUES(1,'KKR',190,8,192,3,TRUE,'CSK WON'),(2,'MI',203,0,190,3,TRUE,'KKR WON'),
(3,'CSK',212,3,177,8,TRUE,'RCB WON'),(4,'CSK',NULL,NULL,NULL,NULL,FALSE,NULL),
(5,'KKR',139,0,49,10,TRUE,'KKR WON'),(6,'SRH',160,4,99,10,TRUE,'DC WON'),
(7,'CSK',187,2,166,3,TRUE,'CSK WON'),(8,'MI',203,3,177,8,TRUE,'MI WON'),
(9,'DC',190,1,156,2,TRUE,'DC WON'),(10,'RCB',149,7,150,8,TRUE,'CSK WON'),
(11,'KKR',133,4,99,10,TRUE,'KKR WON'),(12,'MI',203,0,190,3,TRUE,'MI WON'),
(13,'CSK',212,3,177,8,TRUE,'CSK WON'),(14,'DC',155,1,156,2,TRUE,'MI WON'),
(15,'KKR',149,7,113,8,TRUE,'KKR WON');

SELECT * FROM Match_stats;

INSERT INTO Player VALUES
(1,'Mahendra','Dhoni','Indian','1981-07-07','WicketKeeper','CSK',14,301,0,160,0),
(2,'Robin','Uthappa','Indian','1985-11-11','Batsman','CSK',14,144,0,150,0),
(3,'Shivam','Dubey','Indian','1993-06-26','Batsman','CSK',14,155,0,140,0),
(4,'Ruturaj','Gaikwad','Indian','1997-01-31','Batsman','CSK',14,542,0,130,0),
(5,'Ambati','Rayudu','Indian','1985-09-23','Batsman','CSK',14,341,0,120,0),
(6,'Ravindra','Jadeja','Indian','1988-12-06','All-Rounder','CSK',14,314,10,110,6.2),
(7,'Mukesh','Choudhary','Indian','1996-07-06','Bowler','CSK',14,213,20,100,6.5),
(8,'Dwaine','Pretorius','Foreign','1989-03-29','Bowler','CSK',14,300,15,90,6.8),
(9,'Chris','Jordan','Foreign','1988-10-04','All-Rounder','CSK',14,0,15,0,7.1),
(10,'Devon','Conway','Foreign','1991-07-08','Bowler','CSK',14,0,16,0,7.4),
(11,'Dwayne','Bravo','Foreign','1983-10-07','Bowler','CSK',14,0,17,0,7.7),
(12,'Ishan', 'Kishan','Indian','1998-07-18','WicketKeeper','MI',14,321,0,190,0),
(13,'Rohit','Sharma','Indian','1987-04-30','Batsman','MI',14,431,0,179,0),
(14,'Surya','Yadav','Indian','1990-09-14','Batsman','MI',14,650,0,134,0),
(15,'Tilak','Verma','Indian','2002-11-8','Batsman','MI',14,123,0,128,0),
(16,'Sachin','Tendulkar','Indian','1973-04-24','Batsman','MI',14,234,0,190,0),
(17,'Rahul','Sharma','Indian','1991-08-31','All-Rounder','MI',14,345,0,200,0),
(18,'Arjun','Tendulkar','Indian','1999-09-24','Bowler','MI',14,432,0,201,6.1),
(19,'Keiron','Pollard','Foreign','1987-05-12','Bowler','MI',14,342,0,90,6.4),
(20,'Lasith','Malinga','Foreign','1983-08-28','All-Rounder','MI',14,121,4,100,6.7),
(21,'Daniel','Sams','Foreign','1992-10-27','Bowler','MI',14,0,3,190,7),
(22,'Tim','David','Foreign','1996-03-16','Bowler','MI',14,0,2,239,7.3), 
(23,'Sheldon','Jackson','Indian','1986-09-27','WicketKeeper','KKR',14,123,0,239,0),
(24,'Shreyas','Iyer','Indian','1994-12-06','Batsman','KKR',14,231,0,239,0),
(25,'Ajinkya','Rahane','Indian','1988-06-06','Batsman','KKR',14,423,0,239,0),
(26,'Shubman','Gill','Indian','1999-09-08','Batsman','KKR',14,345,0,239,0),
(27,'Rinku','Singh','Indian','1997-10-12','Batsman','KKR',14,643,0,239,0),
(28,'Venkatesh','Iyer','Indian','1994-12-25','All-Rounder','KKR',14,1,0,100,5.9),
(29,'Prasidh','Krishna','Indian','1996-02-19','Bowler','KKR',14,2,11,200,6.1),
(30,'Tim','Southee','Foreign','1988-12-11','Bowler','KKR',14,423,12,121,6.3),
(31,'Andre','Russel','Foreign','1988-04-29','All-Rounder','KKR',14,435,13,180,6.5),
(32,'Pat','Cummins','Foreign','1987-07-11','Bowler','KKR',14,0,14,0,6.7),
(33,'Mitch','Starc','Foreign','1989-09-15','Bowler','KKR',14,9,15,167,0),
(34,'Rishab','Pant','Indian','1992-02-16','WicketKepeer','DC',14,190,0,119,0),
(35,'Prithvi','Shaw','Indian','1993-11-11','Batsman','DC',14,176,0,120,0),
(36,'Mandeep','Singh','Indian','1986-09-09','Batsman','DC',14,173,0,115,0),
(37,'Sarfaraz','Ahmed','Indian','1981-12-12','Batsman','DC',14,156,0,117,0),
(38,'KS','Bharat','Indian','1993-08-04','Batsman','DC',14,200,0,141,9.2),
(39,'Axar','Patel','Indian','1993-08-04','AllRounder','DC',14,153,0,130,8.8),
(40,'Kamlesh','Nagarkoti','Indian','1994-09-01','Bowler','DC',14,0,10,0,8.4),
(41,'Anrich','Nortje','Foreign','1990-06-05','Bowler','DC',14,9,0,8,8),
(42,'Rowman','Powell','Foreign','1989-09-12','AllRounder','DC',14,109,8,160,7.6),
(43,'Mitch','Marsh','Foreign','1996-03-08','Bowler','DC',14,110,7,121,7.2),
(44,'Mustafiz','Rehman','Foreign','1996-11-08','Bowler','DC',14,118,6,132,6.8),
(45,'Dinesh','Kartik','Indian','1996-03-28','WicketKeeper','RCB',14,229,0,133,0),
(46,'Virat','Kohli','Indian','1996-03-09','Batsman','RCB',14,445,0,143,0),
(47,'Anuj','Rawat','Indian','1995-10-13','Batsman','RCB',14,332,0,136,0),
(48,'Mahipal','Lomror','Indian','1998-11-19','Batsman','RCB',14,365,0,189,0),
(49,'Shahbaz','Ahmed','Indian','1995-11-23','Batsman','RCB',14,343,0,190,0),
(50,'Harshal','Patel','Indian','1995-10-16','AllRounder','RCB',14,252,0,178,5.5),
(51,'Akash','Deep','Indian','1995-10-17','Bowler','RCB',14,151,11,153,6),
(52,'Josh','Hazelwood','Foreign','1995-10-18','Bowler','RCB',14,0,13,0,6.5),
(53,'Sherfane','Rutherford','Foreign','1990-11-23','Allrounder','RCB',14,2,1,20,7),
(54,'Glenn','Maxwell','Foreign','1987-12-23','Bowler','RCB',14,363,23,100,7.5),
(55,'Faf','duplessis','Foreign','1988-10-21','Bowler','RCB',14,535,19,200,8),
(56,'Naman','ojha','Indian','1990-09-23','WicketKeeper','SRH',14,131,0,200,0),
(57,'Priyam','Garg','Indian','1990-02-01','Batsman','SRH',14,232,0,132,0),
(58,'Rahul','Tripathi','Indian','1988-11-30','Batsman','SRH',14,432,0,133,0),
(59,'Abhishek','Sharma','Indian','1995-11-29','Batsman','SRH',14,540,0,139,0),
(60,'Vishnu','Vinod','Indian','1990-12-23','Batsman','SRH',14,323,0,149,0),
(61,'Shashank','Singh','Indian','1997-02-23','AllRounder','SRH',14,212,0,169,6.6),
(62,'Washington','Sunder','Indian','1983-11-02','Bowler','SRH',14,160,9,134,6.9),
(63,'Kane','Williamson','Foreign','1992-04-11','Bowler','SRH',14,170,10,200,7.2),
(64,'Umran','Malik','Foreign','1992-05-27','Allrounder','SRH',14,180,17,129,7.5),
(65,'Sean','Abbott','Foreign','1999-09-09','Bowler','SRH',14,9,2,90,7.8),
(66,'Marco','Jansen','Foreign','1989-11-20','Bowler','SRH',14,0,6,0,8.1);


SELECT * FROM Player;


SELECT * FROM Player 
WHERE Team_code='CSK'
AND nationality='Indian';



SELECT first_name, last_name, team_code, runs
FROM Player 
ORDER BY runs DESC LIMIT 10;


SELECT first_name, last_name, TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age FROM player
WHERE team_code='MI'
ORDER BY age;

SELECT first_name, last_name, TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) 
AS age FROM player WHERE date_of_birth = (SELECT min(date_of_birth) FROM player);

SELECT first_name, last_name, TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS 
age FROM player WHERE date_of_birth = (SELECT max(date_of_birth) FROM player);

SELECT * FROM match_ NATURAL JOIN match_stats;

