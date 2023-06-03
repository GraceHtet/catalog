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
    id SERIAL PRIMARY KEY,
    publish_date DATE NOT NULL,
    archived BOOLEAN DEFAULT FALSE,
    pulblisher VARCHAR(255) NOT NULL,
    cover_state VARCHAR(255) NOT NULL,
    genre_id INT REFERENCES genres(id),
    author_id INT REFERENCES authors(id),
    label_id INT REFERENCES labels(id)
);

CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    publish_date DATE NOT NULL,
    archived BOOLEAN DEFAULT FALSE,
    multiplayer VARCHAR(255) NOT NULL,
    last_played_at DATE NOT NULL,
    genre_id INT REFERENCES genres(id),
    author_id INT REFERENCES authors(id),
    label_id INT REFERENCES labels(id)
);

CREATE TABLE albums (
    id SERIAL PRIMARY KEY,
    publish_date DATE NOT NULL,
    on_spotify BOOLEAN DEFAULT FALSE,
    archived BOOLEAN DEFAULT FALSE,
    genre_id INT REFERENCES genres(id),
    author_id INT REFERENCES authors(id),
    label_id INT REFERENCES labels(id)
)

CREATE INDEX books_genre_id ON books (genre_id);
CREATE INDEX books_author_id ON books (author_id);
CREATE INDEX books_label_id ON books (label_id);
CREATE INDEX games_genre_id ON games (genre_id);
CREATE INDEX games_author_id ON games (author_id);
CREATE INDEX games_label_id ON games (label_id);
CREATE INDEX albums_genre_id ON albums (genre_id);
CREATE INDEX albums_author_id ON albums (author_id);
CREATE INDEX albums_label_id ON albums (label_id);
