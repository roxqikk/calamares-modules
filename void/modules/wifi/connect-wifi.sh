#!/bin/bash
set -e

# connect-wifi.sh
# Usage: ./connect-wifi.sh <SSID> <PASSWORD>

SSID="$1"
PSK="$2"

if [ -z "$SSID" ]; then
  echo "Usage: $0 <SSID> <PASSWORD>"
  exit 2
fi

if command -v nmcli >/dev/null 2>&1; then
  echo "Using nmcli to connect to Wi-Fi network: $SSID"
  if [ -z "$PSK" ]; then
    nmcli device wifi connect "$SSID"
  else
    nmcli device wifi connect "$SSID" password "$PSK"
  fi
  exit $?
fi

if command -v wpa_passphrase >/dev/null 2>&1 && command -v wpa_supplicant >/dev/null 2>&1; then
  echo "Using wpa_supplicant fallback to connect to Wi-Fi: $SSID"
  WPACONF=$(mktemp)
  wpa_passphrase "$SSID" "$PSK" > "$WPACONF"
  sudo wpa_supplicant -B -i wlan0 -c "$WPACONF"
  sudo dhcpcd wlan0 || sudo udhcpc -i wlan0 || true
  rm -f "$WPACONF"
  exit 0
fi

echo "No supported Wi-Fi tools found (nmcli or wpa_supplicant). Install NetworkManager or wpa_supplicant."
exit 1
