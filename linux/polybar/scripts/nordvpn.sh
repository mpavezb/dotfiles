#!/bin/bash

VPN_ICON="%{F#61C766}\ue9d2%{F-}"
VPN_OFF_ICON="%{F#EC7875}\ue9d3%{F-}"

is_vpn_connected() {
    STATUS=$(nordvpn status | grep Status | tr -d ' ' | cut -d ':' -f2)
    if [ "$STATUS" = "Connected" ]; then
        return 0
    else
        return 1
    fi
}

connect_callback() {
    if is_vpn_connected ; then
        echo -e "$VPN_ICON Disconnecting ... "
        nordvpn disconnect >/dev/null 2>&1
    else
        echo -e "$VPN_OFF_ICON Connecting ... "
        nordvpn connect >/dev/null 2>&1
    fi
}

sleep_pid=
toggle_state=0
toggle_callback() {
    toggle_state=$(((toggle_state + 1) % 2))

    if [ "$sleep_pid" -ne 0 ]; then
        kill "$sleep_pid" >/dev/null 2>&1
    fi
}

trap "connect_callback" USR1
trap "toggle_callback" USR2

while true; do
    cnt=$((cnt+1))
    if is_vpn_connected ; then
        if [ $toggle_state -eq 0 ]; then
            COUNTRY=$(nordvpn status | grep Country | tr -d ' ' | cut -d ':' -f2)
            echo -e "$VPN_ICON $COUNTRY"
        else
            SERVER=$(nordvpn status | grep server | tr -d ' ' | cut -d ':' -f2 | cut -d '.' -f1)
            echo -e "$VPN_ICON $SERVER"
        fi
    else
        echo -e "$VPN_OFF_ICON VPN Disconnected"
    fi
    sleep 1 &
    sleep_pid=$!
    wait
    sleep_pid=
done
