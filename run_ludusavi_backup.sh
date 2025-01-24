#!/bin/bash

# Log file path
LOG_FILE="/tmp/ludusavi_service_log.txt"

# Log start
echo "$(date): Starting Ludusavi backup..." >> "$LOG_FILE"

# Determine the correct Ludusavi Flatpak path
if [ -x "/home/deck/.local/share/flatpak/exports/bin/com.github.mtkennerly.ludusavi" ]; then
  LUDUSAVI_PATH="/home/deck/.local/share/flatpak/exports/bin/com.github.mtkennerly.ludusavi"
  echo "$(date): Found Ludusavi at $LUDUSAVI_PATH" >> "$LOG_FILE"
elif [ -x "/var/lib/flatpak/exports/bin/com.github.mtkennerly.ludusavi" ]; then
  LUDUSAVI_PATH="/var/lib/flatpak/exports/bin/com.github.mtkennerly.ludusavi"
  echo "$(date): Found Ludusavi at $LUDUSAVI_PATH" >> "$LOG_FILE"
else
  echo "$(date): Ludusavi Flatpak not found!" >> "$LOG_FILE"
  exit 1
fi

# Set the Flatpak environment
export XDG_RUNTIME_DIR="/run/user/1000"
export PATH="$PATH:/home/deck/.local/share/flatpak/exports/bin"

# Run Ludusavi backup
"$LUDUSAVI_PATH" backup --force >> "$LOG_FILE" 2>&1

# Log completion
echo "$(date): Ludusavi backup completed." >> "$LOG_FILE"
