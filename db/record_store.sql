-- DROP TABLE inventory;
DROP TABLE albums;
DROP TABLE artists;

CREATE TABLE artists(
  id serial primary key,
  artist_name VARCHAR(255)
);

CREATE TABLE albums(
  id serial primary key,
  album_name VARCHAR(255),
  stock INT,
  genre VARCHAR(255),
  artist_id INT references artists(id) ON DELETE CASCADE,
  sale_price INT,
  buy_price INT
);

-- CREATE TABLE inventory(
--   id serial primary key,
--   artist_id INT references artists(id) ON DELETE CASCADE,
--   album_id INT references albums(id) ON DELETE CASCADE
-- );
