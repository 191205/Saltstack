desktop:
  pkg.installed:
    - pkgs:
      - sway
      - i3status
      - i3blocks
      - dmenu
      - ffmpeg
      - imagemagick
      - pulseaudio
      - pulseaudio-alsa
      - pavucontrol
      - arc-gtk-theme
      - arc-icon-theme
      - termite
      - sxiv
      - acpi
  file.managed:
    - makedirs: True
    - user: terry
    - group: terry
    - template: jinja
    - names:
      - /home/terry/.config/termite/config:
        - source: salt://{{ slspath }}/termite.conf
      - /home/terry/.config/sway/config:
        - source: salt://{{ slspath }}/sway.conf
      - /home/terry/.config/gtk-2.0/gtkrc:
        - source: salt://{{ slspath }}/gtkrc
      - /home/terry/.config/gtk-3.0/settings.ini:
        - source: salt://{{ slspath }}/gtk3.ini
      - /home/terry/.config/sway/i3blocks.conf:
        - source: salt://{{ slspath }}/i3blocks.conf
      {% for block in ["datetime", "battery", "network"] %}
      - /home/terry/.config/sway/i3blocks/{{ block }}.sh:
        - source: salt://{{ slspath }}/i3blocks/{{ block }}.sh
        - mode: 755
      {% endfor %}

fonts:
  pkg.installed:
    - pkgs:
      - noto-fonts
      - noto-fonts-cjk
      - noto-fonts-emoji
      - ttf-bitstream-vera
      - ttf-carlito
      - ttf-croscore
      - ttf-dejavu
      - ttf-freefont
      - ttf-inconsolata
      - ttf-liberation
      - ttf-roboto
