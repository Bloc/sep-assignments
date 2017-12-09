
CREATE TABLE dogs (
    id integer, 
    name varchar(25),
    gender char(1),
    age integer,
    weight integer,
    breed text,
    intake_date date,
    in_foster date
);

INSERT INTO dogs
    VALUES
    (10001, 'Boujee', 'F', 3, 36, 'labrador poodle', '2017-06-22', null),
    (10002, 'Munchkin', 'F', 0, 8, 'dachsund chihuahua', '2017-01-13', '2017-01-31'),
    (10004, 'Marley', 'M', 0, 10, 'labrador', '2017-05-04', '2016-06-20'),
    (10003, 'Lassie', 'F', 7, 17, 'collie shepherd', '2016-07-05', '2017-07-22'),
    (10006, 'Marmaduke', 'M', 7, 150, 'great dane', '2016-03-22', '2016-05-15'),
    (10007, 'Rosco', 'M', 5, 180, 'rottweiler', '2017-04-01', null);

