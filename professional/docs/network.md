# Network

## Access layers
- LAN: local clients and services
- SSH: server administration
- Tailscale: private remote access
- MagicDNS: private name resolution
- Docker networks: application isolation

## Useful checks
```bash
ip -br addr
ip route
ss -tulpn
docker network ls
docker ps --format 'table {{.Names}}\t{{.Ports}}'
```

## Troubleshooting order
1. Link/connectivity
2. IP addressing
3. Routing
4. DNS
5. Firewall
6. Docker network
7. Container
8. Application/dependency

## CCNA relevance
The lab complements Cisco Packet Tracer work covering IPv4, subnetting, DHCP, routing, switching, NAT and troubleshooting.
