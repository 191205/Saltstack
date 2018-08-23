{%- from "maps/colours.jinja" import c -%}
#!/bin/sh
printf "<span color='{{ c.fg }}'>$(date +'%Y-%m-%d %H:%M')</span>"
