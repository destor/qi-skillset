#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

out="dist"
rm -rf "$out"
mkdir -p "$out"

check_skill() {
  local file="skills/$1/SKILL.md" declared
  if [ ! -f "$file" ]; then
    echo "error: skills/$1 has no SKILL.md" >&2
    exit 1
  fi
  declared="$(sed -n '2,/^---$/p' "$file" | sed -n 's/^name: *"\{0,1\}\([^"]*\)"\{0,1\} *$/\1/p' | head -n 1)"
  if [ "$declared" != "$1" ]; then
    echo "error: $file: name in frontmatter is '$declared' but the folder is '$1'" >&2
    exit 1
  fi
}

merge() {
  local src rel
  while IFS= read -r src; do
    rel="${src#"$1"/}"
    if [ -e "$2/$rel" ]; then
      echo "error: $1/$rel would overwrite $rel in $2" >&2
      exit 1
    fi
    mkdir -p "$(dirname "$2/$rel")"
    cp "$src" "$2/$rel"
  done < <(find "$1" -type f ! -name '.DS_Store' | sort)
}

found=0
for dir in skills/*/; do
  name="$(basename "$dir")"
  check_skill "$name"
  mkdir -p "$out/$name"
  merge "skills/$name" "$out/$name"
  merge shared "$out/$name"
  find "$out/$name" -name '.DS_Store' -delete
  (cd "$out" && zip -q -r -X "$name.zip" "$name")
  found=$((found + 1))
done

if [ "$found" -eq 0 ]; then
  echo "error: no skills found in skills/" >&2
  exit 1
fi
ls -l "$out"

./scripts/build-prompts.sh
