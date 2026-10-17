#!/bin/bash
set -e

PKGS=(niri-session niri-settings)

echo "[niri] Placeholder installer for Niri (replace package names)."
if command -v xbps-install >/dev/null 2>&1; then
  echo "Packages to install: ${PKGS[*]}"
  # sudo xbps-install -y "${PKGS[@]}"
else
  echo "xbps-install not found — this script is Void-specific."
fi
