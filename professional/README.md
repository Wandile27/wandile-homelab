# Wandile Homelab & Infrastructure Portfolio

Hands-on Linux, networking, Docker, storage, monitoring and self-hosting lab built for practical IT infrastructure experience.

## What this demonstrates
- Ubuntu Server administration and SSH
- Docker and Docker Compose
- Persistent storage, ext4, LVM and LUKS2
- PostgreSQL and Redis
- Tailscale and MagicDNS
- Reverse-proxy concepts
- Monitoring with Uptime Kuma
- Nextcloud, Jellyfin and Navidrome
- Media automation with qBittorrent/Prowlarr/Sonarr/Radarr/Lidarr/Jellyseerr
- Hardware and SMART troubleshooting
- Backup and restore planning
- Cisco Packet Tracer / CCNA networking practice
- Git-based documentation and incident management

## Hardware
Lenovo G500, Intel Core i3-3110M, 8 GB DDR3, Ubuntu Server.

Storage has included SSD/LVM system storage, local bulk storage and an external ADATA HDD. Device names are deliberately not hardcoded because `/dev/sdX` assignments can change.

## Operating philosophy
Observe -> isolate -> change one thing -> verify -> document -> improve.

The lab contains real failures and recovery work. Those incidents are treated as evidence of troubleshooting ability rather than hidden.

See `docs/` and `incidents/` for the professional documentation set.
