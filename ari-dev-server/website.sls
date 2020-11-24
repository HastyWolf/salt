ensure-default-website-removed:
  file.absent:
    - name: /var/www/html/index.nginx-debian.html

copy-website:
  file.managed:
    - name: /var/www/html/index.html
    - source: salt://ari-dev-server/files/nginx/index.html
    - user: root
    - group: root
    - mode: '0644'

restart-nginx-if-website-updated:
  service.running:
    - name: nginx
    - reload: True
    - watch:
      - file: /var/www/html/index.html