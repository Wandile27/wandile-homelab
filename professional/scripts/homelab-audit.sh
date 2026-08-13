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
echo "=== CONTAINER HEALTH ==="

RUNNING=0
HEALTHY=0
UNHEALTHY=0
STARTING=0
NO_HEALTHCHECK=0

while read -r NAME STATUS; do

    RUNNING=$((RUNNING + 1))

    case "$STATUS" in
        *healthy*)
            HEALTHY=$((HEALTHY + 1))
            ;;
        *unhealthy*)
            UNHEALTHY=$((UNHEALTHY + 1))
            ;;
        *starting*)
            STARTING=$((STARTING + 1))
            ;;
        *)
            NO_HEALTHCHECK=$((NO_HEALTHCHECK + 1))
            ;;
    esac

done < <(
    docker ps --format '{{.Names}}|{{.Status}}' |
    while IFS='|' read -r NAME STATUS; do
        echo "$NAME $STATUS"
    done
)

echo "Running containers: $RUNNING"
echo "Healthy:             $HEALTHY"
echo "Unhealthy:           $UNHEALTHY"
echo "Starting:            $STARTING"
echo "No healthcheck:      $NO_HEALTHCHECK"

echo
echo "=== CONTAINERS ==="

docker ps --format 'table {{.Names}}\t{{.Status}}'

echo

if [ "$UNHEALTHY" -gt 0 ]; then
    echo "[WARN] One or more containers are unhealthy"
else
    echo "[OK] No unhealthy containers detected"
fi

if [ "$STARTING" -gt 0 ]; then
    echo "[INFO] One or more containers are still starting"
fi

echo
echo "=== DOCKER DISK USAGE ==="

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
