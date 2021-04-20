SELECT `department_id`, MIN(`salary`) AS `minimum_salary` FROM `employees`
WHERE `department_id` IN (2, 5, 7) AND `hire_date` > '2000-01-01'
GROUP BY `department_id` ORDER BY `department_id`;

-- CREATE TABLE avg_salaries AS
-- SELECT *
-- FROM employees AS e
-- WHERE e.salary > 30000;

-- DELETE FROM avg_salaries
-- WHERE manager_id = 42;

-- UPDATE avg_salaries
-- 	SET salary = salary + 5000
-- 	WHERE department_id = 1;
-- 	
-- SELECT a.department_id, AVG(a.salary)
-- FROM avg_salaries AS a
-- GROUP BY a.department_id;


-- SELECT e.`department_id`, 
-- (SELECT e2.`salary` FROM `employees` AS e2
-- WHERE e2.`salary` > 30000 AND `manager_id` != 42 AND e2. `department_id` = e.`department_id`,
-- UPDATE e2.`salary` + 5000) 
-- AS `avg_salary`
-- FROM `employees` AS e GROUP BY e.`department_id` 
-- ORDER BY  e.`department_id`;


SELECT `department_id`, MAX(`salary`) AS `max_salary` FROM `employees`
 GROUP BY `department_id` HAVING `max_salary` NOT BETWEEN 30000 AND 70000
ORDER BY `department_id`;

SELECT COUNT(*) FROM `employees` WHERE `manager_id` IS NULL;

SELECT e.`department_id`, 
(SELECT DISTINCT e2.`salary` FROM `employees` AS e2
WHERE e2. `department_id` = e.`department_id`
ORDER BY e2.`salary` DESC LIMIT 2,1) AS `third_highest_salary`
FROM `employees` AS e GROUP BY e.`department_id` 
HAVING `third_highest_salary` IS NOT NULL
ORDER BY  e.`department_id`;

SELECT e.`first_name`, e.`last_name`, e.`department_id` FROM `employees` AS e
WHERE `salary` > 
		(SELECT AVG(e2.`salary`) AS `avg_salary` FROM `employees` AS e2
		WHERE e2.`department_id` = e.`department_id`
		GROUP BY e2.`department_id`)
 ORDER BY `department_id`, `employee_id` LIMIT 10;
 
 SELECT `department_id`, SUM(`salary`) AS `total_salary` FROM `employees`
 GROUP BY `department_id`  ORDER BY `department_id`;


