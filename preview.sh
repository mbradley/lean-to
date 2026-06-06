#!/usr/bin/env bash
#
# Preview the Lean-to theme standalone, at the Hugo version Micro.blog uses (0.91).
# Serves exampleSite/ (the bundled demo content) at http://localhost:1313/
#
# Works from a fresh clone: we mount the repo's PARENT directory and point Hugo's
# --themesDir at it, so --theme=<this-dir-name> resolves without symlinks. The repo
# does not need to be named "lean-to" — the theme name is taken from the directory.
#
set -euo pipefail

cd "$(dirname "$0")"
repo="$(basename "$(pwd)")"

exec docker run --rm \
  -v "$(pwd)/..":/src \
  -p 1313:1313 \
  klakegg/hugo:0.91.0 server \
  --source="/src/${repo}/exampleSite" \
  --themesDir=/src \
  --theme="${repo}" \
  -D --bind=0.0.0.0 "$@"
