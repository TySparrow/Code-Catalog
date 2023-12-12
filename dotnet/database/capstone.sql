USE master
GO
--drop database if it exists
IF DB_ID('final_capstone') IS NOT NULL
BEGIN
	ALTER DATABASE final_capstone SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE final_capstone;
END
CREATE DATABASE final_capstone
GO
USE final_capstone
GO
--create tables
CREATE TABLE users (
	user_id int IDENTITY(1,1) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	salt varchar(200) NOT NULL,
	user_role varchar(50) NOT NULL
	CONSTRAINT PK_user PRIMARY KEY (user_id)
)
CREATE TABLE examples (
	example_id int IDENTITY(1001,1) PRIMARY KEY NOT NULL,
	user_id int null,
	example_title varchar(100) UNIQUE NOT NULL,
	example_tag varchar(100) NOT NULL,
	example_language varchar(50) NOT NULL,
	example_code varchar(1000) NOT NULL,
	example_source varchar(100) NOT NULL,
	example_status varchar (30) NOT NULL
	CONSTRAINT FK_examples_user FOREIGN KEY (user_id) REFERENCES users (user_id)
);
--populate default data
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin');
INSERT INTO examples(example_title, example_tag, example_language, example_code, example_source, example_status) VALUES ('string concatination', 'strings', 'C#', '"Welcome to " + "C# snippet"', 'self-derived', 'public')
INSERT INTO examples(example_title, example_tag, example_language, example_code, example_source, example_status) VALUES ('let', 'variables', 'Javascript', 'let example = "example"', 'self-derived', 'public')
INSERT INTO examples(example_title, example_tag, example_language, example_code, example_source, example_status) VALUES ('colors', 'styling', 'css', '"color: #fff"', 'self derived', 'public')
INSERT INTO examples(example_title, example_tag, example_language, example_code, example_source, example_status) VALUES ('background color', 'styling', 'css', 'background-color: #fff', 'self-derived', 'public')
INSERT INTO examples(example_title, example_tag, example_language, example_code, example_source, example_status) VALUES ('divs', 'formatting', 'html', '<div></div>', 'self-derived', 'public')
GO