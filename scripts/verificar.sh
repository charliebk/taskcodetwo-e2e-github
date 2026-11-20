#!/usr/bin/env bash
# Stub del comando de verificacion para la medicion E2E de TASK-043 (F5-3).
#
# No verifica nada: duerme una duracion fija por perfil y escribe el informe
# F5-4 (crates/tc2/esquemas/informe-verificacion.schema.json, version 1) en
# $TC2_INFORME, si esta definida.
#
# Uso (el workflow reutilizable lo llama asi):  verificar.sh --perfil <p>
#   Sin --perfil usa $TC2_PERFIL.
#   STUB_SEGUNDOS=<n> fuerza la duracion (p. ej. para probarlo en local).
#   STUB_ROJO=1 sale en rojo (codigo 1) con el paso en rojo.
set -eu

perfil="${TC2_PERFIL:-}"
while [ "$#" -gt 0 ]; do
  case "$1" in
    --perfil) perfil="${2:-}"; shift 2 || shift ;;
    --perfil=*) perfil="${1#--perfil=}"; shift ;;
    *) echo "verificar.sh (stub): argumento desconocido: $1" >&2; exit 2 ;;
  esac
done

case "$perfil" in
  completa) segundos=120 ;;
  impacto) segundos=20 ;;
  rapida) segundos=10 ;;
  pesada) segundos=150 ;;
  *) echo "verificar.sh (stub): perfil desconocido: '$perfil'" >&2; exit 2 ;;
esac
segundos="${STUB_SEGUNDOS:-$segundos}"

inicio=$(date -u +%Y-%m-%dT%H:%M:%SZ)
t0=$(date +%s)
echo "verificar.sh (stub): perfil=$perfil RAMA_BASE=${RAMA_BASE:-} durmiendo ${segundos}s"
sleep "$segundos"
t1=$(date +%s)
fin=$(date -u +%Y-%m-%dT%H:%M:%SZ)

if [ "${STUB_ROJO:-}" = 1 ]; then resultado=rojo; codigo=1; else resultado=verde; codigo=0; fi

commit=$(git rev-parse HEAD 2>/dev/null || true)
case "$commit" in
  [0-9a-f]*) [ "${#commit}" -eq 40 ] && commit="\"$commit\"" || commit=null ;;
  *) commit=null ;;
esac

if [ -n "${TC2_INFORME:-}" ]; then
  mkdir -p "$(dirname "$TC2_INFORME")"
  cat > "$TC2_INFORME" <<JSON
{
  "version": 1,
  "perfil": "$perfil",
  "resultado": "$resultado",
  "commit": $commit,
  "inicio": "$inicio",
  "fin": "$fin",
  "pasos": [
    { "nombre": "stub-$perfil", "resultado": "$resultado", "segundos": $((t1 - t0)) }
  ]
}
JSON
  echo "verificar.sh (stub): informe en $TC2_INFORME"
fi

echo "verificar.sh (stub): perfil=$perfil resultado=$resultado en $((t1 - t0))s"
exit "$codigo"
