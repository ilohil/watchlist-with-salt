/etc/apache2/conf-available/phpmyadmin.conf:
  file.managed:
    - source: salt://phpmyadmin/phpmyadmin.conf

a2enconf phpmyadmin.conf:
  cmd.run:
    - unless: test -L /etc/apache2/conf-enabled/phpmyadmin.conf

apache2service:
  service.running:
    - name: apache2
    - watch:
      - file: /etc/apache2/conf-available/phpmyadmin.conf
      - cmd: a2enconf phpmyadmin.conf
