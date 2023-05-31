INSERT INTO authors(first_name, last_name)
VALUES ('mil','grace'),
('aung','swe');

INSERT INTO labels(title, color)
VALUES ('old','grey'),
('new','gold');

INSERT INTO genres(name)
VALUES ('horror'),
('fantasy');

INSERT INTO items(publish_date, archived)
VALUES ('2021-03-03', true),
('2023-08-25', false);

INSERT INTO books(pulblisher, cover_state, item_id, genre_id, author_id, label_id)
VALUES ('moh moh','good',1,2,1,2),
('mee mee','good',1,2,1,2);

insert into games(publish_date,multiplayer,last_played_at,genre_id,author_id,label_id) 
values ('2022-03-09','COD','2022-04-10',1,1,2);

