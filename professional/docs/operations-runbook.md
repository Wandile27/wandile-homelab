# Operations Runbook

## Routine
```bash
uptime
df -h
docker ps
docker stats --no-stream
```

## Before major changes
```bash
git status
docker compose config
docker ps
lsblk -f
df -hT
```

## After changes
```bash
docker ps
docker compose ps
df -hT
```

Do not blindly:
- delete Docker volumes
- run `docker system prune`
- run `rsync --delete`
- modify encrypted storage
- wipe a disk

Capture state first.
