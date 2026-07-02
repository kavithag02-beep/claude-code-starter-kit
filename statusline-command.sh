#!/usr/bin/env bash
# Claude Code status line — model-first layout
# Receives JSON on stdin from Claude Code

input=$(cat)

model=$(echo "$input" | jq -r '.model.display_name // "Unknown Model"')
cwd=$(echo "$input"   | jq -r '.workspace.current_dir // .cwd // ""')
dir=$(basename "$cwd")

# Git branch — skip lock acquisition so we never block
branch=""
if [ -n "$cwd" ] && git -C "$cwd" rev-parse --git-dir >/dev/null 2>&1; then
  branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null)
fi

# Build location segment: dir  branch (branch only when present)
if [ -n "$branch" ]; then
  location="${dir}  ${branch}"
else
  location="${dir}"
fi

# ANSI colours (will be dimmed by Claude Code automatically)
BOLD="\033[1m"
CYAN="\033[36m"
YELLOW="\033[33m"
RESET="\033[0m"

printf "${BOLD}${CYAN}${model}${RESET}  ${YELLOW}${location}${RESET}"
