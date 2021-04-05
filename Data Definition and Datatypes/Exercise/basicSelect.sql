SELECT * FROM `towns`;
SELECT * FROM `departments`;
SELECT * FROM `employees`;

SELECT * FROM `towns`
ORDER BY `name`;
SELECT * FROM `departments`
ORDER BY `name`;
SELECT * FROM `employees`
ORDER BY `salary` DESC;

SELECT `name` FROM `towns`
ORDER BY `name`;
SELECT `name` FROM `departments`
ORDER BY `name`;
SELECT `first_name`, `last_name`, `job_title`, `salary` FROM `employees`
ORDER BY `salary` DESC;