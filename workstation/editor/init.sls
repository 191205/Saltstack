editor:
  pkg.installed:
    - pkgs:
      - neovim
      - python-neovim
      - fzf
  cmd.script:
    - creates: /home/terry/.local/dein
    - runas: terry
    - name: https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh
    - args: "/home/terry/.local/dein"
  file.managed:
    - makedirs: True
    - user: terry
    - group: terry
    - names:
      - /home/terry/.config/nvim/init.vim:
        - source: salt://{{ slspath }}/init.vim
      - /home/terry/.editorconfig:
        - source: salt://{{ slspath }}/editorconfig
