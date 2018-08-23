pgsql data dir:
  file.directory:
    - name: /srv/pgsql

pgsql:
  file.managed:
    - name: /lib/systemd/system/pgsql.service
    - source: salt://{{ slspath }}/pgsql.service
    - template: jinja
  docker_image.present:
    - name: postgres
    - tag: 11-alpine 
  service.running:
    - enable: True
