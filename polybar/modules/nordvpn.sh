#!/bin/sh

STATUS=$(nordvpn status | grep Status | tr -d ' ' | cut -d ':' -f2)

if [ "$STATUS" = "Connected" ]; then
    IP=$(nordvpn status | grep IP | tr -d ' ' | cut -d ':' -f2)
    SERVER=$(nordvpn status | grep server | tr -d ' ' | cut -d ':' -f2)
    echo "($SERVER $IP)"
else
    echo "VPN DISCONNECTED"
fi
