CREATE DATABASE booking;

ALTER TABLE booking
ADD CONSTRAINT fk_booking_client FOREIGN KEY (id_client) REFERENCES client(id_client);

ALTER TABLE room_in_booking
ADD CONSTRAINT fk_room_in_booking_booking FOREIGN KEY (id_booking) REFERENCES booking(id_booking),
ADD CONSTRAINT  fk_room_in_booking_room FOREIGN KEY (id_room) REFERENCES room(id_room);

ALTER TABLE room
ADD CONSTRAINT fk_room_hotel FOREIGN KEY (id_hotel) REFERENCES hotel(id_hotel),
ADD CONSTRAINT fk_room_room_category FOREIGN KEY (id_room_category) REFERENCES room_category(id_room_category);
