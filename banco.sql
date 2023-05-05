CREATE TABLE `Students` (
   `cpf` VARCHAR(12) NOT NULL,
   `name` VARCHAR(60) NOT NULL,
   `birthday` DATE NOT NULL,
   `sex` CHAR(1) NOT NULL,
   `vaccine` BOOLEAN  NOT NULL,
   `observations` VARCHAR(150),
   `cep` VARCHAR(15) NOT NULL,
   `number` VARCHAR(5) NOT NULL,
   `complement` VARCHAR(5),
   PRIMARY KEY (`cpf`)
);

CREATE TABLE `Subscriptions` (
   `id` INT(11) NOT NULL,
   `name` VARCHAR(255) NOT NULL,
   `email` VARCHAR(255),
   `phone` VARCHAR(30),
   `mobile` VARCHAR(255),
   `timestamp` DATETIME NOT NULL,
   PRIMARY KEY (`id`)
);

CREATE TABLE `Certificates` (
   `id` INT(15) NOT NULL,
   `student` VARCHAR(12) NOT NULL,
   `conclusion` DATE NOT NULL,
   `timestamp` DATETIME NOT NULL,
   `file` VARCHAR(255) NOT NULL,
   PRIMARY KEY (`id`)
);

CREATE TABLE `Registers` (
   `id` INT(20) NOT NULL,
   `class` INT(10) NOT NULL,
   `student` VARCHAR(12) NOT NULL,
   `timestamp` DATETIME NOT NULL,
   `data` JSON NOT NULL,
   PRIMARY KEY (`id`)
);

CREATE TABLE `Places` (
   `id` INT(10) NOT NULL,
   `name` VARCHAR(60) NOT NULL,
   `cep` VARCHAR(15) NOT NULL,
   `number` VARCHAR(5),
   `coordinator` VARCHAR(12),
   `phone` VARCHAR(15),
   `mobile` VARCHAR(15),
   `email` VARCHAR(30),
   PRIMARY KEY (`id`)
);

CREATE TABLE `responsible_students` (
   `responsible` VARCHAR(12) NOT NULL,
   `student` VARCHAR(12) NOT NULL
);

CREATE TABLE `Responsibles` (
   `cpf` VARCHAR(12) NOT NULL,
   `name` VARCHAR(100) NOT NULL,
   `kinship` VARCHAR(50) NOT NULL,
   `phone` VARCHAR(15),
   `mobile` VARCHAR(15) NOT NULL,
   `cep` VARCHAR(15) NOT NULL,
   `number` VARCHAR(5) NOT NULL,
   `complement` VARCHAR(50),
   PRIMARY KEY (`cpf`)
);

CREATE TABLE `Classes` (
   `id` INT(10) NOT NULL,
   `place` INT(10) NOT NULL,
   `teacher` VARCHAR(12) NOT NULL,
   `type` VARCHAR(30) NOT NULL,
   `year` VARCHAR(5) NOT NULL,
   PRIMARY KEY (`id`)
);

CREATE TABLE `Users` (
   `cpf` VARCHAR(12) NOT NULL,
   `place` INT(10),
   `name` VARCHAR(80) NOT NULL,
   `password` VARCHAR(100) NOT NULL,
   `email` VARCHAR(50) NOT NULL,
   `role` VARCHAR(20) NOT NULL,
   `enable` TINYINT(1) NOT NULL DEFAULT 1,
   PRIMARY KEY (`cpf`)
);


ALTER TABLE `Certificates` ADD CONSTRAINT `FK_eb142c7d-daed-4e3c-9ee6-051376b3eee7` FOREIGN KEY (`student`) REFERENCES `Students`(`cpf`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `Registers` ADD CONSTRAINT `FK_88e60101-658b-4253-b030-5b18880c9dea` FOREIGN KEY (`student`) REFERENCES `Students`(`cpf`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Registers` ADD CONSTRAINT `FK_f5b1384b-1a65-4f9d-8295-c5c1cfb69d9a` FOREIGN KEY (`class`) REFERENCES `Classes`(`id`)  ;

ALTER TABLE `responsible_students` ADD CONSTRAINT `FK_2a1cf8c5-4172-47cb-a5a9-a550ac4854d4` FOREIGN KEY (`responsible`) REFERENCES `Responsibles`(`cpf`)  ;

ALTER TABLE `responsible_students` ADD CONSTRAINT `FK_74124c3d-7180-42cc-9b87-bb0419557796` FOREIGN KEY (`student`) REFERENCES `Students`(`cpf`)  ;

ALTER TABLE `Classes` ADD CONSTRAINT `FK_be8a065b-b5c1-460c-8618-3864e58d8497` FOREIGN KEY (`place`) REFERENCES `Places`(`id`)  ;

ALTER TABLE `Users` ADD CONSTRAINT `FK_ab561c8b-b61b-4b74-aed1-36d3362978b9` FOREIGN KEY (`place`) REFERENCES `Places`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
