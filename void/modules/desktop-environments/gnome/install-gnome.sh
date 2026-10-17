#!/bin/bash
set -e

PKGS=(gnome gnome-extra gdm gnome-shell)

echo "[gnome] Template installer for GNOME (Void)."
if command -v xbps-install >/dev/null 2>&1; then
  echo "Packages to install: ${PKGS[*]}"
  # sudo xbps-install -y "${PKGS[@]}"
  echo "Enable GDM: sudo ln -s /etc/sv/gdm /var/service"
else
  echo "xbps-install not found — this script is Void-specific."
fi
