ensure-default-website-removed:
   file.absent:
    - name: /var/www/html/index.nginx-debian.html

copy-website:
  file.recurse:
    - name: /var/www/html/
    - source: salt://ari-dev-server/files/
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644

restart-nginx-if-website-updated:
  service.running:
    - name: nginx
    - reload: True
    - watch:
      - file: /var/www/html/*