# Services module

This module provides a simple way to enable/disable packages and optional features (like NVIDIA drivers) during installation.

It is intended to be called by the installer workflow (settings/main.conf) or invoked manually from the install helper scripts.

module.conf fields supported (template):

- enable_packages: list of package names to install
- disable_packages: list of package names to remove/skip
- nvidia: boolean (false by default) - if true, installer will attempt to install NVIDIA drivers

Note: Actual enabling/disabling implementation may need adaptation for your runtime environment. On Void Linux, installation uses xbps; service management uses runit.
