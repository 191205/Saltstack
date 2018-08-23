/etc/zsh/zshenv:
  file.managed:
    - source: salt://{{ slspath }}/zshenv

{% for file in [
  ".bashrc",
  ".bash_profile",
  ".bash_logout",
] %}
/etc/skel/{{ file }}:
  file.absent
{% endfor %}

{% for dir in [
  "documents",
  "downloads",
  "images",
  ".config",
  ".local",
  ".cache",
  ".ssh",
] %}
/etc/skel/{{ dir }}:
  file.directory:
    - makedirs: True
{% endfor %}

/etc/skel/.config/user-dirs.dirs:
  file.managed:
    - source: salt://{{ slspath }}/user-dirs.dirs

xdg:
  file.managed:
    - makedirs: True
    - names:
      - /etc/profile.d/xdg_compliance.sh:
        - source: salt://{{ slspath }}/xdg_compliance.sh
      - /etc/npm/npmrc:
        - source: salt://{{ slspath }}/npmrc

terry:
  pkg.installed:
    - pkgs:
      - zsh
      - lua-penlight
      - lua-filesystem
  user.present:
    - fullname: Terry Kerr
    - shell: /usr/bin/zsh
    - home: /home/terry
    - password: {{ pillar.user.password }}
    - remove_groups: False
    - groups:
      - wheel
  file.managed:
    - user: terry
    - group: terry
    - makedirs: True
    - names:
      - /home/terry/.config/zsh/.zshrc:
        - source: salt://{{ slspath }}/zshrc
      - /home/terry/.config/zsh/prompt.lua:
        - source: salt://{{ slspath }}/prompt.lua
        - mode: 755
      - /home/terry/.gitconfig:
        - source: salt://{{ slspath }}/gitconfig
      - /home/terry/.config/gnupg/gpg-agent.conf:
        - source: salt://{{ slspath }}/gpg-agent.conf
      - /home/terry/.config/systemd/user/ssh-agent.service:
        - source: salt://{{ slspath }}/ssh-agent.service
  git.latest:
    - name: https://github.com/zdharma/fast-syntax-highlighting
    - target: /home/terry/.local/zsh/fast
      user: terry
  cmd.run:
    - runas: terry
    - names:
      - systemctl --user enable gpg-agent.socket:
        - creates: /home/terry/.config/systemd/user/sockets.target.wants/gpg-agent.socket
      - systemctl --user enable ssh-agent.socket:
        - creates: /home/terry/.config/systemd/user/default.target.wants/ssh-agent.service
