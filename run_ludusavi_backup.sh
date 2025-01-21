#!/bin/bash

echo "$(date): Starting Ludusavi backup..." >> /tmp/ludusavi_service_log.txt
/var/lib/flatpak/exports/bin/com.github.mtkennerly.ludusavi backup --force >> /tmp/ludusavi_service_log.txt 2>&1
echo "$(date): Ludusavi backup completed." >> /tmp/ludusavi_service_log.txt
