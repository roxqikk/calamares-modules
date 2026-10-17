#!/bin/bash
set -e

# Example helper: create a user (placeholder)
USERNAME="example"
REALNAME="Example User"

if id "$USERNAME" >/dev/null 2>&1; then
  echo "User $USERNAME already exists"
else
  echo "Creating user $USERNAME (placeholder)"
  # The real installer should use Calamares builtin user module instead of ad-hoc scripts
  # useradd -m -G wheel -c "$REALNAME" "$USERNAME"
fi
