#!/usr/bin/env bash
# Sync the GraphQL schema from the backend.
#
# lib/schema/schema.graphql is NOT hand-maintained — it is a copy of the
# backend's canonical merged SDL. The backend produces that artifact via
# its own scripts/export-graphql-schema.sh into docs/schema.graphql.
#
# This script assumes the backend repo is checked out as a sibling directory:
#   <parent>/reciprocal-clubs-backend
#   <parent>/clubland-frontend   (this repo)
# Override with the BACKEND_REPO env var if your layout differs.
#
# After syncing, regenerate GraphQL code:
#   dart run build_runner build --delete-conflicting-outputs
#
# Run from the repository root: ./scripts/sync-schema.sh

set -euo pipefail

cd "$(dirname "$0")/.."

CHECK_MODE=false
if [ "${1:-}" = "--check" ]; then
  CHECK_MODE=true
fi

BACKEND_REPO="${BACKEND_REPO:-../reciprocal-clubs-backend}"
SRC="${BACKEND_REPO}/docs/schema.graphql"
DEST="lib/schema/schema.graphql"

if [ ! -f "$SRC" ]; then
  echo "error: backend schema artifact not found at $SRC" >&2
  echo "  Run 'scripts/export-graphql-schema.sh' in the backend repo first," >&2
  echo "  or set BACKEND_REPO to the backend checkout path." >&2
  exit 1
fi

if $CHECK_MODE; then
  if diff -q "$SRC" "$DEST" > /dev/null 2>&1; then
    echo "ok: $DEST is up to date with backend schema"
    exit 0
  else
    echo "STALE: $DEST differs from $SRC" >&2
    echo "  Run './scripts/sync-schema.sh' then 'dart run build_runner build --delete-conflicting-outputs'" >&2
    diff "$SRC" "$DEST" || true
    exit 1
  fi
fi

cp "$SRC" "$DEST"
echo "Synced $DEST from $SRC ($(wc -l < "$DEST" | tr -d ' ') lines)"
echo "Next: dart run build_runner build --delete-conflicting-outputs"
