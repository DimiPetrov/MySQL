SELECT e.`employee_id`, e.`job_title`, a.`address_id`, a.`address_text`
 FROM `employees` AS e JOIN `addresses` AS a ON e.`address_id` = a.`address_id`
 ORDER BY a.`address_id`;
 
 SELECT e.`first_name`, e.`last_name`, t.`name`, a.`address_text`
 FROM `employees` AS e JOIN `addresses` AS a ON e.`address_id` = a.`address_id`
 JOIN `towns` AS t ON a.`town_id` = t.`town_id`
 ORDER BY e.`first_name`, e.`last_name` LIMIT 5;
 
 SELECT e.`employee_id`, e.`first_name`, e.`last_name`, d.`name`
 FROM `employees` AS e JOIN `departments` AS d ON e.`department_id` = d.`department_id`
 WHERE d.`name` = 'Sales' ORDER BY e.`employee_id` DESC;
 
 SELECT e.`employee_id`, e.`first_name`, e.`salary`, d.`name`
 FROM `employees` AS e JOIN `departments` AS d ON e.`department_id` = d.`department_id`
  WHERE e.`salary` > 15000 ORDER BY d.`department_id` DESC LIMIT 5;
  
SELECT e.`employee_id`, e.`first_name` FROM `employees` AS e
WHERE e.`employee_id` NOT IN (SELECT `employee_id` FROM `employees_projects`)
ORDER BY e.`employee_id`  DESC LIMIT 3;

SELECT  e.`first_name`, e.`last_name`, e.`hire_date`, d.`name` FROM `employees` AS e
JOIN `departments` AS d ON e.`department_id` = d.`department_id`
WHERE e.`hire_date` > '1999-01-01' AND d.`name` IN ('Sales', 'Finance')
ORDER BY e.`hire_date`;

SELECT ep.`employee_id`, e.`first_name`, p.`name` FROM `employees` AS e
JOIN `employees_projects` AS ep ON ep.`employee_id` = e.`employee_id`
JOIN `projects` AS p ON ep.`project_id` = p.`project_id`
WHERE p.`start_date` > '2002-08-13' AND p.`end_date` IS NULL
ORDER BY e.`first_name`, p.`name` LIMIT 5;

SELECT e.`employee_id`, e.`first_name`, 
IF(YEAR(p.`start_date`) < 2005, p.`name`, NULL) AS 'project_name'
FROM `employees` AS e
JOIN `employees_projects` AS ep ON e.`employee_id` = ep.`employee_id`
JOIN `projects` AS p ON ep.`project_id` = p.`project_id`
WHERE e.`employee_id` = 24 ORDER BY `project_name`;



SELECT e.employee_id, e.first_name, e.manager_id, m.first_name AS manager_name
FROM employees AS e inner JOIN employees AS m ON e.manager_id = m.employee_id
WHERE m.employee_id IN (3,7) ORDER BY e.first_name;



 