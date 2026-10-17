#!/bin/bash
set -e

PKGS=(hyprland wayland-protocols wlroots mako wlr-randr wofi hyprpaper pipewire pipewire-pulse waybar xdg-desktop-portal-wayland libinput)

echo "[hyprland] This is a template installer for Hyprland (Void)."
if command -v xbps-install >/dev/null 2>&1; then
  echo "Packages to install: ${PKGS[*]}"
  # Uncomment the next line to perform the install
  # sudo xbps-install -y "${PKGS[@]}"
else
  echo "xbps-install not found — this script is Void-specific."
fi
