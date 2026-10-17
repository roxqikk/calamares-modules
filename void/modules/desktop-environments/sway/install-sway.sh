#!/bin/bash
set -e

PKGS=(sway swaybg swayidle wofi waybar mako wl-clipboard)

echo "[sway] Template installer for Sway (Void)."
if command -v xbps-install >/dev/null 2>&1; then
  echo "Packages to install: ${PKGS[*]}"
  # sudo xbps-install -y "${PKGS[@]}"
else
  echo "xbps-install not found — this script is Void-specific."
fi
