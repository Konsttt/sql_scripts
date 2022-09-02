CREATE TABLE IF NOT EXISTS Styles (
	id serial PRIMARY KEY,
	style_name varchar(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Album (
	id serial PRIMARY KEY,
	album_name varchar(60) NOT NULL,
	style_id integer NOT NULL REFERENCES Styles(id),
	release_year date
);
	
CREATE TABLE IF NOT EXISTS Author (
	id serial PRIMARY KEY,
	author_name varchar(60) NOT NULL,
	nickname varchar(60)
);

CREATE TABLE IF NOT EXISTS AuthorAlbum (
	author_id integer REFERENCES Author(id),
	album_id integer REFERENCES Album(id),
	CONSTRAINT auth_alb PRIMARY KEY (author_id, album_id)
);

CREATE TABLE IF NOT EXISTS Track (
	id serial PRIMARY KEY,
	track_name varchar(60) NOT NULL,
	album integer REFERENCES Album(id),
	release_year date
);

CREATE TABLE IF NOT EXISTS Collection (
	id serial PRIMARY KEY,
	collection_name varchar(60) NOT NULL,
	release_year date
);

CREATE TABLE IF NOT EXISTS CollectionTrack(
	track_id integer REFERENCES Track(id),
	collection_id integer REFERENCES Collection(id),
	CONSTRAINT track_coll PRIMARY KEY (track_id, collection_id)
);