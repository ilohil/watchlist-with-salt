# watchlist-with-salt

This project involves creating a SaltStack module to automate the installation and configuration of [MariaDB](https://mariadb.org/). The mariadb-module generates watchlistdb-database for storing a list of favorite movies and series. The phpmyadmin-module creates a simple user interface for the database using [phpMyAdmin](https://www.phpmyadmin.net/).

![Picture of user interface](phpmyadmin.png)

### Module tasks:

- Downloads and installs the MariaDB database server.
- Creates a new Linux user and a corresponding database user.
- Grants appropriate permissions to the database user.
- Configures a database named watchlistdb and a table named watchlist.
- Downloads phpMyAdmin, Apache, PHP & php-mysql.
- Sets configuration file for Apache and enables it.

## Installation and usage

### Prerequisites

 - Debian Linux 12 Bookworm
 - [Salt](https://saltproject.io/)
 - [Git](https://git-scm.com/)

### Instructions

1. Clone this repository to your preferred folder:

       $ git clone https://github.com/ilohil/watchlist-with-salt.git

2. Copy Salt folder to your /srv folder and change the ownership to root.

       $ sudo cp -r salt/ /srv/
       $ sudo chown -R root:root /srv/salt/

3. (Optional) Edit configure_mariadb.sls-file to set your preferred passwords and usernames. By default they are root (password: root) and admin (password: admin). For production, it is not safe to keep passwords in state files, so please use this project for testing purposes only:

       $ sudoedit /srv/salt/mariadb/configure_mariadb.sls

4. Run the modules. Run the mariadb module first as it sets up the database for the user interface. You can run them locally:

       $ sudo salt-call --local state.apply mariadb
       $ sudo salt-call --local state.apply phpmyadmin
 
   Or you can run them on a minion:

       $ sudo salt '{your minion}' state.apply mariadb
       $ sudo salt '{your minion}' state.apply phpmyadmin

5. After succesful runs you should be able to log in to the database using the command line or the user interface. Using the command line:

       $ mariadb -u {your username} -p'{your password}'

   Using the user interface, go to the following address in your browser:
    
        http://localhost/phpmyadmin/
        OR
        http://{IP-address}/phpmyadmin/



This project is licensed by GNU General Public License, version 3.
