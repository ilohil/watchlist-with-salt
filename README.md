# watchlist-with-salt

This project involves creating a SaltStack module to automate the installation and configuration of MariaDB. Generated watchlistdb-database is for storing a list of favorite movies and series.

This module performs the following tasks:

- Downloads and installs MariaDB database server.
- Creates a new Linux user and a corresponding database user.
- Grants appropriate permissions to the database user.
- Configures a database named watchlistdb and a table named watchlist.
