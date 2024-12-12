install_phpmyadmin:
  pkg.installed:
    - pkgs:
      - phpmyadmin
      - apache2
      - php
      - php-mysql
