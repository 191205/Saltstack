git:
  pkg.installed: []
  user.present:
    - fullname: git
    - shell: /usr/bin/git-shell
    - home: /srv/git
  ssh_auth.present:
    - user: git
    - source: salt://{{ slspath }}/id_git.pub
  file.recurse:
    - name: /srv/git/git-shell-commands
    - source: salt://{{ slspath }}/git-shell-commands
    - user: git
    - group: git
    - file_mode: 755
