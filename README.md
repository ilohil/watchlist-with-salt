# watchlist-with-salt

This project involves creating a SaltStack module to automate the installation and configuration of MariaDB. MariaDB-module generates watchlistdb-database which is for storing a list of favorite movies and series. Phpmyadmin-module creates a simple user interface for the database.

![Picture of user interface](phpmyadmin.png)

This module performs the following tasks:

- Downloads and installs MariaDB database server.
- Creates a new Linux user and a corresponding database user.
- Grants appropriate permissions to the database user.
- Configures a database named watchlistdb and a table named watchlist.
- Downloads phpMyAdmin, Apache, php & php-mysql.
- Sets config-file for Apache and enables it.
