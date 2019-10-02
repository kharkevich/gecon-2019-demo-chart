CREATE DATABASE IF NOT EXISTS `messagesdb`;
-- CREATE USER proxyuser IDENTIFIED BY '***';
-- GRANT INSERT, SELECT, UPDATE ON messagesdb.* to 'proxyuser'@'%';

USE `messagesdb`;

CREATE TABLE IF NOT EXISTS `messages` (
  id INT AUTO_INCREMENT PRIMARY KEY, 
  user_from VARCHAR(50) NOT NULL,
  user_to VARCHAR(50) NOT NULL,
  text TEXT
) DEFAULT CHARSET=utf8;
