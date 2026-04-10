#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is not installed. See https://brew.sh" >&2
  exit 1
fi

exec brew bundle install --file="$(dirname "$0")/Brewfile" "$@"
