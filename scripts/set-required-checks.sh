#!/bin/bash
set -euo pipefail

if [ "${APP_TYPE:-}" = "angular (node js)" ]; then
  echo 'checks=["CI frontend / build-angular"]' >> "$GITHUB_OUTPUT"
else
  echo 'checks=["CI Backend / build-and-test"]' >> "$GITHUB_OUTPUT"
fi
