#!/bin/bash
set -e

PKGS=(lxqt openbox lightdm)

echo "[lxqt] Template installer for LXQt (Void)."
if command -v xbps-install >/dev/null 2>&1; then
  echo "Packages to install: ${PKGS[*]}"
  # sudo xbps-install -y "${PKGS[@]}"
else
  echo "xbps-install not found — this script is Void-specific."
fi
