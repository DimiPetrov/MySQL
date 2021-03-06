SELECT `id`, `first_name`, `last_name`, `job_title` FROM `employees`
ORDER BY `id`;

SELECT `id`, concat(`first_name`, ' ',  `last_name`) AS `full_name`,
`job_title`, `salary` FROM `employees`
WHERE `salary` > 1000;

-- SELECT DISTINCT  `last_name`, `department_id` FROM `employees`
-- WHERE `department_id` = 1;

-- SELECT DISTINCT  `last_name`, `salary` FROM `employees`
-- WHERE `salary` <= 1500;

SELECT * FROM employees AS e
WHERE e.department_id = 4 AND e.salary >= 1000;

-- SELECT `last_name` FROM `employees`
-- WHERE NOT (`department_id` = 3 OR `department_id` = 4);

-- SELECT `last_name`, `salary` FROM `employees`
-- WHERE `salary` BETWEEN 1000 AND 1200;

-- SELECT `first_name`, `last_name`, `department_id` FROM `employees`
-- WHERE `department_id` IN (109, 3, 16);

-- SELECT * FROM `employees`
-- WHERE `department_id` IN (1, 4) AND `salary` BETWEEN 1000 AND 1500;


-- ALTER TABLE `employees` ADD COLUMN `manager_id` INT;

-- UPDATE `employees`
-- SET `manager_id` = 1 
-- WHERE  `id` != 1;

-- SELECT `last_name`, `manager_id` FROM `employees`
-- WHERE `manager_id` IS NULL;

-- SELECT `last_name`, `manager_id` FROM `employees`
-- WHERE `manager_id` IS NOT NULL;
 
 
CREATE VIEW `v_top_paid_employee` AS
SELECT * FROM `employees`
ORDER BY `salary` DESC LIMIT 1;

SELECT * FROM `v_top_paid_employee`;

-- CREATE TABLE `employees_salary` AS
-- SELECT `id`, concat_ws(' ', `first_name`, `last_name`) AS `full_name`, `salary`
-- FROM `employees` ORDER BY `salary` DESC;


-- SHOW CREATE TABLE `employees`;
-- CREATE TABLE `projects` (
-- `id` 	INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
-- `name` VARCHAR(50) NOT NULL,
-- `start_date` DATE,
-- `manager_id` INT NOT NULL,
-- CONSTRAINT `fk_manager_id` 
-- FOREIGN KEY (`manager_id`) REFERENCES `employees` (`id`)
-- );

-- INSERT INTO `projects` (`name`, `start_date`, `manager_id`)
-- SELECT CONCAT(`name`, 'Restructuring'), NOW(), 1 FROM `departments`;

-- SHOW CREATE TABLE `projects`;


UPDATE `employees`
SET `salary` = `salary` + 100
WHERE `job_title` = 'Manager';
SELECT `salary` FROM `employees` ORDER BY `salary` ASC;

DELETE FROM `employees`
WHERE `department_id` IN (1, 2);
SELECT * FROM `employees`ORDER BY `id`;






