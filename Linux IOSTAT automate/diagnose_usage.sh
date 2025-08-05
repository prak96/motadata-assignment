#!/bin/bash

# diagnose_usage.sh
# Run this locally or remotely via SSH or YAML

echo "=== High Usage Diagnostic Report ==="
echo "[+] Hostname: $(hostname)"
echo "[+] Time: $(date)"
echo ""

echo "[CPU Usage:]"
top -bn1 | grep "Cpu(s)"

echo "[Top CPU-Consuming Processes:]"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -10

echo "[Memory Usage:]"
free -m

echo "[Disk Usage:]"
df -hT | grep -v tmpfs

echo "[Inode Usage:]"
df -i

echo "[I/O Wait / Load Average:]"
uptime

echo "[Zombie Processes:]"
ps aux | awk '{ if ($8 == "Z") print $0; }'

echo "[Dmesg Errors:]"
dmesg | tail -20
