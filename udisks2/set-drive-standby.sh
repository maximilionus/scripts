#!/bin/bash
#
# Configure the ATA per-drive.
#
# ARGUMENTS
# 1: Drive path.
# 2: (optional) Standby timer. 20 minutes if not provided.

set -e

DRIVE_PATH="$1"
STANDBY_TIMER="${2:-240}" # 20 min. by default
UDISKS2_CONF_DIR="/etc/udisks2"

drive_serial=$(udevadm info --query=property --name="$DRIVE_PATH" \
    | sed -n 's/^ID_SERIAL=//p' \
    | tr '_' '-')
conf_file="$UDISKS2_CONF_DIR/$drive_serial.conf"

cat <<EOF > "$conf_file"
[ATA]
StandbyTimeout=$STANDBY_TIMER
EOF

printf "Standby for %s is set to %d.\nRemove \"$conf_file\" to revert.\n" \
    "$drive_serial" "$STANDBY_TIMER"
