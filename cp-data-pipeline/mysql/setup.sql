CREATE DATABASE userdb;

USE userdb;

CREATE TABLE logs_original (id int primary key, 
	ts datetime, 
	uri_stem varchar(256), 
	user_agent varchar(128), 
	user varchar(32), 
	plugin varchar(128), 
	version varchar(32));
