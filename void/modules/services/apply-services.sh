#!/bin/bash
set -e

# apply-services.sh
# Usage examples:
#  ./apply-services.sh --enable pkg1,pkg2 --disable pkg3,pkg4 --nvidia
#  ./apply-services.sh --from-file /path/to/module.conf  # optional

print_usage() {
  echo "Usage: $0 [--enable pkg1,pkg2] [--disable pkg3,pkg4] [--nvidia]"
}

ENABLE_PKS=()
DISABLE_PKS=()
DO_NVIDIA=0

while [ "$#" -gt 0 ]; do
  case "$1" in
    --enable)
      IFS=',' read -r -a ENABLE_PKS <<< "$2"
      shift 2
      ;;
    --disable)
      IFS=',' read -r -a DISABLE_PKS <<< "$2"
      shift 2
      ;;
    --nvidia)
      DO_NVIDIA=1
      shift
      ;;
    --from-file)
      CONF="$2"
      shift 2
      # naive parser: look for lines like 'nvidia: true' and 'enable_packages:'
      if [ -f "$CONF" ]; then
        if grep -q "^\s*nvidia:\s*true" "$CONF"; then
          DO_NVIDIA=1
        fi
        if grep -q "^\s*enable_packages:\s*\[" "$CONF"; then
          PKS_LINE=$(grep -o "^\s*enable_packages:.*" "$CONF")
          # extract comma separated values inside brackets
          PKS=$(echo "$PKS_LINE" | sed -n "s/.*\[\(.*\)\].*/\1/p")
          IFS=',' read -r -a ENABLE_PKS <<< "$PKS"
        fi
        if grep -q "^\s*disable_packages:\s*\[" "$CONF"; then
          PKS_LINE=$(grep -o "^\s*disable_packages:.*" "$CONF")
          PKS=$(echo "$PKS_LINE" | sed -n "s/.*\[\(.*\)\].*/\1/p")
          IFS=',' read -r -a DISABLE_PKS <<< "$PKS"
        fi
      fi
      ;;
    *)
      print_usage
      exit 2
      ;;
  esac
done

if [ ${#ENABLE_PKS[@]} -gt 0 ]; then
  echo "Packages to enable: ${ENABLE_PKS[*]}"
fi
if [ ${#DISABLE_PKS[@]} -gt 0 ]; then
  echo "Packages to disable: ${DISABLE_PKS[*]}"
fi
if [ $DO_NVIDIA -eq 1 ]; then
  echo "NVIDIA option enabled — will attempt to install NVIDIA drivers (template)"
fi

if command -v xbps-install >/dev/null 2>&1; then
  if [ ${#ENABLE_PKS[@]} -gt 0 ]; then
    echo "Installing: ${ENABLE_PKS[*]}"
    # sudo xbps-install -y "${ENABLE_PKS[@]}"
  fi
  if [ ${#DISABLE_PKS[@]} -gt 0 ]; then
    echo "Removing (or skipping) packages: ${DISABLE_PKS[*]}"
    # sudo xbps-remove -y "${DISABLE_PKS[@]}" || true
  fi
  if [ $DO_NVIDIA -eq 1 ]; then
    echo "Installing NVIDIA drivers (example packages: nvidia, nvidia-dkms)"
    # sudo xbps-install -y nvidia nvidia-dkms
  fi
else
  echo "xbps-install not found — apply-services is Void-specific and is a template."
fi

# runit: enable services by linking files into /var/service (example)
# If service names were passed, link them: ln -s /etc/sv/<service> /var/service/

exit 0
