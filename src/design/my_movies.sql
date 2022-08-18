--
-- Clear old indexes
--
DROP INDEX IF EXISTS movie_id_uindex;
DROP INDEX IF EXISTS movie_imdb_id_uindex;

--
-- Clear old tables
--
DROP TABLE IF EXISTS movies CASCADE;

--
-- Movies
--
CREATE TABLE movies
(
    id          BIGSERIAL,
    imdb_id     VARCHAR(20)                         NOT NULL,   -- 20 characters should be enough for some time.
    name        VARCHAR(255)                        NOT NULL,   -- 255 characters should be enough ( https://largest.org/entertainment/movie-names/ )
    seen        BOOL            DEFAULT FALSE       NOT NULL,
    rating      INT             DEFAULT 0           NOT NULL
    constraint ck_movie_imdb_id_not_empty
        check (LENGTH(imdb_id) > 0)
    constraint ck_movie_name_not_empty
        check (LENGTH(name) > 0)
    constraint ck_movies_rating_range
        check (seen IS FALSE AND rating = 0 OR
               seen IS TRUE AND rating BETWEEN 1 AND 10)
);

COMMENT ON CONSTRAINT ck_movie_imdb_id_not_empty ON movies IS 'Movie IMDB id cannot be empty.';
COMMENT ON CONSTRAINT ck_movie_name_not_empty ON movies IS 'Movie name cannot be empty.';
COMMENT ON CONSTRAINT ck_movies_rating_range ON movies IS 'Movie rating must be between 1 - 10.';

--
-- Indexes
--
CREATE UNIQUE INDEX movies_id_uindex ON movies (id);
CREATE UNIQUE INDEX movies_imdb_id_uindex ON movies (imdb_id);