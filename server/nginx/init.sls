webserver static dir:
  file.directory:
    - name: /srv/http

webserver:
  pkg.installed:
    - pkgs:
      - nginx
  git.latest:
    - name: /srv/git/oefd.ca.git
    - target: /srv/http/oefd.ca
  file.managed:
    - names:
      - /etc/nginx/nginx.conf:
        - source: salt://{{ slspath }}/nginx.conf
      - /etc/nginx/conf.d/ssl.conf:
        - source: salt://{{ slspath }}/ssl.conf
      - /etc/nginx/mime.types:
        - source: salt://{{ slspath }}/mime.types
  service.running:
    - name: nginx
    - enable: True
    - watch:
      - file: webserver
