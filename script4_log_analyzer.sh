#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Author: [Your Name] | Roll: [Your Roll Number]
# Course: Open Source Software | Chosen Software: Linux Kernel
# Description: Reads a log file line by line, counts keyword
#              occurrences, and prints a summary with last matches
# Usage: ./script4_log_analyzer.sh [logfile] [keyword]
# Example: ./script4_log_analyzer.sh /var/log/syslog error
# ============================================================

# --- Accept log file path and keyword from command-line arguments ---
LOGFILE=${1:-/var/log/syslog}   # Default to syslog if no file given
KEYWORD=${2:-"error"}            # Default keyword is 'error'
COUNT=0                          # Counter variable starts at zero

echo "========================================================"
echo "         LOG FILE ANALYZER                             "
echo "========================================================"
echo ""
echo "  Log File : $LOGFILE"
echo "  Keyword  : '$KEYWORD'"
echo ""

# --- Check if the log file exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "  ERROR: File '$LOGFILE' not found."
    echo "  Try: sudo ./script4_log_analyzer.sh /var/log/syslog error"
    exit 1
fi

# --- Check if the file is empty and retry with a different log ---
if [ ! -s "$LOGFILE" ]; then
    echo "  WARNING: '$LOGFILE' is empty. Trying /var/log/kern.log instead..."
    LOGFILE="/var/log/kern.log"
    # Check again after retry
    if [ ! -s "$LOGFILE" ]; then
        echo "  ERROR: Backup log file is also empty. Exiting."
        exit 1
    else
        echo "  Using: $LOGFILE"
    fi
fi

echo "  Scanning file line by line..."
echo ""

# --- While-read loop: reads the log file one line at a time ---
while IFS= read -r LINE; do
    # If the current line contains the keyword (case-insensitive), count it
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # Increment the counter by 1
    fi
done < "$LOGFILE"

# --- Print the summary result ---
echo "--------------------------------------------------------"
echo "  RESULT SUMMARY"
echo "--------------------------------------------------------"
echo "  Keyword '$KEYWORD' was found $COUNT times in:"
echo "  $LOGFILE"
echo ""

# --- Print the last 5 lines that match the keyword ---
echo "  Last 5 matching lines:"
echo "  ----------------------"
grep -i "$KEYWORD" "$LOGFILE" | tail -5 | while read -r MATCH; do
    echo "  >> $MATCH"
done

echo ""
echo "========================================================"
