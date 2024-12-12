mariadb-packages:
  pkg.installed:
    - pkgs:
      - mariadb-client
      - mariadb-server

mariadb:
  service.running
