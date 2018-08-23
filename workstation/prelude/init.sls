sudoers configuration:
  file.managed:
    - name: /etc/sudoers.d/wheel_can_sudo
    - source: salt://{{ slspath }}/sudoers_config

pacman configuration:
  file.managed:
    - makedirs: True
    - names:
      - /etc/pacman.conf:
        - source: salt://{{ slspath }}/pacman.conf
      - /etc/pacman.d/mirrorlist:
        - source: salt://{{ slspath }}/pacman-mirrorlist
      - /etc/pacman.d/hooks/systemd-boot.hook:
        - source: salt://{{ slspath }}/systemd-boot.hook

updates:
  pkg.uptodate:
    - refresh: True

system utilities:
  pkg.installed:
    - pkgs:
      - git
      - httpie
      - nmap
      - openssh
      - ripgrep
