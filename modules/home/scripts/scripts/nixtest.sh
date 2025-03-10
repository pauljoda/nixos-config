#!/usr/bin/env bash

# Use the first argument as username or default to current user
USERNAME=${1:-$USER}
HOSTNAME=${2:-$HOST}

cd /home/$USERNAME/nixos-config
exec nixos-rebuild test --flake .#$HOSTNAME