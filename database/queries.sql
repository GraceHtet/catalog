SELECT
    B.pulblisher,
    B.cover_state,
    I.publish_date,
    A.first_name,
    G.name,
    L.title
FROM
    books B
    JOIN items I ON B.item_id = I.id
    JOIN genres G ON b.genre_id = G.id
    JOIN authors A ON b.author_id = A.id
    JOIN labels L ON B.label_id = L.id;

select * from books;
select * from games;

SELECT 
    A.id, A.publish_date, A.on_spotify, A.archived
    G.name,
    L.title,
    AU.first_name, AU.last_name
FROM
    albums A
    JOIN genres G ON A.id = G.id
    JOIN authors AU ON A.id = AU.id
    JOIN labels L ON A.id = L.id
