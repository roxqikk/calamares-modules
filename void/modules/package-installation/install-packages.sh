#!/bin/bash
set -e

# Placeholder package installer using xbps
PKGS=(base-system sudo openssh)
if command -v xbps-install >/dev/null 2>&1; then
  echo "Would install: ${PKGS[*]} (uncomment real install in this script)"
  # sudo xbps-install -y "${PKGS[@]}"
else
  echo "xbps-install not found; skip package installation (placeholder)"
fi
