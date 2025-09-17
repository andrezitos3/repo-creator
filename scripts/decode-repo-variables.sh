#!/bin/bash
set -euo pipefail

if [ -n "${REPO_VARIABLES:-}" ]; then

  # tenta decodificar base64
  decoded=$(echo "$REPO_VARIABLES" | base64 -d 2>/dev/null || true)

  if [ -z "$decoded" ]; then
    echo "❌ Erro: valor informado não pôde ser decodificado de base64."
    exit 1
  fi

  # valida se é JSON válido
  if ! echo "$decoded" | jq empty >/dev/null 2>&1; then
    echo "❌ Erro: valor informado não é um JSON válido após decodificação."
    exit 1
  fi

  echo "vars=$decoded" >> "$GITHUB_OUTPUT"
else
  echo "vars={}" >> "$GITHUB_OUTPUT"
fi
