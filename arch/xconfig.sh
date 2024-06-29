export EDITOR=nvim

setxkbmap -option caps:swapescape

xinput set-prop "MSFT0002:00 04F3:31AD Touchpad" "Synaptics Tap Action" 0, 0, 0, 0, 1, 0, 0

xset r rate 200 40

# xrandr --output $(xrandr -q | grep ' connected' | head -n 1 | cut -d ' ' -f1) --set TearFree on
