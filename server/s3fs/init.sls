s3fs:
  file.managed:
    - name: /etc/passwd-s3fs
    - source: salt://{{ slspath }}/passwd-s3fs
    - mode: 600
    - template: jinja

/mnt/space_xnr:
  mount.mounted:
    - device: s3fs#xnr
    - fstype: fuse
    - opts: _netdev,allow_other,use_path_request_style,url=https://nyc3.digitaloceanspaces.com
    - dump: 0
    - pass_num: 0
    - persist: True
    - mkmnt: True
