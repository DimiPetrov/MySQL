SELECT `title` FROM `books` WHERE SUBSTRING(`title`, 1, 3) = 'The';

SELECT REPLACE(`title`, 'The', '***') AS `title` FROM `books` 
WHERE SUBSTRING(`title`, 1, 3) = 'The' ORDER BY `id`;

-- SELECT INSERT(`title`, LOCATE('The', `title`, 1), 3, '***') AS `title` FROM `books` 
-- WHERE SUBSTRING(`title`, 1, 3) = 'The' ORDER BY `id`;

-- SELECT `id`, `title`, LOCATE('The', `title`, COLLATE utf8mb4_as_cs) 
-- AS 'Index of The' FROM `books`;

SELECT ROUND(SUM(`cost`), 2) FROM `books`;

SELECT concat(`first_name`, ' ', `last_name`) AS 'Full Name',
TIMESTAMPDIFF(DAY, `born`, `died`) AS 'Days Lived' FROM `authors`;

-- SELECT DATE_FORMAT('2017/05/31', '%Y %b %D') AS 'Date';

-- SELECT NOW();

SELECT `title` FROM `books` WHERE `title` LIKE 'Harry Potter%';

-- SELECT PI();

-- SELECT FLOOR(PI());

-- SELECT POW(2, 3);


