-- 1. Внешние ключи

ALTER TABLE dealer
    ADD CONSTRAINT fk_dealer_company
        FOREIGN KEY (id_company) REFERENCES company(id_company);

ALTER TABLE production
    ADD CONSTRAINT fk_production_company
        FOREIGN KEY (id_company) REFERENCES company(id_company);

ALTER TABLE production
    ADD CONSTRAINT fk_production_medicine
        FOREIGN KEY (id_medicine) REFERENCES medicine(id_medicine);

ALTER TABLE "order"
    ADD CONSTRAINT fk_order_production
        FOREIGN KEY (id_production) REFERENCES production(id_production);

ALTER TABLE "order"
    ADD CONSTRAINT fk_order_dealer
        FOREIGN KEY (id_dealer) REFERENCES dealer(id_dealer);

ALTER TABLE "order"
    ADD CONSTRAINT fk_order_pharmacy
        FOREIGN KEY (id_pharmacy) REFERENCES pharmacy(id_pharmacy);
