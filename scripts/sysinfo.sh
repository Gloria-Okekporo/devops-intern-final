#!/bin/sh

printf '%s\n' "=== System Information ==="
printf 'Current user: %s\n' "$(id -un)"
printf 'Effective UID: %s\n' "$(id -u)"
printf 'Hostname: %s\n' "$(hostname)"
printf 'Kernel release: %s\n' "$(uname -r)"
printf 'System date: %s\n' "$(date -Iseconds)"
printf 'Disk usage: %s\n' "$(df -h / | awk 'NR==2 {print $5 " used (" $3 "/" $2 ")"}')"

if command -v free >/dev/null 2>&1; then
    printf 'Memory usage: %s\n' "$(free -h | awk '/^Mem:/ {print $3 "/" $2 " used"}')"
else
    printf 'Memory usage: unavailable\n'
fi

if command -v docker >/dev/null 2>&1; then
    if docker info >/dev/null 2>&1; then
        printf 'Docker daemon: running\n'
    else
        printf 'Docker daemon: not running\n'
    fi
else
    printf 'Docker daemon: unavailable\n'
fi
