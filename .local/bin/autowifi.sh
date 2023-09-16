#!/bin/bash
# 
# Script name: autowifi.sh
# Description: Automatically connects to wifi using wpa_supplicant
# Dependencies: net-tools, base-devel, wpa_supplicant,

DIRECTORY="/etc/wpa_supplicant/wpa_supplicant.conf"

# Kill WPA task if running
sudo killall wpa_supplicant &> /dev/null

# Check if config file exists
[[ ! -f "$DIRECTORY" ]] && echo "Message: wpa_supplicant.conf not found" && exit 1

# Check if iwlwifi driver is present
if [[ "$(lsmod | grep -m 1 -i iwlwifi | awk '{print $1}')" == "iwlwifi" ]]; then
  echo "Message: iwlwifi driver loaded successfully"
else
  echo "Message: iwlwifi needs loading"
  #exit 1
fi

# Check if wifi interface is available
if iw dev | grep -q "Interface" && [[ -n "$1" ]]; then
  echo "WiFi interface is available"      
  
  # Check if interface is down and bring it up
  [[ ! $(ip link show $1 | grep -q "LOWER_UP") ]] && (echo "Bringing up the $1 interface"; sudo ip link set $1 up)
fi

# Get network interface info from conf using PCRE
ssid=$(grep -Po "(?<=ssid=\").*(?=\")" "$DIRECTORY")
psk=$(grep -Po "(?<=psk=\").*(?=\")" "$DIRECTORY")

# Connect to wifi network using wpa_supplicant
sudo wpa_supplicant -B -c $DIRECTORY -i $1

# Initiate Dynamic Host Configuration Protocol (DHCP)
sudo dhcpcd $1

# Show connection
echo "Connected to $ssid"
