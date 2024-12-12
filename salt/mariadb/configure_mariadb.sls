{% set root_password = 'root' %}
{% set user_password = 'admin' %}

admin:
  user.present

set_root_password:
  cmd.run:
    - name: mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED VIA mysql_native_password USING PASSWORD('{{ root_password }}');"
    - onlyif: mariadb -u root -e "SELECT plugin FROM mysql.user WHERE User='root';" | grep -qv 'mysql_native_password'

remove_test_database:
  cmd.run:
    - name: mariadb -u root -p'{{ root_password }}' -e "DROP DATABASE IF EXISTS test;"
    - onlyif: mariadb -u root -p'{{ root_password }}' -e "SHOW DATABASES LIKE 'test'" | grep -q '^test$'

create_user:
  cmd.run:
    - name: mariadb -u root -p'{{ root_password }}' -e "CREATE USER 'admin'@'localhost' IDENTIFIED BY '{{ user_password }}';"
    - unless: mariadb -u root -p'{{ root_password }}' -e "SELECT User FROM mysql.user WHERE User='admin';" | grep -i "admin"

create_database:
  cmd.run:
    - name: mariadb -u root -p'{{ root_password }}' -e "CREATE DATABASE IF NOT EXISTS watchlistdb"
    - unless: mariadb -u root -p'{{ root_password }}' -e "SHOW DATABASES LIKE 'watchlistdb';" | grep -i "watchlistdb"

grant_priviledges:
  cmd.run:
    - name: mariadb -u root -p'{{ root_password }}' -e "GRANT ALL PRIVILEGES ON watchlistdb.* TO 'admin'@'localhost'; FLUSH PRIVILEGES;"
    - unless: mariadb -u root -p'{{ root_password }}' -e "SHOW GRANTS FOR 'admin'@'localhost'" | grep -i "watchlistdb"
    
/home/admin/mariadb:
  file.directory:
    - user: admin
    - group: admin
    
/home/admin/mariadb/create_table.sql:
  file.managed:
    - source: salt://mariadb/create_table.sql
    - user: admin
    - group: admin
    
create_table:
  cmd.run:
    - name: mariadb -u admin -p'{{ user_password }}' < /home/admin/mariadb/create_table.sql
    - unless: mariadb -u admin -p'{{ user_password }}' watchlistdb -e "SHOW TABLES LIKE 'watchlist'" | grep -q 'watchlist'
