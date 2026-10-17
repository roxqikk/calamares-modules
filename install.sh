#!/bin/bash
set -e

cat <<'EOF'
This is a placeholder install script for the repository.
It does not perform destructive actions by default.

Typical usage examples (shown in README):
  bash install.sh
  chmod +x install.sh && ./install.sh

What this script could do (not implemented here):
- copy module folders into /usr/share/calamares/modules/
- install dependencies (calamares, packages)
- run calamares in a test environment

Currently it just prints instructions.
EOF

# Minimal runtime behavior
if command -v calamares >/dev/null 2>&1; then
  echo "Note: calamares is installed on this system. To run it: sudo calamares"
else
  echo "Calamares is not installed. Install calamares (e.g. xbps-install -y calamares) then run it as root: sudo calamares"
fi

exit 0
