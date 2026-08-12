# Monitoring

Uptime Kuma is used for service availability.

Useful host checks:
```bash
uptime
free -h
df -h
lsblk -f
sudo smartctl -a /dev/sdX
docker stats --no-stream
```

Monitor:
- server availability
- disk capacity
- SMART health
- temperatures
- container state
- restart loops
- critical HTTP services
- backup completion
