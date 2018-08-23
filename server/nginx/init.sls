webserver static dir:
  file.directory:
    - name: /srv/http

webserver:
  pkg.installed:
    - pkgs:
      - nginx
  git.latest:
    - name: /srv/git/xnr.git
    - target: /srv/http/xnr
  file.managed:
    - names:
      - /etc/nginx/nginx.conf:
        - source: salt://{{ slspath }}/nginx.conf
      - /etc/nginx/conf.d/ssl.conf:
        - source: salt://{{ slspath }}/ssl.conf
  service.running:
    - name: nginx
    - enable: True
    - watch:
      - file: webserver
