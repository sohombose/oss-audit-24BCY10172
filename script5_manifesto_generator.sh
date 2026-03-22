#!/bin/bash
# ============================================================
# Script 5: Open Source Manifesto Generator
# Author: Sohom Bose | Regn: 24BCY10172
# Course: Open Source Software | Chosen Software: Linux Kernel
# Description: Asks the user 3 questions interactively and
#              generates a personalised open source manifesto,
#              saving it to a .txt file
# ============================================================

# --- Alias concept (demonstrated via comment as required) ---
# In a real shell session you could run: alias today='date +%d-%B-%Y'
# We use the date command directly below for the same effect

echo "========================================================"
echo "       OPEN SOURCE MANIFESTO GENERATOR                 "
echo "========================================================"
echo ""
echo "  Answer three questions to generate your personal"
echo "  open source philosophy statement."
echo ""

# --- Interactive input using read ---
read -p "  1. Name one open-source tool you use every day: " TOOL
read -p "  2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "  3. Name one thing you would build and share freely: " BUILD

# --- Get current date and username for the output file ---
DATE=$(date '+%d %B %Y')
OUTPUT="manifesto_$(whoami).txt"

echo ""
echo "  Generating your manifesto..."
echo ""

# --- Write the manifesto to a .txt file using > and >> ---
# > creates/overwrites the file with the first line
echo "========================================" > "$OUTPUT"
echo "   MY OPEN SOURCE MANIFESTO" >> "$OUTPUT"
echo "   Generated on: $DATE" >> "$OUTPUT"
echo "   By: $(whoami)" >> "$OUTPUT"
echo "========================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# --- String concatenation to build the manifesto paragraph ---
echo "I believe in the power of open source software." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Every day, I rely on $TOOL — a tool that exists" >> "$OUTPUT"
echo "not because a corporation decided to sell it," >> "$OUTPUT"
echo "but because someone chose to share it freely with the world." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "To me, freedom means $FREEDOM." >> "$OUTPUT"
echo "In the world of software, that freedom is not just a feature —" >> "$OUTPUT"
echo "it is the foundation. The freedom to read the code," >> "$OUTPUT"
echo "to change it, to learn from it, and to pass it on." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "One day, I want to build $BUILD and release it openly," >> "$OUTPUT"
echo "because I understand now that the tools I depend on" >> "$OUTPUT"
echo "were built by people who made that same choice." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "The Linux Kernel started as one student's hobby project." >> "$OUTPUT"
echo "Today it runs the internet, the cloud, and every Android phone." >> "$OUTPUT"
echo "That is what happens when knowledge is set free." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "This is my commitment to open source." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Signed: $(whoami) | $DATE" >> "$OUTPUT"
echo "========================================" >> "$OUTPUT"

# --- Display the saved manifesto on screen ---
echo "--------------------------------------------------------"
echo "  YOUR MANIFESTO (saved to: $OUTPUT)"
echo "--------------------------------------------------------"
echo ""
cat "$OUTPUT"
echo ""
echo "========================================================"
echo "  File saved successfully: $OUTPUT"
echo "========================================================"
