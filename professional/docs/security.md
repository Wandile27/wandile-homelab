# Security Baseline

- Keep Ubuntu updated.
- Prefer SSH keys.
- Restrict unnecessary listening ports.
- Use a host firewall.
- Keep management interfaces private.
- Use Tailscale for private remote access where appropriate.
- Keep Docker networks intentional.
- Never commit secrets.

Checks:
```bash
sudo ss -tulpn
sudo ufw status verbose
systemctl --type=service --state=running
```
