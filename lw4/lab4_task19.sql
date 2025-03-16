/*
 Вариант 19. Соревнования, спортсмены, выступления.
 */

-- 3.1.a INSERT без полей
INSERT INTO athlete
VALUES (100,
        'Иванов',
        'Иван',
        'Иванович', '1997-10-23');

-- 3.1.b INSERT с полями
INSERT INTO sport (name, description)
VALUES ('Спортивный туризм',
        'вид спорта, цель которого в прохождении туристических маршрутов и преодолении естественных препятствий');

-- 3.1.INSERT с чтением данных из другой таблицы
INSERT INTO competition_age_group (competition_id, younger_age, older_age)
SELECT c.competition_id, 18, 21
FROM competition c
WHERE c.title = 'Чемпионат России';

-- 3.2.a DELETE всех
TRUNCATE sport CASCADE;

-- 3.2.b DELETE по условию
DELETE
FROM athlete
WHERE birth_date < '1999-01-01';

-- 3.3.a UPDATE всех
-- UPDATE performance
-- SET score = 0;

-- 3.3.b UPDATE по условию один
UPDATE athlete
SET birth_date = '1999-12-10'
WHERE athlete_id = 2;

-- 3.3.c UPDATE по условию несколько
UPDATE performance
SET score = 99,
    place = 1
WHERE athlete_id = 2;

-- 3.4.a SELECT с набором
SELECT last_name, first_name, patronymic
FROM athlete;

-- 3.4.b SELECT всех полей
SELECT *
FROM athlete;

-- 3.4.c SELECT с условием
SELECT *
FROM athlete
WHERE athlete_id = 90;

-- 3.5.a сортировка по возрастанию и лимиту
SELECT *
FROM athlete
ORDER BY birth_date
LIMIT 20;

-- 3.5.b сортировка по убыванию
SELECT *
FROM performance
ORDER BY score DESC;

-- 3.5.c сортировка по 2 атрибутам и лимиту
SELECT *
FROM competition_age_group
ORDER BY younger_age, older_age
LIMIT 5;

-- 3.5.d сортировка по первому извлекаемому атрибуту
SELECT name, description
FROM sport
ORDER BY name;

-- 3.6.a даты
SELECT *
FROM athlete
WHERE birth_date = '2002-09-16';

-- 3.6.b даты в диапазоне
SELECT *
FROM competition
WHERE start_date BETWEEN '2025-02-02' AND '2025-02-12';

-- 3.6.c только год из даты
SELECT last_name, first_name, extract(YEAR FROM birth_date) as birth_year
FROM athlete;

-- 3.7.a агрегация: количество записей в таблице
SELECT count(*) AS total_athletes
FROM athlete;
-- 3.7.b количество уникальных записей
SELECT count(DISTINCT athlete_id) as unique_athletes
FROM performance;

-- 3.7.c уникальные значения столбца
SELECT DISTINCT sport_id
FROM competition;

-- 3.7.d максимальное значение столбца
SELECT max(older_age)
FROM competition_age_group;

-- 3.7.e минимальное значение столбца
SELECT min(younger_age)
FROM competition_age_group;

-- 3.7.f count + group by
SELECT competition_id, count(*) AS competition_groups
FROM competition
GROUP BY competition_id;

-- 3.8.a count + group by + having
-- спортсмен с участием более двух раз
SELECT athlete_id, count(*) as competition_groups
FROM performance
GROUP BY athlete_id
HAVING count(*) > 2;
-- возрастные группы со средним баллом больше 90
SELECT competition_age_group_id, avg(score)
FROM performance
GROUP BY competition_age_group_id
HAVING avg(score) > 90;
-- соревнования с возрастными группами больше двух
SELECT competition_id, COUNT(*) AS competition_age_groups
FROM competition_age_group
GROUP BY competition_id
HAVING count(*) > 2;

-- 3.9.a LEFT JOIN и 1 where
SELECT a.last_name, a.first_name, p.score
FROM athlete a
         LEFT JOIN performance p ON p.athlete_id = a.athlete_id
WHERE p.place < 5;

--3.9.b RIGHT JOIN как в 3.9.a
SELECT a.last_name, a.first_name, p.score
FROM performance p
         RIGHT JOIN athlete a on a.athlete_id = p.athlete_id
WHERE p.place < 5;

--3.9.c LEFT JOIN из трёх таблиц и по where из каждой
SELECT
FROM athlete a
         LEFT JOIN performance p on a.athlete_id = p.athlete_id
         LEFT JOIN competition_age_group g ON g.competition_age_group_id = p.competition_age_group_id
         LEFT JOIN competition c ON c.competition_id = g.competition_id
WHERE c.start_date > '2022-01-01'
  AND g.younger_age > 21
  AND p.score > 90;

-- 3.10 INNER JOIN двух таблиц
SELECT a.last_name, a.first_name, p.place, p.score
FROM athlete a
         INNER JOIN performance p on a.athlete_id = p.athlete_id;

-- 3.11.a подзапрос с where in
SELECT *
FROM competition c
WHERE competition_id IN (SELECT competition_id FROM competition_age_group WHERE younger_age > 12);

-- 3.11.b подзапрос внутри select
SELECT a.last_name, a.first_name, (SELECT score FROM performance p WHERE place < 10)
FROM athlete a;

-- 3.11.c select * from (подзапрос)
SELECT *
FROM (SELECT * FROM competition c WHERE start_date > '2025-01-01') AS recent_competitions;

-- 3.11.d select * from table join (подзапрос)
SELECT c.title, g.younger_age, g.older_age
FROM competition c
         JOIN (SELECT * FROM competition_age_group WHERE older_age < 30) AS g ON g.competition_id = c.competition_id;
