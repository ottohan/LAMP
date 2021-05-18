ufw:
  pkg.installed:
    - pkgs:
      - ufw

/etc/ufw/user6.rules:
  file.managed:
    - source: salt://ufw/conf/default-user6.rules

/etc/ufw/user.rules:
  file.managed:
    - source: salt://ufw/conf/default-user.rules

/etc/ufw/ufw.conf:
  file.managed:
    - source: salt://ufw/conf/default-ufw.conf

ufwservices:
  service.running:
    - name: ufw
    - watch:
      - file: /etc/ufw/user6.rules
      - file: /etc/ufw/user.rules
      - file: /etc/ufw/ufw.conf
