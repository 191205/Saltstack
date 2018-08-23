syncthing:
  pkg.installed: []
  user.present:
    - name: sync
    - fullname: Syncthing User
    - shell: /usr/sbin/nologin
  file.directory:
    - name: /srv/sync
    - user: sync
    - group: sync

syncthing.service:
  file.managed:
    - name: /lib/systemd/system/syncthing.service
    - source: salt://{{ slspath }}/syncthing.service
  cmd.run:
    - name: systemctl daemon-reload
    - onchanges:
      - file: syncthing.service
  service.running:
    - enable: True
