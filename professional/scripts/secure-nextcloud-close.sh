#!/usr/bin/env bash

set -euo pipefail

MAPPER="nextcloud-secure"
DEVICE="/dev/mapper/$MAPPER"
MOUNTPOINT="/mnt/nextcloud-restore"

echo "======================================"
echo " CLOSE SECURE NEXTCLOUD STORAGE"
echo "======================================"

echo
echo "=== UNMOUNTING ==="

if findmnt -rn -S "$DEVICE" >/dev/null 2>&1; then
    sudo umount "$MOUNTPOINT"
    echo "[OK] Secure filesystem unmounted."
else
    echo "[INFO] Secure filesystem is not mounted."
fi

echo
echo "=== CLOSING LUKS MAPPER ==="

if sudo cryptsetup status "$MAPPER" 2>/dev/null | grep -q "active"; then
    sudo cryptsetup close "$MAPPER"
    echo "[OK] Encrypted storage closed."
else
    echo "[INFO] LUKS mapper is already closed."
fi

echo
echo "======================================"
echo " SECURE STORAGE CLOSED"
echo "======================================"
