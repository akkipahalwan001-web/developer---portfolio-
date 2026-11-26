#!/usr/bin/env bash
# Print a concise system report.
set -u
echo "===== SYSTEM REPORT ====="
echo "Date/time: $(date)"
echo "User: $(whoami)"
echo "Host: $(hostname)"
echo "Current directory: $(pwd)"
echo
echo "-- Kernel --"
uname -a
echo
echo "-- Disk --"
df -h
echo
echo "-- Memory --"
if command -v free >/dev/null 2>&1; then free -h; else echo "free is not installed"; fi
echo "========================"
