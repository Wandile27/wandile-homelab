#!/bin/bash

echo "======================================"
echo "        G500 HOMELAB AUDIT"
echo "======================================"

echo
echo "=== HOST ==="
hostname
uptime

echo
echo "=== STORAGE ==="
df -hT / /mnt/storage

echo
echo "=== STORAGE CHECK ==="

ROOT_USE=$(df -P / | awk 'NR==2 {print $5}' | tr -d '%')
STORAGE_USE=$(df -P /mnt/storage | awk 'NR==2 {print $5}' | tr -d '%')

echo "Root usage: ${ROOT_USE}%"
echo "Storage usage: ${STORAGE_USE}%"

if [ "$ROOT_USE" -ge 80 ]; then
    echo "[WARN] Root filesystem above 80%"
else
    echo "[OK] Root filesystem healthy"
fi

if [ "$STORAGE_USE" -ge 80 ]; then
    echo "[WARN] Storage filesystem above 80%"
else
    echo "[OK] Storage filesystem healthy"
fi

echo
echo "=== DOCKER ==="
docker --version
docker compose version

echo
echo "=== CONTAINERS ==="

TOTAL_CONTAINERS=$(docker ps -q | wc -l)

echo "Running containers: $TOTAL_CONTAINERS"
echo

docker ps \
    --format 'table {{.Names}}\t{{.Status}}'

if [ "$TOTAL_CONTAINERS" -eq 0 ]; then
    echo
    echo "[WARN] No containers are currently running"
else
    echo
    echo "[OK] Docker containers are running"
fi

echo
echo "=== DOCKER VOLUMES ==="
docker system df

echo
echo "=== HOMELAB SIZE ==="

HOMELAB_SIZE=$(du -sh ~/homelab 2>/dev/null | awk '{print $1}')

if [ -n "$HOMELAB_SIZE" ]; then
    echo "Homelab size: $HOMELAB_SIZE"
    echo "[OK] Homelab size calculated"
else
    echo "[WARN] Could not calculate homelab size"
fi

echo
echo "=== STORAGE SIZE ==="

STORAGE_SIZE=$(du -sh /mnt/storage 2>/dev/null | awk '{print $1}')

if [ -n "$STORAGE_SIZE" ]; then
    echo "Storage used: $STORAGE_SIZE"
    echo "[OK] Storage size calculated"
else
    echo "[WARN] Could not calculate storage size"
fi

echo
echo "=== BACKUPS ==="

BACKUP_DIR="/mnt/storage/backups"

if [ -d "$BACKUP_DIR" ]; then
    BACKUP_SIZE=$(du -sh "$BACKUP_DIR" 2>/dev/null | awk '{print $1}')
    echo "Backup directory: $BACKUP_DIR"
    echo "Backup size: ${BACKUP_SIZE:-unknown}"
    echo "[OK] Backup directory exists"
else
    echo "[WARN] Backup directory does not exist"
fi

echo
echo "=== GIT ==="

GIT_STATUS=$(git -C ~/homelab status --short)

if [ -z "$GIT_STATUS" ]; then
    echo "[OK] Git working tree clean"
else
    echo "[WARN] Git working tree has changes"
    echo
    echo "$GIT_STATUS"
fi

echo
echo "======================================"
echo "          AUDIT COMPLETE"
echo "======================================"
