-- 2. Выдать информацию о клиентах гостиницы “Космос”, проживающих в номерах
-- категории “Люкс” на 1 апреля 2019г.

SELECT c.*
FROM client c
         JOIN booking b ON c.id_client = b.id_client
         JOIN public.room_in_booking rib on b.id_booking = rib.id_booking
         JOIN public.room r on rib.id_room = r.id_room
         JOIN public.room_category rc on r.id_room_category = rc.id_room_category
         JOIN public.hotel h on r.id_hotel = h.id_hotel
WHERE '2019-04-01' BETWEEN rib.checkin_date AND rib.checkout_date
  AND rc.name = 'Люкс'
  AND h.name = 'Космос';

-- 3. Дать список свободных номеров всех гостиниц на 22 апреля.

SELECT r.*
FROM room r
WHERE r.id_room NOT IN (SELECT id_room
                        FROM room_in_booking
                        WHERE DATE '2019-04-22' BETWEEN checkin_date AND checkout_date);

-- 4. Дать количество проживающих в гостинице “Космос” на 23 марта по каждой
-- категории номеров

SELECT rc.name AS room_category, count(c) AS clients_amount
FROM room_category rc
         JOIN public.room r on rc.id_room_category = r.id_room_category
         JOIN public.room_in_booking rib on r.id_room = rib.id_room
         JOIN public.booking b on rib.id_booking = b.id_booking
         JOIN public.client c on b.id_client = c.id_client
WHERE '2019-04-22' BETWEEN rib.checkin_date AND rib.checkout_date
GROUP BY rc.name;

-- 5. Дать список последних проживавших клиентов по всем комнатам гостиницы
-- “Космос”, выехавшим в апреле с указанием даты выезда.

SELECT DISTINCT ON (r.id_room) r.number AS room_number, rib.checkout_date, c.*
FROM client c
         JOIN public.booking b on c.id_client = b.id_client
         JOIN public.room_in_booking rib on b.id_booking = rib.id_booking
         JOIN public.room r on rib.id_room = r.id_room
         JOIN public.hotel h on r.id_hotel = h.id_hotel
WHERE h.name = 'Космос'
  AND rib.checkout_date BETWEEN '2019-04-01' AND '2019-04-30';

-- 6. Продлить на 2 дня дату проживания в гостинице “Космос” всем клиентам
-- комнат категории “Бизнес”, которые заселились 10 мая.

BEGIN TRANSACTION;

UPDATE room_in_booking rib
SET checkout_date = checkout_date + INTERVAL '2 days'
FROM room r
         JOIN public.room_category rc ON r.id_room_category = rc.id_room_category
         JOIN public.hotel h ON r.id_hotel = h.id_hotel
WHERE rib.id_room = r.id_room
  AND rib.checkin_date = '2019-04-10'
  AND rc.name = 'Бизнес'
  AND h.name = 'Космос';

ROLLBACK TRANSACTION;

-- 7. Найти все "пересекающиеся" варианты проживания. Правильное состояние: не
-- может быть забронирован один номер на одну дату несколько раз, т.к. нельзя
-- заселиться нескольким клиентам в один номер. Записи в таблице
-- room_in_booking с id_room_in_booking = 5 и 2154 являются примером
-- неправильного состояния, которые необходимо найти. Результирующий кортеж
-- выборки должен содержать информацию о двух конфликтующих номерах.

SELECT rib1.*, rib2.*
FROM room_in_booking rib1
         JOIN room_in_booking rib2 ON rib1.id_room = rib2.id_room
    AND rib1.id_room_in_booking < rib2.id_room_in_booking
    AND rib1.checkin_date <= rib2.checkout_date
    AND rib2.checkin_date <= rib1.checkout_date;

-- 8. Создать бронирование в транзакции.
-- Бронируем пользователя ID=1 в Космос в номер 777 с 12 по 29 августа

BEGIN TRANSACTION;

INSERT INTO booking (id_booking, id_client, booking_date)
VALUES (2005, 1, CURRENT_DATE);

SELECT r.id_room  -- 102
FROM room r
         JOIN public.hotel h on r.id_hotel = h.id_hotel
WHERE h.name = 'Космос'
  AND r.number = '53';

INSERT INTO room_in_booking(id_booking, id_room, checkin_date, checkout_date)
VALUES (2005, 102, '2019-08-12', '2019-08-29');

-- COMMIT;
ROLLBACK TRANSACTION;

-- 9. Добавить необходимые индексы для всех таблиц.

BEGIN TRANSACTION;

CREATE INDEX IX_booking_id_client ON booking(id_client);
CREATE INDEX IX_booking_booking_date ON booking(booking_date);

CREATE INDEX IU_hotel_name ON hotel(name);

CREATE INDEX IX_room_id_hotel ON room(id_hotel);
CREATE INDEX IX_room_id_room_category ON room(id_room_category);
CREATE INDEX IU_room_number ON room(number);

CREATE UNIQUE INDEX IU_room_category_name ON room_category(name);

CREATE INDEX IX_room_in_booking_id_booking ON room_in_booking(id_booking);
CREATE INDEX IX_room_in_booking_id_room ON room_in_booking(id_room);
CREATE INDEX "IX_room_in_booking_checkin_date-checkout_date" ON room_in_booking(checkin_date, checkout_date);

ROLLBACK TRANSACTION;