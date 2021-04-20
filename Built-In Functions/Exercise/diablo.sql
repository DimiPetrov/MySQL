SELECT `name`, `start` FROM `games`
DATE_FORMAT(`start`, 'YYYY-MM-DD')
WHERE YYYY(`start`) IN (2011, 2012) LIMIT 50; 

SELECT `user_name`, SUBSTRING(`email`, LOCATE('@', `email`) + 1)  
AS 'Email Provider' FROM `users`
ORDER BY `Email_Provider`, `user_name`;

SELECT `user_name`, `ip_address` FROM `users`
WHERE `ip_address` LIKE '___.1%.%.___' ORDER BY `user_name`;

SELECT `name`,
(CASE 
	WHEN HOUR(`start`) BETWEEN 0 AND 11 THEN 'Morning'
    WHEN HOUR(`start`) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
    END
    ) AS 'Part of the Day',
    (
		CASE
        WHEN `duration` BETWEEN 0 AND 3 THEN 'Extra Short'
        WHEN `duration` BETWEEN 4 AND 6 THEN 'Short'
        WHEN `duration` BETWEEN 7 AND 10 THEN 'Long'
        ELSE 'Extra Long'
        END
    ) AS 'Duration'
    FROM `games`;