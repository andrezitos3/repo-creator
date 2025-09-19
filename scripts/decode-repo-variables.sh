#!/bin/bash
set -euo pipefail

if [ -n "${REPO_VARIABLES:-}" ]; then
  # tenta decodificar e validar como JSON
  decoded=$(echo "$REPO_VARIABLES" | base64 -d | jq .)
  echo "vars=$decoded" >> "$GITHUB_OUTPUT"
else
  echo "vars={}" >> "$GITHUB_OUTPUT"
fi
