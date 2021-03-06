USE  `gamebar`;
CREATE TABLE `employees` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL
);

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL
);
  DROP TABLE IF EXISTS `products`
  
CREATE TABLE `products` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `category_id` INT NOT NULL,
  CONSTRAINT my_fk FOREIGN KEY (`category_id`),
  REFERENCES `categories` (`id`),
  ON DELETE RESTRICT,
  ON UPDATE CASCADE,
  INDEX `fk_categories_ind` (`category_id` ASC) VISIBLE)
);
