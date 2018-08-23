{%- from "maps/colours.jinja" import c -%}
#!/bin/sh
IFS=$'\n\t'

con_type="$1"
case $con_type in
	vpn)
		con_type="vpn"
		colour="{{ c.b6 }}"
		;;
	wifi)
		con_type="802-11-wireless"
		colour="{{ c.b12 }}"
		;;
	*)
		printf "bad connection type '$con_type'"
		exit 1
		;;
esac

network=$(nmcli -g TYPE,NAME con show --active \
	| grep -E "^$con_type" \
	| cut -d':' -f2 \
)
if test -n "$network"; then
	printf "<span color='$colour'>$network</span>"
else
	printf ""
fi
