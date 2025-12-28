#!/bin/bash

# ==================================================================================
# Auto Mount NTFS Disks
# Description: Automatically detects and mounts all NTFS partitions on the system.
#              Useful for gaming setups (Steam/Lutris) on Linux to ensure correct
#              permissions (uid/gid 1000) are applied.
# Author: [Your Name/Handle]
# ==================================================================================

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Error: This script must be run as root."
  exit 1
fi

echo "Starting NTFS Auto-Mount..."

# Get current user UID/GID (assuming 1000 if not found, typical for single user systems)
# Note: Since we run as root, we want to mount for the primary user.
# Adjust '1000' if your user ID is different.
TARGET_UID=1000
TARGET_GID=1000

# Function to mount a device
mount_device() {
    local uuid=$1
    local label=$2
    local dev_path="/dev/disk/by-uuid/$uuid"

    # Determine mount point name: Use Label if available, otherwise UUID
    if [ -n "$label" ]; then
        # Sanitize label (replace spaces with underscores, remove special chars)
        local safe_label=$(echo "$label" | sed 's/[^a-zA-Z0-9]/_/g')
        local mount_point="/mnt/$safe_label"
    else
        local mount_point="/mnt/disk_$uuid"
    fi

    # Check if the device exists
    if [ ! -e "$dev_path" ]; then
        echo "Device with UUID $uuid not found. Skipping."
        return
    fi

    # Create mount point
    if [ ! -d "$mount_point" ]; then
        echo "Creating mount point: $mount_point"
        mkdir -p "$mount_point"
    fi

    # Check if already mounted
    if mountpoint -q "$mount_point"; then
        echo "Drive $dev_path is already mounted at $mount_point."
        echo "Unmounting to ensure correct permissions..."
        umount "$dev_path" 2>/dev/null || umount "$mount_point" 2>/dev/null
    fi

    # Attempt to fix NTFS (ignoring errors if clean)
    echo "Running ntfsfix on $dev_path..."
    ntfsfix "$dev_path" >/dev/null 2>&1

    # Mount
    echo "Mounting $dev_path -> $mount_point"
    ntfs-3g -o uid=$TARGET_UID,gid=$TARGET_GID,umask=022,windows_names "$dev_path" "$mount_point"
    
    if [ $? -eq 0 ]; then
        echo "Successfully mounted."
    else
        echo "Failed to mount $dev_path."
    fi
    echo "----------------------------------------"
}

# Loop through all NTFS partitions found by lsblk
# We use -n (no headings), -o (output columns), -r (raw output)
# Columns: UUID, LABEL, FSTYPE
while read -r uuid label fstype; do
    if [ "$fstype" == "ntfs" ] && [ -n "$uuid" ]; then
        mount_device "$uuid" "$label"
    fi
done < <(lsblk -n -o UUID,LABEL,FSTYPE -r)

echo "Auto-mount complete."
