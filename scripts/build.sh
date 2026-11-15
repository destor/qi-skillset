#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

out="dist"
rm -rf "$out"
mkdir -p "$out"

check_skill() {
  local file="$1/$2/SKILL.md" declared
  if [ ! -f "$file" ]; then
    echo "error: $1/$2 has no SKILL.md" >&2
    exit 1
  fi
  declared="$(sed -n '2,/^---$/p' "$file" | sed -n 's/^name: *"\{0,1\}\([^"]*\)"\{0,1\} *$/\1/p' | head -n 1)"
  if [ "$declared" != "$2" ]; then
    echo "error: $file: name in frontmatter is '$declared' but the folder is '$2'" >&2
    exit 1
  fi
}

merge() {
  local src rel
  while IFS= read -r src; do
    rel="${src#"$1"/}"
    if [ -n "${3:-}" ] && grep -q -x -F -- "$rel" <<< "$3"; then
      continue
    fi
    if [ -e "$2/$rel" ]; then
      echo "error: $1/$rel would overwrite $rel in $2" >&2
      exit 1
    fi
    mkdir -p "$(dirname "$2/$rel")"
    cp "$src" "$2/$rel"
  done < <(find "$1" -type f ! -name '.DS_Store' | sort)
}

body() {
  awk '
    NR == 1 && $0 == "---" { front = 1; next }
    front { if ($0 == "---") front = 0; next }
    !seen && /^$/ { next }
    { seen = 1; print }
  ' "$1"
}

package() {
  find "$1/$2" -name '.DS_Store' -delete
  (cd "$1" && zip -q -r -X "$OLDPWD/$out/$2.zip" "$2")
}

found=0
for dir in skills/*/; do
  name="$(basename "$dir")"
  check_skill skills "$name"
  mkdir -p "$out/$name"
  merge "skills/$name" "$out/$name"
  merge shared "$out/$name"
  package "$out" "$name"
  found=$((found + 1))
done

if [ "$found" -eq 0 ]; then
  echo "error: no skills found in skills/" >&2
  exit 1
fi

if [ -d harness-skills ]; then
  for dir in harness-skills/*/; do
    [ -d "$dir" ] || continue
    name="$(basename "$dir")"
    check_skill harness-skills "$name"
    if [ -d "skills/$name" ]; then
      echo "error: '$name' is in both skills/ and harness-skills/" >&2
      exit 1
    fi
    dest="$out/harness/$name"
    mkdir -p "$dest"
    merge "harness-skills/$name" "$dest" "SKILL.md"

    : > "$dest/SKILL.md"
    while IFS= read -r line || [ -n "$line" ]; do
      case "$line" in
        "<!-- include: "*" -->")
          base="${line#"<!-- include: "}"
          base="${base%" -->"}"
          if [ ! -f "skills/$base/SKILL.md" ]; then
            echo "error: harness-skills/$name/SKILL.md includes '$base', which is not in skills/" >&2
            exit 1
          fi
          body "skills/$base/SKILL.md" >> "$dest/SKILL.md"
          merge "skills/$base" "$dest" "SKILL.md"
          ;;
        *)
          printf '%s\n' "$line" >> "$dest/SKILL.md"
          ;;
      esac
    done < "harness-skills/$name/SKILL.md"

    merge shared "$dest"
    package "$out/harness" "$name"
  done
fi

ls -l "$out"

./scripts/build-prompts.sh
