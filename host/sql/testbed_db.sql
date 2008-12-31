 CREATE DATABASE `testbed` ;
 
 CREATE TABLE `testbed`.`devices` (
`id` INT NOT NULL AUTO_INCREMENT ,
`name` VARCHAR( 50 ) NOT NULL ,
`place` VARCHAR( 50 ) NULL ,
`state` INT NOT NULL DEFAULT '0',
`comment` TEXT NULL ,
PRIMARY KEY ( `id` )
) ENGINE = MYISAM

 CREATE TABLE `testbed`.`devicestate` (
`id` INT NOT NULL ,
`statename` VARCHAR( 50 ) NOT NULL ,
`comment` TEXT NULL ,
UNIQUE (
`id`
)
) ENGINE = MYISAM

 CREATE TABLE `testbed`.`measurement` (
`id` INT NOT NULL AUTO_INCREMENT ,
`devicegroupid` INT NOT NULL ,
`clickfile` MEDIUMBLOB NOT NULL ,
`clickfilename` VARCHAR( 255 ) NOT NULL,
`deviceconfig` INT NOT NULL ,
`userid` INT NOT NULL ,
`runtime` INT NOT NULL ,
`state` INT NOT NULL ,
`resultfile` VARCHAR( 255 ) NULL ,
PRIMARY KEY ( `id` )
) ENGINE = MYISAM 

 CREATE TABLE `testbed`.`measurementstate` (
`id` INT NOT NULL ,
`statename` VARCHAR( 50 ) NOT NULL ,
PRIMARY KEY ( `id` )
) ENGINE = MYISAM

 INSERT INTO `testbed`.`measurementstate` (
`id` ,
`statename`
)
VALUES (
'0', 'UNKNOWN'
), (
'1', 'SCHEDULED'
), (
'2', 'RUNNING'
), (
'3', 'FINISHED'
), (
'4', 'ERROR'
);

INSERT INTO `testbed`.`devicestate` (
`id` ,
`statename` ,
`comment`
)
VALUES (
'0', 'UNKNOWN', 'State of device is not known.'
), (
'1', 'OK', 'Device is ready.'
);

 CREATE TABLE `testbed`.`users` (
`id` INT NOT NULL AUTO_INCREMENT ,
`name` VARCHAR( 100 ) NOT NULL ,
`passwd` VARCHAR( 100 ) NOT NULL ,
PRIMARY KEY ( `id` ) ,
UNIQUE (
`name`
)
) ENGINE = MYISAM
 
 CREATE TABLE `testbed`.`devicegroups` (
`id` INT NOT NULL AUTO_INCREMENT,
`name` VARCHAR( 100 ) NOT NULL ,
PRIMARY KEY ( `id` )
) ENGINE = MYISAM 

 CREATE TABLE `testbed`.`devicegroupmembers` (
`groupid` INT NOT NULL ,
`deviceid` INT NOT NULL
) ENGINE = MYISAM 

 CREATE TABLE `testbed`.`deviceconfig` (
`id` INT NOT NULL AUTO_INCREMENT ,
`name` VARCHAR( 30 ) NOT NULL ,
`channel` SMALLINT NOT NULL ,
`macclone` SMALLINT NOT NULL ,
`channelswitch` SMALLINT NOT NULL ,
`cca` SMALLINT NOT NULL ,
`power` SMALLINT NOT NULL ,
`wifitype` INT NOT NULL ,
PRIMARY KEY ( `id` ) ,
UNIQUE (
`name`
)
) ENGINE = MYISAM 
