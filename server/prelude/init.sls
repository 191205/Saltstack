updates:
  pkg.uptodate:
    - refresh: True

/etc/motd:
  file.absent

sshd:
  file.managed:
    - name: /etc/ssh/sshd_config
    - source: salt://{{ slspath }}/sshd_config
  service.running:
    - enable: True
    - watch:
      - file: sshd
