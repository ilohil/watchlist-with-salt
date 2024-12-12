USE watchlistdb;

CREATE TABLE IF NOT EXISTS watchlist (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
wtype ENUM('movie', 'serie') NOT NULL,
year INT,
description VARCHAR(1024),
grade INT);
