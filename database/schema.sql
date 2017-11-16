-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'user'
-- 
-- ---

DROP DATABASE IF EXISTS nogosolo;
--
CREATE DATABASE nogosolo;
--
USE nogosolo;

DROP TABLE IF EXISTS `user`;
    
CREATE TABLE `user` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NULL DEFAULT NULL,
  `username` VARCHAR(25) NULL DEFAULT NULL,
  `password` VARCHAR(25) NULL DEFAULT NULL,
  `bio` VARCHAR(255) NULL DEFAULT NULL,
  `picture` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'user_event'
-- 
-- ---

DROP TABLE IF EXISTS `user_event`;
    
CREATE TABLE `user_event` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `userId` INTEGER NOT NULL,
  `eventId` VARCHAR(255) NOT NULL,
  `date` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'match'
-- 
-- ---

DROP TABLE IF EXISTS `match`;
    
CREATE TABLE `match` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `user1` INTEGER NOT NULL,
  `user2` INTEGER NOT NULL,
  `status` BIT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `user_event` ADD FOREIGN KEY (userId) REFERENCES `user` (`id`);
ALTER TABLE `match` ADD FOREIGN KEY (user1) REFERENCES `user` (`id`);
ALTER TABLE `match` ADD FOREIGN KEY (user2) REFERENCES `user` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `user` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `user_event` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `match` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `user` (`id`,`name`,`username`,`password`,`bio`,`picture`) VALUES
-- ('','','','','','');
-- INSERT INTO `user_event` (`id`,`userId`,`eventId`,`date`) VALUES
-- ('','','','');
-- INSERT INTO `match` (`id`,`user1`,`user2`,`status`) VALUES
-- ('','','','');