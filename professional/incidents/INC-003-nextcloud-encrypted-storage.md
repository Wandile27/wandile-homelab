# INC-003 — Nextcloud Encrypted Storage Recovery

Date: 2026-08-11

Initial problems included a command typo, passphrase failure and an invalid mount command.

Verified:
- LUKS2 mapper active
- `/dev/mapper/nextcloud-secure`
- mapped filesystem is ext4
- filesystem successfully mounted at `/mnt/nextcloud-restore`

Key lesson:
```text
image -> LUKS2 -> mapper device -> filesystem -> mount point
```
Unlocking and mounting are separate operations.
