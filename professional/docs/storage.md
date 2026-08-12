# Storage

## Layers

```text
storage.img
   -> LUKS2
   -> /dev/mapper/nextcloud-secure
   -> ext4
   -> mount point
```

The Nextcloud encrypted storage recovery was successfully verified with:

```bash
sudo cryptsetup status nextcloud-secure
sudo blkid /dev/mapper/nextcloud-secure
sudo mkdir -p /mnt/nextcloud-restore
sudo mount /dev/mapper/nextcloud-secure /mnt/nextcloud-restore
```

## Safe storage workflow

Before destructive changes:
```bash
lsblk -f
df -hT
findmnt
```

Before large rsync operations:
```bash
rsync -aHn --itemize-changes SOURCE/ DEST/
```

Review the dry run before using a real synchronization, especially before `--delete`.

Never assume `/dev/sda` or `/dev/sdb` is the same physical disk after a reboot or hardware change.
