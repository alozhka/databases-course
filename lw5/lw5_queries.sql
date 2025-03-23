-- 2. Выдать информацию по всем заказам лекарствам “Кордерон” компании “Аргус”
-- с указанием названий аптек, дат, объема заказов.
SELECT ph.name AS pharmacy_name, o.date, o.quantity
FROM "order" o
         JOIN pharmacy ph ON o.id_pharmacy = ph.id_pharmacy
         JOIN production pr ON o.id_production = pr.id_production
         JOIN company c ON pr.id_company = c.id_company
         JOIN medicine m ON pr.id_medicine = m.id_medicine
WHERE m.name = 'Кордерон'
  AND c.name = 'Аргус';

-- 3. Дать список лекарств компании “Фарма”, на которые не были сделаны заказы до 25 января.

SELECT m.*
FROM medicine m
         JOIN production p ON m.id_medicine = p.id_medicine
         JOIN "order" o ON p.id_production = o.id_production
         LEFT JOIN company c ON p.id_company = c.id_company AND o.date < '2019-01-25'
where c.name = 'Фарма';

-- 4. Дать минимальный и максимальный баллы лекарств каждой фирмы, которая оформила не менее 120 заказов.
SELECT c.name AS company_name, max(p.rating) AS max_rating, min(p.rating) AS min_rating
FROM production p
         JOIN company c ON p.id_company = c.id_company
         JOIN "order" o ON p.id_production = o.id_production
GROUP BY c.name
HAVING count(o) > 120;

-- 5. Дать списки сделавших заказы аптек по всем дилерам компании “AstraZeneca”.
-- Если у дилера нет заказов, в названии аптеки проставить NULL.

SELECT d.name AS dealer_name, d.phone AS dealer_phone, ph.name as pharmacy_name
FROM company c
         JOIN public.dealer d ON c.id_company = d.id_company
         LEFT JOIN public."order" o ON d.id_dealer = o.id_dealer
         LEFT JOIN pharmacy ph ON o.id_pharmacy = ph.id_pharmacy
WHERE c.name = 'AstraZeneca';


-- 6. Уменьшить на 20% стоимость всех лекарств, если она превышает 3000, а длительность лечения не более 7 дней.
BEGIN TRANSACTION;

UPDATE production p
SET price = price * 0.8
FROM medicine m
WHERE p.id_medicine = m.id_medicine
  AND p.price::numeric > 3000
  AND m.cure_duration <= 7;

ROLLBACK TRANSACTION;

-- 7. Добавить необходимые индексы.
BEGIN TRANSACTION;

CREATE INDEX idx_dealer_company ON public.dealer(id_company);
CREATE INDEX idx_production_company ON public.production(id_company);
CREATE INDEX idx_production_medicine ON public.production(id_medicine);
CREATE INDEX idx_order_production ON public."order"(id_production);
CREATE INDEX idx_order_dealer ON public."order"(id_dealer);
CREATE INDEX idx_order_pharmacy ON public."order"(id_pharmacy);
CREATE INDEX idx_pharmacy_name ON public.pharmacy(name);
CREATE INDEX idx_medicine_name ON public.medicine(name);
CREATE INDEX idx_company_name ON public.company(name);

END TRANSACTION;
