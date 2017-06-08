CREATE TABLE companies (id INTEGER PRIMARY KEY, name TEXT, employee_satisfaction INTEGER);

INSERT INTO companies (id , name, employee_satisfaction)
	VALUES (1, 'LECO', 0);
	
INSERT INTO companies (id, name, employee_satisfaction)
	VALUES (2, 'OPTIMedical', 1);
	
INSERT INTO companies (id, name, employee_satisfaction)
	VALUES (3, 'DS_NewJob', 10);
	
SELECT * FROM companies;

ALTER TABLE companies ADD COLUMN comments TEXT;

UPDATE companies SET comments = 'Shit Hole'
	WHERE employee_satisfaction < 2;
	
UPDATE companies SET comments = 'Love it!!'
	WHERE employee_satisfaction > 5;
	
SELECT * FROM companies;

INSERT INTO companies (id, name)
	VALUES (4, 'McDonalds');
	
INSERT INTO companies (id, name)
	VALUES (5, 'Intel');

SELECT * FROM companies;

DELETE FROM companies
	WHERE comments IS NULL;
	
SELECT * FROM companies;