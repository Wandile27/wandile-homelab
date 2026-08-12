# Architecture

```text
Internet
   |
Home Router
   |
Home LAN
   |
Lenovo G500 / Ubuntu Server
   +-- Docker
   |    +-- Nextcloud + PostgreSQL + Redis
   |    +-- Jellyfin + Navidrome
   |    +-- Media automation
   |    +-- Portainer + Uptime Kuma
   |    +-- Caddy
   |
   +-- Tailscale + MagicDNS
   |
   +-- Storage
        +-- SSD / OS / applications
        +-- Local bulk storage / media
        +-- ADATA external archive
```

The exact current service state should be checked from the live server rather than assumed from historical Compose files.
