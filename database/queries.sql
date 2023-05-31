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