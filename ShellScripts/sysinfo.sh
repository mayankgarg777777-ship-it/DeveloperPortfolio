#!/usr/bin/env bash
# Author: Mayank Garg
# System Information Report

set -euo pipefail

NAME="Mayank Garg"
ROLL_NO="2601730194"
TODAY="$(date +%Y-%m-%d)"

CPU_MODEL="$(awk -F': ' '/model name/ {print $2; exit}' /proc/cpuinfo)"
CPU_COUNT="$(nproc)"
MEMORY_INFO="$(free -h | awk '/^Mem:/ {printf "Total: %s | Used: %s", $2, $3}')"

echo "========================================"
echo "System Information Report"
echo "Name: $NAME"
echo "Roll No: $ROLL_NO"
echo "Date: $TODAY"
echo "========================================"
echo "CPU model: $CPU_MODEL"
echo "Logical CPU cores available: $CPU_COUNT"
echo "Memory: $MEMORY_INFO"
echo
echo "Top 3 processes by CPU usage:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 4
echo
echo "Report generated successfully."
