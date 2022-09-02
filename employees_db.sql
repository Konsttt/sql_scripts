CREATE TABLE IF NOT EXISTS Names (
	id serial PRIMARY KEY,
	name_employee varchar(60) NOT NULL,
	email_emloyee varchar(60) NOT NULL,
	phone_number varchar(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Department (
	id serial PRIMARY KEY,
	name_department varchar(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Positions (
	id serial PRIMARY KEY,
	name_position varchar(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Employee (
	id serial PRIMARY KEY,
	name_employee integer NOT NULL REFERENCES Names(id),
	name_department integer NOT NULL REFERENCES Department(id),
	name_position integer NOT NULL REFERENCES Positions(id)
);

CREATE TABLE IF NOT EXISTS Chief (
	id serial PRIMARY KEY,
	name_employee integer NOT NULL REFERENCES Names(id),
	name_department integer NOT NULL REFERENCES Department(id),
	name_position integer NOT NULL REFERENCES Positions(id)
);

CREATE TABLE IF NOT EXISTS EmployeeChief (
	employee_id integer REFERENCES Employee(id),
	chief_id integer REFERENCES Chief(id),
	CONSTRAINT emp_ch PRIMARY KEY (employee_id, chief_id)
);