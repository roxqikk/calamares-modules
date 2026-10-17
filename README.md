# Calamares modules (Void)

This repository contains example Calamares modules and helpers for Void Linux.

See the `void/` directory for Void-specific modules and `mirrors/` for mirror tips.

How to run the provided install helper:

bash install.sh  # or
chmod +x install.sh && ./install.sh

(install.sh in this repo is a small placeholder that explains next steps.)

Services tab and NVIDIA

This repo now includes a "Services" module that lets you enable/disable additional packages and services for each Desktop Environment (DE). NVIDIA drivers are disabled by default in each DE module; you can enable them by setting `options.nvidia: true` in the DE module.conf or by using the Services UI (the installer should present an NVIDIA checkbox).

Example (manual): edit `void/modules/desktop-environments/xfce4/module.conf` and set:

options:
  nvidia: true

Or use the Services module to toggle NVIDIA and other packages during install.
