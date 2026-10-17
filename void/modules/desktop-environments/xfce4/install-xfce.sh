#!/bin/bash
set -e

PKGS=(xfce4 xfce4-goodies lightdm)

echo "[xfce4] Template installer for XFCE4 (Void)."
if command -v xbps-install >/dev/null 2>&1; then
  echo "Packages to install: ${PKGS[*]}"
  # sudo xbps-install -y "${PKGS[@]}"
else
  echo "xbps-install not found — this script is Void-specific."
fi
