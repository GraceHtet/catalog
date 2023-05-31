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
    archived BOOLEAN,
    pulblisher VARCHAR(255) NOT NULL,
    cover_state VARCHAR(255) NOT NULL,
    item_id INT REFERENCES items(id),
    genre_id INT REFERENCES genres(id),
    author_id INT REFERENCES authors(id),
    label_id INT REFERENCES labels(id),
    PRIMARY KEY (id,item_id, genre_id, author_id, label_id)
);

-- INSERT INTO authors(first_name, last_name)
-- VALUES ('mil','grace'),
-- ('aung','swe');

-- INSERT INTO labels(title, color)
-- VALUES ('old','grey'),
-- ('new','gold');

-- INSERT INTO genres(name)
-- VALUES ('horror'),
-- ('fantasy');

-- INSERT INTO items(publish_date, archived)
-- VALUES ('2021-03-03', true),
-- ('2023-08-25', false);

-- INSERT INTO books(pulblisher, cover_state, item_id, genre_id, author_id, label_id)
-- VALUES ('moh moh','good',1,2,1,2),
-- ('mee mee','good',1,2,1,2);

-- SELECT B.pulblisher, B.cover_state, I.publish_date,A.first_name, G.name, L.title FROM books B JOIN items I ON B.item_id = I.id JOIN genres G ON b.genre_id = G.id JOIN authors A ON b.author_id = A.id JOIN labels L ON B.label_id = L.id;