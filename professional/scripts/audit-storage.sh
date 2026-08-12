#!/usr/bin/env bash
set -euo pipefail
echo '=== FILESYSTEMS ==='; df -hT
echo; echo '=== MOUNTS ==='; findmnt
echo; echo '=== BLOCK DEVICES ==='; lsblk -f
echo; echo '=== STORAGE ROOT ==='; du -sh /mnt/storage/* 2>/dev/null | sort -h || true
echo; echo '=== MUSIC ==='
if [ -d /mnt/storage/media/Music ]; then
  find /mnt/storage/media/Music -type f | wc -l
  find /mnt/storage/media/Music -type f -printf '%s\n' | awk '{sum+=$1} END {printf "%.2f GB\n", sum/1024/1024/1024}'
fi
