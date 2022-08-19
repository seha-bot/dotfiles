SEARCH=$(rofi -dmenu -p 'Search')
firefox google.com/search?q="$SEARCH"
i3-msg workspace 2

