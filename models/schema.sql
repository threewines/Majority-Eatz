DROP DATABASE IF EXISTS majorityEatzDB;
CREATE DATABASE majorityEatzDB;

CREATE TABLE groups
(
	id INT AUTO_INCREMENT NOT NULL,
	groupName VARCHAR(255) NOT NULL,
     groupAddress VARCHAR(255) NOT NULL,
     groupCity VARCHAR(255) NOT NULL,
     groupZip VARCHAR(20) NOT NULL,
     groupPhone VARCHAR(20) NOT NULL,
     groupBudget VARCHAR(20) NOT NULL,
	createdAt DATETIME,
	PRIMARY KEY (id)
);

CREATE TABLE groupMembers
(
	id INT AUTO_INCREMENT NOT NULL,
	memberName VARCHAR(255) NOT NULL,
	createdAt DATETIME,
	PRIMARY KEY (id)
);

CREATE TABLE groupPoll
(
	id INT AUTO_INCREMENT NOT NULL,
	memberName VARCHAR(255) NOT NULL,
     memberChoice1 VARCHAR(255) NOT NULL,
     memberChoice2 VARCHAR(255) NOT NULL,
	votedAt DATETIME,
	PRIMARY KEY (id)
);

CREATE TABLE search
(
	id INT AUTO_INCREMENT NOT NULL,
	resultType VARCHAR(200) NOT NULL,
	resultName VARCHAR(255) NOT NULL,
     resultAddress VARCHAR(255) NOT NULL,
     resultpcity VARCHAR(255) NOT NULL,
     resultstate VARCHAR(10) NOT NULL,
     resultzip VARCHAR(20) NOT NULL,
	addedAt DATETIME,
     resultrating VARCHAR(100),
     resultwebsite VARCHAR(100),
     resultBudget VARCHAR(100),
	PRIMARY KEY (id)
);

