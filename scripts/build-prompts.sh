#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

out="dist"
dest="$out/prompts"
section="## Reference files"

if ! ls "$out"/*/SKILL.md > /dev/null 2>&1; then
  echo "error: no built skills in $out/; run scripts/build.sh first" >&2
  exit 1
fi
rm -rf "$dest"
mkdir -p "$dest"

body() {
  awk -v keep="$2" -v section="$section" '
    NR == 1 && $0 == "---" { front = 1; next }
    front { if ($0 == "---") front = 0; next }
    /^## / { skip = (!keep && $0 == section) }
    !skip { print }
  ' "$1"
}

reference() {
  awk -v path="$2" '
    !done && /^# / { sub(/^# /, ""); print "# File " path ": " $0; done = 1; next }
    { print }
    END { if (!done) { print "error: " path " has no title line" > "/dev/stderr"; exit 1 } }
  ' "$1"
}

squeeze() {
  awk '
    { sub(/[ \t]+$/, "") }
    /^$/ { blank = 1; next }
    { if (seen && blank) print ""; blank = 0; seen = 1; print }
  '
}

closing='---

## Start the conversation

The prompt I pasted selects the mode for this chat. A topic alone, such as "phase kick-back", is enough to start that mode; do not require a command such as "Inquire about phase kick-back".

If I have not supplied a topic, question, problem or previous-session summary outside these instructions, ask: "Which quantum computing or quantum information topic would you like to work on? You can reply with just the topic name." Then wait for my reply. Do not reply only "Ready".

When I supply it, either after this prompt or in a later message, begin following the instructions above immediately: explain in explanation mode, orient in tutoring mode, or propose the session subjects and ask for confirmation in questioning mode. Preserve the session setup and turn-taking rules; do not ask for another command or merely acknowledge the topic.'

for dir in "$out"/*/; do
  name="$(basename "$dir")"
  skill="$dir/SKILL.md"
  [ -f "$skill" ] || continue

  if ! grep -q -x -F -- "$section" "$skill"; then
    echo "error: $name/SKILL.md has no '$section' section" >&2
    exit 1
  fi

  {
    echo "Follow the instructions below for the rest of this conversation. This condensed prompt omits the skill's reference files. If an instruction asks you to read one, it is unavailable: follow any fallback in the instructions; otherwise proceed using the remaining instructions without inventing file contents or citations."
    echo
    body "$skill" 0
    echo
    echo "$closing"
  } | squeeze > "$dest/$name-prompt.md"

  {
    echo "Follow the instructions below for the rest of this conversation. They were written as an assistant skill with separate reference files. Every file the text names under \`references/\` is included after the instructions, under a heading that starts with \"File\" and its path."
    echo
    body "$skill" 1
    if [ -d "$dir/references" ]; then
      files="$(find "$dir/references" -type f -name '*.md' | sort)" || {
        echo "error: could not list reference files in $dir/references" >&2
        exit 1
      }
      while IFS= read -r file; do
        [ -n "$file" ] || continue
        echo
        reference "$file" "${file#"$dir"/}"
      done <<< "$files"
    fi
    echo
    echo "$closing"
  } | squeeze > "$dest/$name-prompt-full.md"
done

wc -w "$dest"/*.md
