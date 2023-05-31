CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
);

CREATE TABLE labels (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    color VARCHAR(255) NOT NULL
);

CREATE TABLE books (
    id SERIAL,
    publish_date DATE NOT NULL,
    archived BOOLEAN DEFAULT FALSE,
    pulblisher VARCHAR(255) NOT NULL,
    cover_state VARCHAR(255) NOT NULL,
    genre_id INT REFERENCES genres(id),
    author_id INT REFERENCES authors(id),
    label_id INT REFERENCES labels(id),
    PRIMARY KEY (id, genre_id, author_id, label_id)
);

CREATE TABLE games (
    id SERIAL,
    publish_date DATE NOT NULL,
    archived BOOLEAN DEFAULT FALSE,
    multiplayer VARCHAR(255) NOT NULL,
    last_played_at DATE NOT NULL,
    genre_id INT REFERENCES genres(id),
    author_id INT REFERENCES authors(id),
    label_id INT REFERENCES labels(id),
    PRIMARY KEY (id, genre_id, author_id, label_id)
);