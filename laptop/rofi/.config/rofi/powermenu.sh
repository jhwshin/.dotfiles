#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Power Menu
#
## Available Styles
#
## style-1   style-2   style-3   style-4   style-5
## style-6   style-7   style-8   style-9   style-10

# Current Theme
# dir="$HOME/.config/rofi/powermenu/type-2"
# theme='style-1'

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`cat /etc/hostname`

# Options
shutdown=''
reboot=''
lock=''
hibernate=''
logout=''
yes=''
no=''

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "Uptime: $uptime" \
		-mesg "Uptime: $uptime" \
		-hover-select \
		-selected-row 5 \
		-theme ${HOME}/.config/rofi/powermenu.rasi \
		-kb-select-1 "1" \
		-kb-select-2 "2" \
		-kb-select-3 "3" \		-kb-select-4 "4" \
		-kb-select-5 "5,Super+Delete"
}

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg "$1 ?" \
		-theme ${HOME}/.config/rofi/powermenu.rasi
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd $1
}

# Pass variables to rofi dmenu
run_rofi() {
	# echo -e "$lock\n$hibernate\n$logout\n$reboot\n$shutdown" | rofi_cmd
	echo -e "$hibernate\n$reboot\n$shutdown\n$logout\n$lock" | rofi_cmd
}

# Execute Command
run_cmd() {
	selected="$(confirm_exit $1)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == 'Hibernate' ]]; then
			systemctl hibernate
		elif [[ $1 == 'Reboot' ]]; then
			systemctl reboot
		elif [[ $1 == 'Shutdown' ]]; then
			systemctl poweroff
		elif [[ $1 == 'Logout' ]]; then
			i3-msg exit
		fi
	else
		exit 0
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
	$hibernate)
		run_cmd Hibernate
	;;
	$reboot)
		run_cmd Reboot
	;;
	$shutdown)
		run_cmd Shutdown
	;;
	$logout)
		run_cmd Logout
	;;
	$lock)
		lockscreen
	;;


esac



	# 	elif [[ $1 == '--suspend' ]]; then
	# 		# mpc -q pause
	# 		# amixer set Master mute
	# 		# systemctl suspend

    # $lock)
	# 	kitty --hold -c bash 'echo lock'
	# 	# if [[ -x '/usr/bin/betterlockscreen' ]]; then
	# 	# 	betterlockscreen -l
	# 	# elif [[ -x '/usr/bin/i3lock' ]]; then
	# 	# 	i3lock
	# 	# fi
    #     ;;