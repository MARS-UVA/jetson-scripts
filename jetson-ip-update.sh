#!/bin/sh

# check if the interface that just had a new connection is wlan0
if [ "$IFACE" = wlan0 ]; then
  # get the IPv4 address
  IP_ADDRESS=$(ifconfig wlan0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
  PUBLIC_IP_ADDRESS=$(curl -s https://ipinfo.io/ip)
  # send a Discord message with the new IP address
  curl -X POST $WEBHOOK_URL -H "Content-Type: application/json" -d "{'content': 'Jetson IP addresses:\ninternal - `${IP_ADDRESS}`\nexternal - `${PUBLIC_IP_ADDRESS}`'}"
fi