#!/bin/sh

connection=$(ifconfig | grep tun)

if [ -n "$connection" ]; then
    echo "VPN: connected"
else
    echo ""
fi
