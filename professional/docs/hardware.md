# Hardware

## Primary server
- Lenovo G500
- Intel Core i3-3110M
- 8 GB DDR3
- Ubuntu Server
- Headless operation

The G500 has experienced real boot/storage instability. Troubleshooting included journalctl, SMART information, ATA messages, temperatures, power cycling and RAM reseating.

Useful commands:
```bash
lsblk -o NAME,SIZE,FSTYPE,LABEL,UUID,MOUNTPOINTS
sudo smartctl -a /dev/sdX
sudo journalctl -k --since today
dmesg -T | tail -100
```
