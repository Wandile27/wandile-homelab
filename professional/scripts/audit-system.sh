#!/usr/bin/env bash
set -euo pipefail
echo '=== HOST ==='; hostnamectl 2>/dev/null || hostname; uname -a; uptime
echo; echo '=== MEMORY ==='; free -h
echo; echo '=== STORAGE ==='; df -hT
echo; echo '=== BLOCK DEVICES ==='; lsblk -o NAME,SIZE,FSTYPE,LABEL,UUID,MOUNTPOINTS
echo; echo '=== NETWORK ==='; ip -br addr; ip route
echo; echo '=== PORTS ==='; sudo ss -tulpn
echo; echo '=== DOCKER ==='; docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}' 2>/dev/null || true
