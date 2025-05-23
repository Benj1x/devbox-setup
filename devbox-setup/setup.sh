#!/bin/bash
set -e

echo "[+] Creating devbox using distrobox.ini..."
distrobox assemble create

# Add alias if it doesn't already exist
ALIAS_STRING="alias code='distrobox-enter devbox -- bash -c \"mkdir -p /workspace && cd /workspace && code .\"'"

if ! grep -Fxq "$ALIAS_STRING" ~/.bashrc; then
    echo "[+] Adding VS Code alias to ~/.bashrc"
    echo "$ALIAS_STRING" >> ~/.bashrc
else
    echo "[=] Alias already exists in ~/.bashrc"
fi

echo "[+] Done. You can now run 'code' to launch VS Code in devbox."
