#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Author: Sohom Bose | Regn: 24BCY10172
# Course: Open Source Software | Chosen Software: Linux Kernel
# Description: Displays system information like a welcome screen
# ============================================================

# --- Variables ---
STUDENT_NAME="Sohom Bose"        
SOFTWARE_CHOICE="Linux Kernel"    # Our chosen open-source software

# --- Collect system information using command substitution ---
KERNEL=$(uname -r)                      # Gets the kernel version
DISTRO=$(lsb_release -d | cut -f2)      # Gets the Ubuntu distro name
USER_NAME=$(whoami)                     # Gets the current logged-in user
HOME_DIR=$HOME                             # Gets the home directory path
UPTIME=$(uptime -p)                        # Gets human-readable uptime
CURRENT_DATE=$(date '+%d %B %Y, %H:%M:%S') # Gets current date and time

# --- Display the welcome screen ---
echo "========================================================"
echo "         OPEN SOURCE AUDIT — SYSTEM IDENTITY           "
echo "========================================================"
echo ""
echo "  Student   : $STUDENT_NAME"
echo "  Software  : $SOFTWARE_CHOICE"
echo ""
echo "--------------------------------------------------------"

echo "  SYSTEM INFORMATION"
echo "--------------------------------------------------------"
echo "  Distribution : $DISTRO"
echo "  Kernel Ver.  : $KERNEL"
echo "  Logged User  : $USER_NAME"
echo "  Home Dir     : $HOME_DIR"
echo "  Uptime       : $UPTIME"
echo "  Date & Time  : $CURRENT_DATE"
echo ""
echo "--------------------------------------------------------"
echo "  LICENSE INFORMATION"
echo "--------------------------------------------------------"
# Linux Kernel is licensed under GPL v2 — a copyleft license
echo "  The Linux Kernel is licensed under GNU GPL v2."
echo "  This means you are FREE to:"
echo "    - Use this OS for any purpose"
echo "    - Study and modify the source code"
echo "    - Distribute copies to others"
echo "    - Share your modifications (must stay GPL v2)"
echo ""
echo "========================================================"
echo "  'Free as in freedom, not just free as in free beer.'"
echo "                                        — Richard Stallman"
echo "========================================================"
