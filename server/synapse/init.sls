synapse:
  file.directory:
    - name: /srv/synapse
  docker_image.present:
    - name: matrixdotorg/synapse
    - tag: v0.33.4

synapse config:
  file.recurse:
    - name: /etc/synapse
    - source: salt://{{ slspath }}/conf.d
    - template: jinja

synapse service:
  file.managed:
    - name: /lib/systemd/system/synapse.service
    - source: salt://{{ slspath }}/synapse.service 
    - template: jinja
  service.running:
    - name: synapse
    - enable: True
