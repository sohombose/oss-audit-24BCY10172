#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
# Author: [Your Name] | Roll: [Your Roll Number]
# Course: Open Source Software | Chosen Software: Linux Kernel
# Description: Loops through key Linux directories and reports
#              their size, owner, and permissions
# ============================================================

# --- List of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/boot")

echo "========================================================"
echo "         DISK AND PERMISSION AUDITOR                   "
echo "========================================================"
echo ""
echo "  Scanning key Linux system directories..."
echo ""
printf "  %-20s %-25s %-10s\n" "DIRECTORY" "PERMISSIONS/OWNER" "SIZE"
echo "  ------------------------------------------------------------"

# --- For loop: goes through each directory one by one ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # Extract permissions and owner using ls and awk
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        # Get directory size, suppress permission errors with 2>/dev/null
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        printf "  %-20s %-25s %-10s\n" "$DIR" "$PERMS" "$SIZE"
    else
        # Directory does not exist on this system
        printf "  %-20s %s\n" "$DIR" "[ does not exist on this system ]"
    fi
done

echo ""
echo "--------------------------------------------------------"
echo "  LINUX KERNEL CONFIG DIRECTORY CHECK"
echo "--------------------------------------------------------"

# --- Check if the Linux kernel modules directory exists ---
KERNEL_DIR="/lib/modules/$(uname -r)"

if [ -d "$KERNEL_DIR" ]; then
    echo ""
    echo "  Kernel modules directory found: $KERNEL_DIR"
    # Show permissions of the kernel modules directory
    KPERMS=$(ls -ld "$KERNEL_DIR" | awk '{print $1, $3, $4}')
    KSIZE=$(du -sh "$KERNEL_DIR" 2>/dev/null | cut -f1)
    echo "  Permissions : $KPERMS"
    echo "  Size        : $KSIZE"
    echo ""
    echo "  This directory contains all loadable kernel modules (.ko files)"
    echo "  that give Linux its modular, flexible architecture."
else
    echo "  Kernel modules directory not found for kernel: $(uname -r)"
fi

echo ""
echo "========================================================"
