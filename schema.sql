-- Create Books table
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    year_published INT CHECK (year_published > 0),
    isbn VARCHAR(13) UNIQUE NOT NULL,
    publisher_id INT REFERENCES publishers(id)
);

-- Create Authors table  
CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    bio TEXT
);

-- Create Publishers table
CREATE TABLE publishers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address TEXT
);

-- Create Reviews table
CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    book_id INT REFERENCES books(id),
    user_id INT REFERENCES users(id),
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review TEXT,
    review_date DATE DEFAULT CURRENT_DATE
);

-- Create Users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$')
);

-- Create junction table for books and authors (many-to-many relationship)
CREATE TABLE book_authors (
    book_id INT REFERENCES books(id),
    author_id INT REFERENCES authors(id),
    PRIMARY KEY (book_id, author_id)
);

-- Create indexes for frequently searched fields
CREATE INDEX idx_books_title ON books(title);
CREATE INDEX idx_authors_name ON authors(name);
CREATE INDEX idx_publishers_name ON publishers(name);
CREATE INDEX idx_reviews_rating ON reviews(rating);
