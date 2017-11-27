CREATE TABLE guests (
  id integer,
  first_name text,
  last_name text,
  phone_number varchar,
  email varchar,
  address varchar
);

CREATE TABLE rooms (
  room_number integer,
  floor_number integer,
  price_per_night integer
);

CREATE TABLE bookings (
  id integer,
  check_in_date date,
  check_out_date date,
  guest_id integer,
  room_number integer
);

INSERT INTO guests (id, first_name, last_name, phone_number, email, address) VALUES
(1, 'John', 'Baptiste', '6257381121', 'staying_human@lssc.com', '1227 Fifth Ave, New York, NY 11021'),
(2, 'Stephen', 'Colbert', '2938437154', 'host_with_mostest@lssc.com', '12 Broadway St, New York, NY, 10023'),
(3, 'Samantha', 'Bee', '5839215876', 'bee_stinger@fullfront.com', '1118 Rudyard Ln, Hoboken, NY 12543'),
(4, 'Jimmy', 'Kimmel', '9980231923', 'brooklyn_beast@westcoast.net', '32 Sunset Blvd, Fairbanks, CA 92817'),
(5, 'Jimmy', 'Fallon', '4327438829', 'luck_o_jimmy@nightly.com', '2 Celebrity Way, Fairbanks, AK, 22102');

INSERT INTO rooms (room_number, floor_number, price_per_night) VALUES
(101, 1, 100),
(102, 1, 100),
(103, 1, 110),
(201, 2, 125),
(202, 2, 125),
(203, 2, 130),
(301, 3, 125),
(302, 3, 125),
(303, 3, 130),
(401, 4, 170),
(402, 4, 170),
(403, 4, 200),
(501, 5, 200),
(502, 5, 250),
(601, 6, 500),
(602, 6, 750),
(701, 7, 2000);

INSERT INTO bookings (id, check_in_date, check_out_date, guest_id, room_number) VALUES
(1, '2017-02-21', '2017-02-27', 1, 403),
(2, '2017-03-21', '2017-03-27', 2, 701),
(3, '2017-04-21', '2017-04-27', 3, 202),
(4, '2017-04-21', '2017-04-27', 3, 203),
(5, '2017-05-21', '2017-05-27', 4, 501),
(6, '2017-06-21', '2017-06-27', 1, 403),
(7, '2017-07-21', '2017-07-27', 2, 701),
(8, '2017-05-21', '2017-05-27', 2, 701),
(9, '2017-09-21', '2017-09-27', 4, 701);
