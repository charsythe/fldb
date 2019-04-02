CREATE DATABASE fldb;

CREATE TABLE users (
	user_id bigserial PRIMARY KEY,
	username varchar(25) NOT NULL,
	email varchar(50) NOT NULL,
	password varchar(15) NOT NULL,
	gender varchar(1),
	dob date,
	CONSTRAINT email_unique UNIQUE (email)
);

CREATE TABLE books (
	book_id bigserial PRIMARY KEY,
	title varchar(50) NOT NULL,
	author varchar(50) NOT NULL,
	publish_year int NOT NULL
);

CREATE TABLE genre (
	gid bigserial PRIMARY KEY,
	genre varchar(15) NOT NULL
);

CREATE TABLE book_genres (
	bgid bigserial PRIMARY KEY,
	book_id bigserial REFERENCES books (book_id),
	gid bigserial REFERENCES genre (gid)
);

CREATE TABLE user_books (
	ubid bigserial PRIMARY KEY,
	user_id bigserial REFERENCES users (user_id),
	book_id bigserial REFERENCES books (book_id),
	CONSTRAINT uid_book_unique UNIQUE (user_id, book_id)
);