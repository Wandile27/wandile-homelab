#!/usr/bin/env bash
set -euo pipefail
echo '=== CONTAINERS ==='; docker ps -a --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}'
echo; echo '=== NETWORKS ==='; docker network ls
echo; echo '=== VOLUMES ==='; docker volume ls
echo; echo '=== RESOURCES ==='; docker stats --no-stream 2>/dev/null || true
echo; echo '=== DISK ==='; docker system df
