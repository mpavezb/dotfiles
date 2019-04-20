#!/bin/sh

# toggle selector
t=0
toggle() {
    t=$(((t + 1) % 2))
}
trap "toggle" USR1


while true; do

    STATUS=$(nordvpn status | grep Status | tr -d ' ' | cut -d ':' -f2)
    if [ "$STATUS" = "Connected" ]; then
        IP=$(nordvpn status | grep IP | tr -d ' ' | cut -d ':' -f2)
        SERVER=$(nordvpn status | grep server | tr -d ' ' | cut -d ':' -f2 | cut -d '.' -f1)
        if [ $t -eq 0 ]; then
            echo "   $SERVER"
        else
            echo "   $SERVER %{F#666666}$IP%{F-}"
        fi
    else
        echo -e "%{F#f53c3c}\ue000   VPN DISCONNECTED%{F-}"
    fi
    sleep 1 &
    wait
done
