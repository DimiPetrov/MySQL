DROP FUNCTION IF EXISTS ufn_count_employees_by_town;

DELIMITER //
CREATE FUNCTION ufn_count_employees_by_town(town_name VARCHAR(50))
RETURNS INT DETERMINISTIC
BEGIN
DECLARE emp_count INT;
SET emp_count := (SELECT COUNT(*) FROM employees 
JOIN addresses USING (address_id)
JOIN towns t USING (town_id)
WHERE t.`name` = town_name);
RETURN emp_count;
END //
DELIMITER ;

SELECT ufn_count_employees_by_town('Sofia');
-- SELECT employee_id, first_name, last_name, t.`name` FROM employees
-- JOIN addresses USING (address_id)
-- JOIN towns t USING (town_id)
-- WHERE t.`name` = 'Sofia';


DROP PROCEDURE IF EXISTS usp_select_employees_by_seniority;
DELIMITER //
CREATE PROCEDURE usp_select_employees_by_seniority(years_employeed INT)
BEGIN
	SELECT employee_id, first_name, last_name, hire_date FROM employees
    WHERE ROUND(DATEDIFF(NOW(), hire_date) / 365.25) < years_employeed;
END //
DELIMITER ;

CALL usp_select_employees_by_seniority(15);
DROP PROCEDURE usp_select_employees_by_seniority;


DROP PROCEDURE IF EXISTS usp_raise_salaries;
DELIMITER //
CREATE PROCEDURE usp_raise_salaries(department_name varchar(50))
BEGIN
	UPDATE employees AS e
	JOIN departments AS d
	ON e.department_id = d.department_id
	SET salary = salary * 1.05
	WHERE d.name = department_name;
END //
DELIMITER ;

CALL usp_raise_salaries('Sales');


DROP PROCEDURE IF EXISTS usp_raise_salary_by_id;
DELIMITER //
CREATE PROCEDURE usp_raise_salary_by_id(id int)
BEGIN
	START TRANSACTION;
	IF((SELECT count(employee_id) FROM employees WHERE employee_id like id)<>1) THEN
	ROLLBACK;
	ELSE
	UPDATE employees AS e SET salary = salary + salary*0.05 WHERE e.employee_id = id;
	END IF;
END //
DELIMITER ;



CREATE TABLE deleted_employees(
employee_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(20),
last_name VARCHAR(20),
middle_name VARCHAR(20),
job_title VARCHAR(50),
department_id INT,
salary DOUBLE
);

CREATE TRIGGER tr_deleted_employees
AFTER DELETE ON employees FOR EACH ROW

BEGIN
INSERT INTO deleted_employees
(first_name,last_name,middle_name,job_title,department_id,salary)
VALUES(OLD.first_name,OLD.last_name,OLD.middle_name,OLD.job_title,
OLD.department_id,OLD.salary);
END;

