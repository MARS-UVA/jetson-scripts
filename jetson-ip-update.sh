#!/bin/sh
WEBHOOK_URL=url_goes_here

# check if the interface that just had a new connection is wlan0
if [ "$IFACE" = wlan0 ]; then
  # get the IPv4 address
  IP_ADDRESS=$(ifconfig wlan0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
  # send a Discord message with the new IP address
  curl -X POST $WEBHOOK_URL -H 'Content-Type: application/json' -d '{"content": "Jetson IP address: `${IPaddress}`"}'
fi