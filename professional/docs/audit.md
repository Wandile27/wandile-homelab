# Homelab Audit

The homelab includes an automated audit script used to capture the operational state of the server.

## Purpose

The audit provides a repeatable snapshot of:

- Host uptime and load
- Root filesystem usage
- Storage filesystem usage
- Docker version
- Docker Compose version
- Container health
- Docker disk usage
- Homelab repository size
- Storage usage
- Backup availability
- Git working-tree state

## Run

From the repository root:

```bash
./professional/scripts/homelab-audit.sh
