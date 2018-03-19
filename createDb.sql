
DROP TABLE IF EXISTS `Rod`;

CREATE TABLE `Rod` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name_ru` VARCHAR(100) NOT NULL,
  `name_latin` VARCHAR(100) NOT NULL,
  `changed_date` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
);


DROP TABLE IF EXISTS `Vid`;

CREATE TABLE `Vid` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name_ru` VARCHAR(100) NOT NULL,
  `name_latin` VARCHAR(100) NOT NULL,
  `description` VARCHAR(1000) NULL DEFAULT NULL,
  `id_Rod` INTEGER NULL DEFAULT NULL,
  `changed_date` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
);


DROP TABLE IF EXISTS `Priznaki_roda`;

CREATE TABLE `Priznaki_roda` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR(100) NOT NULL,
  `changed_date` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
);


DROP TABLE IF EXISTS `File`;

CREATE TABLE `File` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `file_path_small` VARCHAR(500) NULL DEFAULT NULL,
  `file_path_big` VARCHAR(500) NULL DEFAULT NULL,
  `status` VARCHAR(100) NOT NULL,
  `id_Vid` INTEGER NULL DEFAULT NULL,
  `id_User` INTEGER NULL DEFAULT NULL,
  `changed_date` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
);


DROP TABLE IF EXISTS `Opredelenie_roda`;

CREATE TABLE `Opredelenie_roda` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_Rod` INTEGER NULL DEFAULT NULL,
  `id_Rodovie_priznaki` INTEGER NULL DEFAULT NULL,
  `changed_date` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
);


DROP TABLE IF EXISTS `Grupps_rodovih_priznakov`;

CREATE TABLE `Grupps_rodovih_priznakov` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_Rodovie_priznaki` INTEGER NULL DEFAULT NULL,
  `id_Name_groups` INTEGER NULL DEFAULT NULL,
  `changed_date` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
);


DROP TABLE IF EXISTS `Name_rodovih_grupp`;

CREATE TABLE `Name_rodovih_grupp` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR(100) NOT NULL,
  `changed_date` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
);


DROP TABLE IF EXISTS `Opredelenie_vida`;

CREATE TABLE `Opredelenie_vida` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_Vid` INTEGER NULL DEFAULT NULL,
  `id_Priznaki_vida` INTEGER NULL DEFAULT NULL,
  `status` VARCHAR(100) NOT NULL,
  `id_User` INTEGER NULL DEFAULT NULL,
  `changed_date` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
);


DROP TABLE IF EXISTS `Priznaki_vida`;

CREATE TABLE `Priznaki_vida` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_Rod` INTEGER NULL DEFAULT NULL,
  `name` VARCHAR(100) NOT NULL,
  `changed_date` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
);


DROP TABLE IF EXISTS `Grupps_vidovih_priznakov`;

CREATE TABLE `Grupps_vidovih_priznakov` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_Priznaki_vida` INTEGER NULL DEFAULT NULL,
  `id_Name_vodovih_grupp` INTEGER NULL DEFAULT NULL,
  `changed_date` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
);


DROP TABLE IF EXISTS `Name_vidovih_grupp`;

CREATE TABLE `Name_vidovih_grupp` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR(100) NOT NULL,
  `changed_date` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
);


DROP TABLE IF EXISTS `Fiz_lico`;

CREATE TABLE `Fiz_lico` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `family_name` VARCHAR(100) NOT NULL,
  `changed_date` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
);


DROP TABLE IF EXISTS `User`;

CREATE TABLE `User` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_Fiz_lico` INTEGER NULL DEFAULT NULL,
  `login` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `role` VARCHAR(100) NOT NULL,
  `changed_date` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
);


DROP TABLE IF EXISTS `Groups`;

CREATE TABLE `Groups` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_User` INTEGER NULL DEFAULT NULL,
  `id_Ekspedicia` INTEGER NULL DEFAULT NULL,
  `changed_date` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
);


DROP TABLE IF EXISTS `Ekspedicia`;

CREATE TABLE `Ekspedicia` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `start_date` VARCHAR(30) NOT NULL,
  `end_date` VARCHAR(30) NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `changed_date` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
);


ALTER TABLE `Vid` ADD FOREIGN KEY (id_Rod) REFERENCES `Rod` (`id`);
ALTER TABLE `File` ADD FOREIGN KEY (id_Vid) REFERENCES `Vid` (`id`);
ALTER TABLE `File` ADD FOREIGN KEY (id_User) REFERENCES `User` (`id`);
ALTER TABLE `Opredelenie_roda` ADD FOREIGN KEY (id_Rod) REFERENCES `Rod` (`id`);
ALTER TABLE `Opredelenie_roda` ADD FOREIGN KEY (id_Rodovie_priznaki) REFERENCES `Priznaki_roda` (`id`);
ALTER TABLE `Grupps_rodovih_priznakov` ADD FOREIGN KEY (id_Rodovie_priznaki) REFERENCES `Priznaki_roda` (`id`);
ALTER TABLE `Grupps_rodovih_priznakov` ADD FOREIGN KEY (id_Name_groups) REFERENCES `Name_rodovih_grupp` (`id`);
ALTER TABLE `Opredelenie_vida` ADD FOREIGN KEY (id_Vid) REFERENCES `Vid` (`id`);
ALTER TABLE `Opredelenie_vida` ADD FOREIGN KEY (id_Priznaki_vida) REFERENCES `Priznaki_vida` (`id`);
ALTER TABLE `Opredelenie_vida` ADD FOREIGN KEY (id_User) REFERENCES `User` (`id`);
ALTER TABLE `Priznaki_vida` ADD FOREIGN KEY (id_Rod) REFERENCES `Rod` (`id`);
ALTER TABLE `Grupps_vidovih_priznakov` ADD FOREIGN KEY (id_Priznaki_vida) REFERENCES `Priznaki_vida` (`id`);
ALTER TABLE `Grupps_vidovih_priznakov` ADD FOREIGN KEY (id_Name_vodovih_grupp) REFERENCES `Name_vidovih_grupp` (`id`);
ALTER TABLE `User` ADD FOREIGN KEY (id_Fiz_lico) REFERENCES `Fiz_lico` (`id`);
ALTER TABLE `Groups` ADD FOREIGN KEY (id_User) REFERENCES `User` (`id`);
ALTER TABLE `Groups` ADD FOREIGN KEY (id_Ekspedicia) REFERENCES `Ekspedicia` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Rod` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Vid` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Priznaki_roda` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `File` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Opredelenie_roda` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Grupps_rodovih_priznakov` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Name_rodovih_grupp` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Opredelenie_vida` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Priznaki_vida` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Grupps_vidovih_priznakov` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Name_vidovih_grupp` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Fiz_lico` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `User` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Groups` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Ekspedicia` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Rod` (`id`,`name_ru`,`name_latin`) VALUES
-- ('','','');
-- INSERT INTO `Vid` (`id`,`name_ru`,`name_latin`,`description`,`id_Rod`) VALUES
-- ('','','','','');
-- INSERT INTO `Priznaki_roda` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `File` (`id`,`file_path_small`,`file_path_big`,`status`,`id_Vid`,`id_User`) VALUES
-- ('','','','','','');
-- INSERT INTO `Opredelenie_roda` (`id`,`id_Rod`,`id_Rodovie_priznaki`) VALUES
-- ('','','');
-- INSERT INTO `Grupps_rodovih_priznakov` (`id`,`id_Rodovie_priznaki`,`id_Name_groups`) VALUES
-- ('','','');
-- INSERT INTO `Name_rodovih_grupp` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `Opredelenie_vida` (`id`,`id_Vid`,`id_Priznaki_vida`,`status`,`id_User`) VALUES
-- ('','','','','');
-- INSERT INTO `Priznaki_vida` (`id`,`id_Rod`,`name`) VALUES
-- ('','','');
-- INSERT INTO `Grupps_vidovih_priznakov` (`id`,`id_Priznaki_vida`,`id_Name_vodovih_grupp`) VALUES
-- ('','','');
-- INSERT INTO `Name_vidovih_grupp` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `Fiz_lico` (`id`,`first_name`,`last_name`,`family_name`) VALUES
-- ('','','','');
-- INSERT INTO `User` (`id`,`id_Fiz_lico`,`login`,`password`,`role`) VALUES
-- ('','','','','');
-- INSERT INTO `Groups` (`id`,`id_User`,`id_Ekspedicia`) VALUES
-- ('','','');
-- INSERT INTO `Ekspedicia` (`id`,`start_date`,`end_date`,`title`) VALUES
-- ('','','','');