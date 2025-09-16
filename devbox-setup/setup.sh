#!/bin/bash
set -e

echo "[+] Creating devbox using distrobox.ini..."
distrobox assemble create --file distrobox.ini --name devbox --replace --verbose

# Safer alias: login shell + open current project if under /workspace
ALIAS_STRING="alias code='distrobox enter devbox -- bash -lc \"cd /workspace 2>/dev/null || mkdir -p /workspace && cd /workspace; code .\"'"

if ! grep -Fxq "$ALIAS_STRING" ~/.bashrc; then
  echo "[+] Adding VS Code alias to ~/.bashrc"
  echo "$ALIAS_STRING" >> ~/.bashrc
else
  echo "[=] Alias already exists in ~/.bashrc"
fi

echo "[+] Done. Open a new terminal and run: code"
