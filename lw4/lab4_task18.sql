/*
 Вариант 18. Пьесы, театры, спектакли.
 */

-- 3.1.a INSERT без полей
INSERT INTO theatre
VALUES (4,
        'Большой театр',
        'Один из старейших театров России',
        'Театральная площадь, 1, Москва',
        1740);

-- 3.1.b INSERT с полями
INSERT INTO theatre (name, description, address, capacity)
VALUES ('МХТ имени Чехова',
        'Московский художественный театр',
        'Камергерский переулок, 3, Москва',
        850);

-- 3.1.INSERT с чтением данных из другой таблицы
INSERT INTO play (author_id, name, description, written_date)
SELECT a.author_id,
       'Щелкунчик',
       'двухактный балет по мотивам сказки Э. Т. А. Гофмана «Щелкунчик и Мышиный король»',
       '1892-12-18'
FROM author a
WHERE last_name = 'Чайковский'
  AND first_name = 'Петр'
  AND patronymic = 'Ильич';

-- 3.2.a DELETE всех
/*DELETE
FROM ticket;*/

-- 3.2.b DELETE по условию
DELETE
FROM theatre
WHERE capacity < 900;

-- 3.3.a UPDATE всех
/*UPDATE ticket
SET cost = 9999;*/

-- 3.3.b UPDATE по условию один
UPDATE ticket
SET cost = 2025
WHERE performance_id = 2;

-- 3.3.c UPDATE по условию несколько
UPDATE author
SET first_name = 'Пётр',
    birth_date = '1840-05-07'
WHERE author_id = 4;

-- 3.4.a SELECT с набором
SELECT name, description
FROM theatre;

-- 3.4.b SELECT всех полей
SELECT *
FROM ticket;

-- 3.4.c SELECT с условием
SELECT *
FROM theatre
where name = 'Большой театр';

-- 3.5.a сортировка по возрастанию и лимиту
SELECT *
FROM play
ORDER BY name
LIMIT 3;

-- 3.5.b сортировка по убыванию
SELECT *
FROM ticket
ORDER BY cost DESC;

-- 3.5.c сортировка по 2 атрибутам и лимиту
SELECT *
FROM author
ORDER BY last_name, first_name, patronymic
LIMIT 4;

-- 3.5.d сортировка по первому извлекаемому атрибуту
SELECT name, description
FROM play
ORDER BY name;

-- 3.6.a даты
SELECT *
FROM author
WHERE birth_date = '1860-01-29';

-- 3.6.b даты в диапазоне
SELECT *
FROM performance
WHERE time BETWEEN '2023-12-01 20:00' AND '2023-12-03 5:00';

-- 3.6.c только год из даты
SELECT name, extract(year from written_date) as written_year
FROM play;

-- 3.7.a агрегация: количество записей в таблице
SELECT count(*) AS total_tickets
FROM ticket;

-- 3.7.b количество уникальных записей
SELECT count(DISTINCT author_id) AS unique_authors
FROM play;

-- 3.7.c уникальные значения столбца
SELECT DISTINCT play_id
FROM performance;

-- 3.7.d максимальное значение столбца
SELECT max(cost) AS max_cost
FROM ticket;

-- 3.7.e минимальное значение столбца
SELECT min(cost) AS min_cost
FROM ticket;

-- 3.7.f count + group by
SELECT theatre_id, count(*) AS performance_count
FROM performance
GROUP BY theatre_id;

-- 3.8.a count + group by + having
-- извлекает театры с количеством представлений больше одной
SELECT theatre_id, count(*) AS perfomance_count
FROM performance
GROUP BY theatre_id
HAVING count(*) > 1;
-- извлекает авторов с количеством написанных пьес больше одной
SELECT author_id, count(*) as play_count
FROM play
GROUP BY author_id
HAVING count(*) > 1;
-- извлекает спектакли со средней стоимостью билетов больше 1500
SELECT performance_id, AVG(cost) as average_cost
FROM ticket
GROUP BY performance_id
HAVING AVG(cost) > 1500;

-- 3.9.a LEFT JOIN и 1 where
SELECT t.name as theatre_name, pl.name as play_name, p.time
FROM theatre t
         LEFT JOIN performance p ON p.theatre_id = t.theatre_id
         LEFT JOIN play pl ON p.play_id = pl.play_id
WHERE pl.name = 'Вишнёвый сад';

--3.9.b RIGHT JOIN как в 3.9.a
SELECT *
FROM play pl
         RIGHT JOIN performance p on pl.play_id = p.play_id
         RIGHT JOIN theatre t on t.theatre_id = p.theatre_id
WHERE pl.name = 'Вишнёвый сад';

--3.9.c LEFT JOIN из трёх таблиц и по where из каждой
SELECT t.name, pl.name as play_name, p.time, a.last_name, a.first_name
FROM theatre t
         LEFT JOIN performance p ON p.theatre_id = t.theatre_id
         LEFT JOIN play pl ON p.play_id = pl.play_id
         LEFT JOIN author a ON pl.author_id = a.author_id
WHERE t.capacity > 1000
  AND p.time > '2023-12-01 18:00'
  AND pl.written_date > '1860-01-01'
  AND a.birth_date > '1860-02-01';

-- 3.10 INNER JOIN двух таблиц
SELECT t.name as theatre_name, pl.name as play_name, p.time
FROM theatre t
         INNER JOIN performance p ON p.theatre_id = t.theatre_id
         INNER JOIN play pl ON p.play_id = pl.play_id
WHERE pl.name = 'Вишнёвый сад';

-- 3.11.a подзапрос с where in
SELECT p.name, p.description
FROM play p
WHERE p.author_id IN (SELECT author_id FROM author a WHERE a.birth_date > '1860-01-01');

-- 3.11.b подзапрос внутри select
SELECT name, description, (SELECT name FROM author a WHERE a.author_id = p.author_id) AS author_name
FROM play p;

-- 3.11.c select * from (подзапрос)
SELECT *
FROM (SELECT * FROM ticket WHERE cost > 2500) AS expensive_tickets;

-- 3.11.d select * from table join (подзапрос)
SELECT *
FROM theatre t
         JOIN (SELECT * FROM performance WHERE time > '2023-02-01') AS p ON p.theatre_id = t.theatre_id;