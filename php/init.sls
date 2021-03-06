php:
  pkg.installed:
    - pkgs:
      - libapache2-mod-php
      - php-mysql

/etc/apache2/mods-available/php7.2.conf:
  file.managed:
    - source: salt://php/conf/php.conf

apache2phpservices:
  service.running:
    - name: apache2
    - watch:
      - file: /etc/apache2/mods-available/php7.2.conf
