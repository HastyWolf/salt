ensure-default-website-removed:
  file.absent:
    - name: /var/www/html/index.nginx-debian.html

copy-website:
  file.directory:
    - name: /var/www/html/
    - source: salt://chris-dev-server/files/
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644

restart-nginx-if-website-updated:
  service.running:
    - name: nginx
    - reload: True