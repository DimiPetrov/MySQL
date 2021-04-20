-- SELECT `employee_id` AS id, CONCAT(`first_name`, ' ', `last_name`),
-- 	`department_id`, `name` AS `department_name`
-- FROM `departments` AS d JOIN `employees` AS e ON d.`manager_id` = e.`employee_id`
-- ORDER BY `employee_id` LIMIT 5;

SELECT e.`employee_id`, CONCAT(`first_name`, ' ',`last_name`) AS 'full_name',
 d.`department_id`, d.`name` FROM `employees` AS e RIGHT JOIN `departments` AS d
ON d.`manager_id` = e.`employee_id`
ORDER BY e.employee_id LIMIT 5;


SELECT a.`town_id`, name AS `town_name`, `address_text` FROM `addresses` AS a, `towns` AS t
WHERE a.`town_id` = t.`town_id` AND name IN ('San Francisco', 'Sofia', 'Carnation')
ORDER BY t.`town_id`;


SELECT `employee_id`, `first_name`, `last_name`, `department_id`, `salary`
FROM `employees` e JOIN `departments` d ON e.`department_id` = d.`department_id`
WHERE e.`manager_id` IS NULL;


SELECT COUNT(e.`employee_id`) AS 'count' FROM employees AS e
WHERE e.salary >
(SELECT AVG(`salary`) AS 'average_salary' FROM `employees`);