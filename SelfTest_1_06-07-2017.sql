CREATE TABLE kids (id INTEGER, name TEXT, age INTEGER);

INSERT INTO kids (id, name, age) VALUES (1, 'Andrew', 3);
INSERT INTO kids (id, name, age) VALUES (2, 'Vivian', 1);
INSERT INTO kids (id, name, age) VALUES (3, 'Kaylee', 9);

ALTER TABLE kids ADD COLUMN birthday TEXT;

UPDATE kids SET birthday = '07-13-2013' WHERE name = 'Andrew';
UPDATE kids SET birthday = '07-05-2015' WHERE name = 'Vivian';
UPDATE kids SET birthday = '10-13-2007' WHERE name = 'Kaylee';

SELECT * FROM kids;

UPDATE kids SET age = 4 WHERE id = 1;
UPDATE kids SET age = 2 WHERE id = 2;

SELECT name, age FROM kids; 

INSERT INTO kids (id, name, age, birthday) VALUES (4, 'Katherine', 7, '05-05-2010');
INSERT INTO kids (name, age) VALUES ('Chase', 5);
INSERT INTO kids (name, age) VALUES ('Kenna', 3);

SELECT * FROM kids;

DELETE FROM kids WHERE id IS NULL;

SELECT * FROM kids;