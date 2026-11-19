#!/bin/sh
# Stub barato de verificacion para el E2E de TASK-042.
echo "verificar: perfil=$TC2_PERFIL base=$RAMA_BASE argumentos=$*"
if [ -f fallar.txt ]; then
  echo "verificar: fallar.txt presente" >&2
  exit 1
fi
echo "verificar: verde"
