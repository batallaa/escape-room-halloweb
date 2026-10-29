#!/bin/bash

CSV_FILE="data/ghost_hosts.csv"

echo "=== HALLOWEB INCIDENT ==="
echo "Analitzant amenaces..."

if [ ! -f "$CSV_FILE" ]; then
    echo "ERROR: No s'ha trobat $CSV_FILE"
    exit 1
fi

tail -n +2 "$CSV_FILE" | while IFS=',' read -r host ip amenaca nivell
do
    if [ "$nivell" = "Critic" ]; then
        echo "[ALERTA] $host - $ip - $amenaca"
    fi
done