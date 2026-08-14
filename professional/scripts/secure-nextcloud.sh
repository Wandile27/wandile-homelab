#!/usr/bin/env bash

set -euo pipefail

IMAGE="/var/lib/nextcloud-secure/storage.img"
MAPPER="nextcloud-secure"
DEVICE="/dev/mapper/$MAPPER"
MOUNTPOINT="/mnt/nextcloud-restore"

echo "======================================"
echo " G500 SECURE NEXTCLOUD STORAGE"
echo "======================================"

echo
echo "=== CHECKING IMAGE ==="

if [[ ! -f "$IMAGE" ]]; then
    echo "[ERROR] Encrypted storage image not found:"
    echo "        $IMAGE"
    exit 1
fi

echo "[OK] Image found:"
echo "     $IMAGE"

echo
echo "=== LUKS STATUS ==="

if sudo cryptsetup status "$MAPPER" 2>/dev/null | grep -q "active"; then
    echo "[OK] LUKS mapper is already active."
else
    echo "[INFO] Unlocking encrypted storage..."
    echo

    sudo cryptsetup open "$IMAGE" "$MAPPER"

    echo
    echo "[OK] Encrypted storage unlocked."
fi

echo
echo "=== VERIFYING MAPPER ==="

if [[ ! -e "$DEVICE" ]]; then
    echo "[ERROR] Mapper device does not exist:"
    echo "        $DEVICE"
    exit 1
fi

echo "[OK] Mapper device:"
echo "     $DEVICE"

echo
echo "=== FILESYSTEM ==="

sudo blkid "$DEVICE" || true

echo
echo "=== MOUNT POINT ==="

sudo mkdir -p "$MOUNTPOINT"

if findmnt -rn -S "$DEVICE" >/dev/null 2>&1; then
    echo "[OK] Secure filesystem is already mounted."
else
    sudo mount "$DEVICE" "$MOUNTPOINT"
    echo "[OK] Secure filesystem mounted."
fi

echo
echo "=== STATUS ==="

sudo cryptsetup status "$MAPPER"

echo
df -hT "$MOUNTPOINT"

echo
echo "======================================"
echo " SECURE STORAGE READY"
echo "======================================"

echo
echo "Mounted at:"
echo "  $MOUNTPOINT"

echo
echo "Contents:"
sudo ls -lah "$MOUNTPOINT"

echo
echo "To close it later:"
echo "  ./professional/scripts/secure-nextcloud-close.sh"
