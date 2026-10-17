#!/bin/bash
set -e

PKGS=(i3 i3status dmenu feh terminator network-manager-applet)

echo "[i3wm] Template installer for i3 (Void)."
if command -v xbps-install >/dev/null 2>&1; then
  echo "Packages to install: ${PKGS[*]}"
  # sudo xbps-install -y "${PKGS[@]}"
else
  echo "xbps-install not found — this script is Void-specific."
fi
