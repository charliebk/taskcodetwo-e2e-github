#!/usr/bin/env bash
# Stub de verificacion del E2E de TASK-050: escribe el informe F5-4 en verde.
set -euo pipefail
perfil="${2:-completa}"
ini=$(date -u +%Y-%m-%dT%H:%M:%SZ)
echo "verificacion de prueba ($perfil)"
fin=$(date -u +%Y-%m-%dT%H:%M:%SZ)
if [ -n "${TC2_INFORME:-}" ]; then
  printf '{"version":1,"perfil":"%s","resultado":"verde","commit":"%s","inicio":"%s","fin":"%s","pasos":[{"nombre":"stub","resultado":"verde","segundos":0}],"tests":{"total":3,"fallidos":0}}\n' \
    "$perfil" "$(git rev-parse HEAD)" "$ini" "$fin" > "$TC2_INFORME"
fi
