CREATE TABLE IF NOT EXISTS Styles (
	id serial PRIMARY KEY,
	style_name varchar(60) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Author (
	id serial PRIMARY KEY,
	author_name varchar(60) NOT NULL,
	nickname varchar(60)
);

CREATE TABLE IF NOT EXISTS StyleAuthor (
	style_id integer REFERENCES Styles(id),
	author_id integer REFERENCES Author(id),
	CONSTRAINT style_author PRIMARY KEY (style_id, author_id)
);

CREATE TABLE IF NOT EXISTS Album (
	id serial PRIMARY KEY,
	album_name varchar(60) NOT NULL,
	release_year date CHECK(release_year >= '1900-01-01' AND release_year <= current_date)
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
	length_track time NOT NULL CHECK(length_track < '01:00:00'),
	release_year date CHECK(release_year >= '1900-01-01' AND release_year <= current_date)
);

CREATE TABLE IF NOT EXISTS Collection (
	id serial PRIMARY KEY,
	collection_name varchar(60) NOT NULL,
	release_year date CHECK(release_year >= '1900-01-01' AND release_year <= current_date)
);

CREATE TABLE IF NOT EXISTS CollectionTrack(
	track_id integer REFERENCES Track(id),
	collection_id integer REFERENCES Collection(id),
	CONSTRAINT track_coll PRIMARY KEY (track_id, collection_id)
);