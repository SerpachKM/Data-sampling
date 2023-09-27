CREATE TABLE IF NOT EXISTS genres (
	genre_id serial PRIMARY KEY,
	genre_name varchar(50) 
);

CREATE TABLE IF NOT EXISTS executors (
	executor_id serial PRIMARY KEY,
	executor_name varchar(50) 
);

CREATE TABLE IF NOT EXISTS genres_executors (
	genre_executor_id serial PRIMARY KEY,
	genre_id int REFERENCES genres(genre_id),
	executor_id int REFERENCES executors(executor_id)
);

CREATE TABLE IF NOT EXISTS albums (
	album_id serial PRIMARY KEY,
	album_name varchar(50) NOT NULL,
	album_year int NOT NULL
);

CREATE TABLE IF NOT EXISTS executors_albums (
	executor_album_id serial PRIMARY KEY,
	executor_id int REFERENCES executors(executor_id),
	album_id int REFERENCES albums(album_id)
);

CREATE TABLE IF NOT EXISTS tracks (
	track_id serial PRIMARY KEY,
	track_name varchar(50) NOT NULL,
	track_duration int NOT NULL,
	album_id int REFERENCES albums(album_id)
);

CREATE TABLE IF NOT EXISTS collections (
	collection_id serial PRIMARY KEY,
	collection_name varchar(50) NOT NULL,
	collection_year int NOT NULL
);

CREATE TABLE IF NOT EXISTS collections_tracks (
	collections_tracks_id serial PRIMARY KEY,
	collection_id int REFERENCES collections(collection_id),
	track_id int REFERENCES tracks(track_id)
);
