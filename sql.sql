CREATE SCHEMA `korea`;

CREATE TABLE `korea`.`provinces`
(
    `index` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(10)       NOT NULL,
    CONSTRAINT PRIMARY KEY (`index`),
    CONSTRAINT UNIQUE (`name`)
);

TRUNCATE `korea`.`provinces`;

INSERT INTO `korea`.`provinces` (`name`)
VALUES ('특별시'), ('광역시'), ('도'), ('특별자치도'), ('특별자치시');

CREATE TABLE `korea`.`cities`
(
    `index` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(3) NOT NULL,
    `name` VARCHAR(10) NOT NULL,
    `province_index` TINYINT UNSIGNED NOT NULL,
    CONSTRAINT PRIMARY KEY (`index`),
    CONSTRAINT UNIQUE (`code`),
    CONSTRAINT UNIQUE (`name`),
    CONSTRAINT FOREIGN KEY (`province_index`) REFERENCES `korea`.`provinces`(`index`)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO `korea`.`cities` (`code`, `name`, `province_index`)
VALUES ('02','서울',1),
       ('051','부산',2),
       ('053','대구',2),
       ('032','인천',2),
       ('062','광주',2),
       ('042','대전',2),
       ('052','울산',2),
       ('044','세종',5),
       ('031','경기',3),
       ('033','강원',3),
       ('043','충청북',3),
       ('041','충청남',3),
       ('063','전라북',3),
       ('061','전라남',3),
       ('054','경상북',3),
       ('055','경상남',3),
       ('064','제주',4);
TRUNCATE `korea`.`cities`;
-- Concatenate
SELECT CONCAT('Hello', ' ', 'World!');

CREATE TABLE `korea`.`populations`
(
    `index` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `city_index` TINYINT UNSIGNED NOT NULL,
    `populations` INT UNSIGNED NOT NULL,
    CONSTRAINT PRIMARY KEY (`index`),
    CONSTRAINT FOREIGN KEY (`city_index`) REFERENCES `korea`.`cities`(`index`)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO `korea`.`populations` (`city_index`, `populations`)
VALUES (1, '9495807'),
       (2, '3336737'),
       (3, '2375306'),
       (4, '2957066'),
       (5, '1435378'),
       (6, '1448401'),
       (7, '1115609'),
       (8, '380215'),
       (9, '13585967'),
       (10, '1539064'),
       (11, '1597118'),
       (12, '2120201'),
       (13, '1778279'),
       (14, '1826440'),
       (15, '2613963'),
       (16, '3295615'),
       (17, '678012');



SELECT `citie`.`code` AS `지역번호`,
       CONCAT(`citie`.`name`,`province`.`name` ) AS `지역명`,
       `population`.`populations` AS `인구`
FROM `korea`.`provinces` AS `province`
         LEFT JOIN `korea`.`cities`AS `citie` ON `province`.`index` = `citie`.`province_index`
         LEFT JOIN  `korea`.`populations` AS `population` ON `citie`.`index` = `population`.`city_index`
ORDER BY `citie`.`index`;
