#!/bin/bash
# Low battery notifier

# Kill already running processes
already_running="$(ps -fC 'grep' -N | grep 'low_battery_warning.sh' | wc -l)"
if [[ $already_running -gt 1 ]]; then
    pkill -f --older 1 'low_battery_warning.sh'
fi

path="$( dirname "$(readlink -f "$0")" )"

while [[ 0 -eq 0 ]]; do
    battery_status="$(cat /sys/class/power_supply/BAT1/status)"
    battery_charge="$(cat /sys/class/power_supply/BAT1/capacity)"
    
    if [[ $battery_status == 'Discharging' && $battery_charge -le 20 ]]; then
        notify-send -u critical "Battery low!"
        sleep 180
    else
        sleep 1
    fi
done