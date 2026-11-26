#!/usr/bin/env bash
# Collect basic system profile and command outputs.
# Run from any directory; output is saved beside this script.
set -u
OUT="$(dirname "$0")/system_profile.txt"
{
  echo "LINUX SYSTEM PROFILE"
  echo "==================="
  echo "Collected: $(date)"
  echo
  echo "User: $(whoami)"
  echo "Working directory: $(pwd)"
  echo
  echo "UNAME"
  uname -a
  echo
  echo "OS RELEASE"
  if [ -f /etc/os-release ]; then cat /etc/os-release; else echo "/etc/os-release not found"; fi
  echo
  echo "FILES"
  ls -la
  echo
  echo "STORAGE"
  df -h
  echo
  echo "MEMORY"
  if command -v free >/dev/null 2>&1; then free -h; else echo "free command unavailable"; fi
  echo
  echo "NETWORK"
  if command -v ip >/dev/null 2>&1; then ip addr; else echo "ip command unavailable"; fi
} > "$OUT"
echo "Report saved to: $OUT"
