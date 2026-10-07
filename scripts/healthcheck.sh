#!/bin/sh

TARGET_URL="${1:-http://localhost:8080}"

if curl -fsS --max-time 5 "$TARGET_URL" >/dev/null 2>&1; then
    printf 'Health check passed: %s\n' "$TARGET_URL"
    exit 0
fi

printf 'Health check failed: %s\n' "$TARGET_URL" >&2
exit 1
