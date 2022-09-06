CREATE TABLE IF NOT EXISTS Department (
	id serial PRIMARY KEY,
	name_department varchar(60) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Positions (
	id serial PRIMARY KEY,
	name_position varchar(60) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Employee (
	id serial PRIMARY KEY,
	name_employee integer NOT NULL,
	name_department integer NOT NULL REFERENCES Department(id),
	name_position integer NOT NULL REFERENCES Positions(id),
	email varchar(60) NOT NULL UNIQUE,
	date_of_employment date CHECK(date_of_employment >= '2000-01-01' AND date_of_employment <= current_date),
	id_manager integer REFERENCES Employee(id)
);
