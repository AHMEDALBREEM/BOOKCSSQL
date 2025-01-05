-- Find all books by a specific author
SELECT *
FROM "books"
WHERE "id" IN (
    SELECT "book_id"
    FROM "book_authors"
    WHERE "author_id" = (
        SELECT "id"
        FROM "authors"
        WHERE "name" = 'Author Name'
    )
);

-- Find all reviews for a specific book by ISBN
SELECT * 
FROM "reviews"
WHERE "book_id" = (
    SELECT "id"
    FROM "books"
    WHERE "isbn" = '1234567890123'
);

-- Find all reviews by a specific user
SELECT * 
FROM "reviews"
WHERE "user_id" = (
    SELECT "id"
    FROM "users"
    WHERE "username" = 'user_example'
);

-- Add a new book
INSERT INTO "books" ("title", "year_published", "isbn", "publisher_id")
VALUES ('New Book Title', 2024, '1234567890123', 1);

-- Add a new author
INSERT INTO "authors" ("name", "bio")
VALUES ('New Author', 'Short bio about the author.');

-- Add a new publisher
INSERT INTO "publishers" ("name", "address")
VALUES ('New Publisher', 'Publisher Address');

-- Add a new review
INSERT INTO "reviews" ("book_id", "user_id", "rating", "review", "review_date")
VALUES (1, 1, 5, 'Great book!', CURRENT_DATE);

-- Add a new user
INSERT INTO "users" ("username", "email")
VALUES ('newuser', 'newuser@example.com');

-- Associate a book with an author (many-to-many relationship)
INSERT INTO "book_authors" ("book_id", "author_id")
VALUES (1, 1);

-- Find all books with a specific publisher
SELECT *
FROM "books"
WHERE "publisher_id" = (
    SELECT "id"
    FROM "publishers"
    WHERE "name" = 'Publisher Name'
);

-- Find all books within a specific year range
SELECT *
FROM "books"
WHERE "year_published" BETWEEN 2000 AND 2024;
