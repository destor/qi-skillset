#!/usr/bin/env bash
# Builds the skills into dist/: one folder and one zip per skill. Then runs
# scripts/build-prompts.sh, which writes copy-paste prompts made from the
# portable skills to dist/prompts/.
#
# There are two sets of skills:
#
#   skills/<name>/          Portable skills, for chat apps and agents alike.
#                           Built to dist/<name>/ and dist/<name>.zip.
#   harness-skills/<name>/  Skills that only work in an agent harness that can
#                           launch subagents and write files (Claude Code).
#                           Built to dist/harness/<name>/ and dist/<name>.zip.
#                           No prompts are made from these.
#
# Every skill gets the files in shared/ merged in at the same relative path
# (shared/references/textbook-map.md becomes <name>/references/textbook-map.md).
#
# A harness skill can build on a portable one. A line in its SKILL.md that
# reads exactly
#
#   <!-- include: <portable skill name> -->
#
# is replaced by the body of that skill's SKILL.md (without the frontmatter),
# and that skill's other files are copied in, so the built harness skill is
# complete on its own.
#
# Each zip has the skill folder at its root, which is the layout Claude,
# ChatGPT and Gemini expect on upload.
set -euo pipefail
cd "$(dirname "$0")/.."

out="dist"
rm -rf "$out"
mkdir -p "$out"

# Fails unless <set>/<name>/SKILL.md exists and declares the folder's name.
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

# Copies every file under the folder $1 into $2, at the same relative path.
# A file that is already there is an error: nothing is ever overwritten.
# Files named in $3 (relative paths, one per line) are left out.
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

# SKILL.md without its frontmatter and the blank lines right after it.
body() {
  awk '
    NR == 1 && $0 == "---" { front = 1; next }
    front { if ($0 == "---") front = 0; next }
    !seen && /^$/ { next }
    { seen = 1; print }
  ' "$1"
}

# $1: folder that holds the built skill $2. Zips it into dist/.
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

    # Write SKILL.md with each include line replaced by that skill's body,
    # and copy in the included skill's other files.
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

# Copy-paste prompts for chats that cannot import skills, in dist/prompts/.
./scripts/build-prompts.sh
