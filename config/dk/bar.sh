#!/bin/sh

DIR="$HOME/.config/dk"

Workspaces() {
	dkcmd status num=1 | jq -j '[.workspaces[] | select(.active) | if .focused then "[\(.name)]" else " \(.name) " end] | join(" ")'
}

# TODO depend on acpi, jq
# TODO make newlines prettier in this file
# TODO add notifications

Clock() {
	printf "$(date "+%H:%M")"
}

Calendar() {
	printf "$(date "+%a, %m %B %Y")"
}

Battery() {
	BATTACPI=$(acpi --battery)
	# TODO query this better
	BATPERC=$(echo $BATTACPI | cut -d, -f2 | tr -d '[:space:]')

	if [[ $BATTACPI == *"100%"* ]]; then
		echo -e -n "\uf00c $BATPERC"
	elif [[ $BATTACPI == *"Discharging"* ]]; then
		BATPERC=${BATPERC::-1}
		if [ $BATPERC -le "10" ]; then
			echo -e -n "\uf244"
		elif [ $BATPERC -le "25" ]; then
			echo -e -n "\uf243"
		elif [ $BATPERC -le "50" ]; then
			echo -e -n "\uf242"
		elif [ $BATPERC -le "75" ]; then
			echo -e -n "\uf241"
		elif [ $BATPERC -le "100" ]; then
			echo -e -n "\uf240"
		fi
		echo -e " $BATPERC%"
	elif [[ $BATTACPI == *"Charging"* && $BATTACPI != *"100%"* ]]; then
		echo -e "\uf0e7 $BATPERC"
	elif [[ $BATTACPI == *"Unknown"* ]]; then
		echo -e "$BATPERC"
	fi
}

# TODO finish
# Wifi() {
# 	WIFISTR=$( iwconfig wlp1s0 | grep "Link" | sed 's/ //g' | sed 's/LinkQuality=//g' | sed 's/\/.*//g')
# 	if [ ! -z $WIFISTR ] ; then
# 		WIFISTR=$(( ${WIFISTR} * 100 / 70))
# 		ESSID=$(iwconfig wlp1s0 | grep ESSID | sed 's/ //g' | sed 's/.*://' | cut -d "\"" -f 2)
# 		if [ $WIFISTR -ge 1 ] ; then
# 			echo -e "\uf1eb ${ESSID} ${WIFISTR}%"
# 		fi
# 	fi
# }

Sound() {
	if pactl get-sink-mute @DEFAULT_SINK@ | grep -q 'yes'; then
		echo -e "muted"
	else
		vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -n 1)
		if [ $vol -ge 85 ]; then
			echo -e "\uf028 $vol%"
		elif [ $vol -ge 50 ]; then
			echo -e "\uf027 $vol%"
		else
			echo -e "\uf026 $vol%"
		fi
	fi
}

FIFO="$DIR/bar_reload"

# create a named pipe for signals
# TODO make sure the existing one is actually a fifo
# [ -e "$FIFO" ] || mkfifo "$FIFO"

trayer --widthtype request --align right --edge top --expand false --height 25 --tint 0 --transparent true &
trayer_pid=$!

# nice cleanup
trap "rm $FIFO && kill $trayer_pid" EXIT

# TODO make a mechanism to reload each block individually maybe?
while true; do
	# timeout 1s cat "$FIFO" > /dev/null &
	# wait $!
	echo "$(Workspaces)%{r}$(Battery) | $(Sound) | $(Clock) $(Calendar)"
	sleep 1s
done | lemonbar -g 1800x25 -f 'Source Code Pro' 'Font Awesome 6 Free' -f 'Font Awesome 6 Brands' -f 'Font Awesome 6 Free Solid'
