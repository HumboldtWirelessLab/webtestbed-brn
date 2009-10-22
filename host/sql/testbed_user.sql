GRANT ALL PRIVILEGES ON *.* TO 'testbed'@'localhost' IDENTIFIED BY 'testbed'  WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'testbed'@% IDENTIFIED BY 'testbed'  WITH GRANT OPTION;
GRANT RELOAD,PROCESS ON *.* TO 'admin'@'localhost';
GRANT USAGE ON *.* TO 'dummy'@'localhost';
