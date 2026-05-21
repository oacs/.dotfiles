#!/usr/bin/env bash
# Wake handler: restarts kanata and aerospace after macOS sleep/wake.
# Requires a sudoers entry for the launchctl line — see config/kanata/com.example.kanata.plist notes.

# Restart kanata (system daemon — needs passwordless sudo via /etc/sudoers.d/kanata-wakeup)
sudo /bin/launchctl kickstart -k system/com.example.kanata 2>/dev/null || true

# Restart aerospace
pkill -x AeroSpace 2>/dev/null || true
sleep 1
open -a AeroSpace
