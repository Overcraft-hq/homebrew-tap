#!/usr/bin/env bash
# Point Casks/overterm.rb at a new Overterm release.
#
# Usage: ./scripts/bump.sh v1.0.1
#
# Downloads the release's DMG, takes its SHA-256 and rewrites the cask's
# version and sha256 in place. Prints the diff to review. Does not commit
# or push.
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "usage: $0 <tag>   (e.g. v1.0.1)" >&2
  exit 2
fi

tag="$1"
version="${tag#v}"
root="$(cd "$(dirname "$0")/.." && pwd)"
cask="$root/Casks/overterm.rb"
url="https://github.com/Overcraft-hq/overterm/releases/download/${tag}/Overterm-${version}.dmg"

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

echo "fetching $url"
curl -fsSL -o "$tmp/Overterm.dmg" "$url"
sha="$(shasum -a 256 "$tmp/Overterm.dmg" | cut -d' ' -f1)"

sed -i '' -E \
  -e "s/^  version \".*\"/  version \"${version}\"/" \
  -e "s/^  sha256 \".*\"/  sha256 \"${sha}\"/" \
  "$cask"

echo "overterm ${version}: ${sha}"
git -C "$root" --no-pager diff -- Casks/overterm.rb
