#!/bin/bash
set -e

PKGS=(plasma5 kde-applications-meta sddm dolphin konsole kdeconnect)

echo "[kde-plasma] Template installer for KDE Plasma (Void)."
if command -v xbps-install >/dev/null 2>&1; then
  echo "Packages to install: ${PKGS[*]}"
  # sudo xbps-install -y "${PKGS[@]}"
  echo "Enable/display manager: sudo ln -s /etc/sv/sddm /var/service (or use systemd on other distros)"
else
  echo "xbps-install not found — this script is Void-specific."
fi
