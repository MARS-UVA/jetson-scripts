# jetson-scripts

This repository stores scripts for use on the Jetson. Each script will specify where it must live in the filesystem in order to do its job.

## Jetson IP Updates
### Location:
Place this script in the `/etc/network/if-up.d` directory. 
### Purpose:
This script will send a Discord message with the Jetson's IP address whenever it connects to a `wlan0` network. Knowing the IP address allows us to `ssh` into the Jetson without having to scan the network to find its IP address. The Discord message is sent via a webhook url; you can configure webhooks and what channels they send messages in via the Discord app.