#!/bin/bash
set -e

# Example helper to install desktop packages on Void using xbps
PKGS=(xfce4 xfce4-terminal lightdm lightdm-gtk-greeter)

if command -v xbps-install >/dev/null 2>&1; then
  echo "Installing desktop packages (example): ${PKGS[*]}"
  # sudo xbps-install -y "${PKGS[@]}"
else
  echo "xbps-install not found; this helper is Void-specific and is a placeholder."
fi
