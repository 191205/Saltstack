{%- from "maps/colours.jinja" import c -%}
#!/bin/sh
charge_status="$(acpi b | awk '{print $3}' | cut -d',' -f1)"
charge_percent="$(acpi b | awk '{print $4}' | cut -d'%' -f1)"

if test "$charge_status" = "Charging" || test "$charge_status" = "Full"; then
	printf "<span color='{{ c.b10 }}'>"
elif test "$charge_percent" -ge 35; then
	printf "<span color='{{ c.b3 }}'>"
else
	printf "<span color='{{ c.b9 }}'>"
fi
printf "%s%%</span>" $charge_percent
