#!/bin/bash

# Define file paths
SERVICE_FILE="ludusavi-backup.service"
PATH_FILE="ludusavi-backup.path"
SYSTEMD_DIR="/etc/systemd/system"

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root (use sudo)."
  exit 1
fi

# Copy service and path files to systemd directory
echo "Copy service and path files to systemd directory"
cp "$SERVICE_FILE" "$SYSTEMD_DIR" || { echo "Failed to copy service file."; exit 1; }
cp "$PATH_FILE" "$SYSTEMD_DIR" || { echo "Failed to copy path file."; exit 1; }

# Reload systemd daemon
echo "Reloading systemd daemon"
systemctl daemon-reload

# Enable and start the systemd service and path
echo "Enabling and starting ludusavi-backup service"
systemctl enable ludusavi-backup.path
systemctl start ludusavi-backup.path

# Confirmation message
echo "Service and script have been set up successfully."

