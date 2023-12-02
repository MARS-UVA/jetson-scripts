#!/bin/sh

# check if the interface that just had a new connection is wired
if [ "$IFACE" = eth0 -o "$IFACE" = rndis0 ]; then
  # get the IPv4 address
  IP_ADDRESS=$(ifconfig wlan0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
  # send a Discord message to show that the Jetson is online
  curl -X POST $WEBHOOK_URL -H "Content-Type: application/json" -d "{\"content\": \"Jetson is online!\`\`\`\nLocal IP address: \`${IP_ADDRESS}\`\`\`\"}"
fi