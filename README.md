# Claude Code — Multi-Project Starter Kit

Config-only setup for running Claude Code across many projects as a single **pane of glass**: one tmux session with a tab per project, tab colors that show which project needs you, notifications, model discipline, and persistent instructions.

**It's config only — no projects, no personal data.** You install it once, then your own projects slot in automatically. See **[PLAYBOOK.md](PLAYBOOK.md)** for the why/how and the best practices behind it.

## Get started
```bash
git clone https://github.com/kavithag02-beep/claude-code-starter-kit.git
cd claude-code-starter-kit
```
Then run the install below.

## How you'll use it (the 5-minute path)
1. **Install once** (steps below) — copy the config files into place.
2. **Customize** `CLAUDE.global.template.md` → `~/.claude/CLAUDE.md` with your own preferences.
3. **Add your projects** — make a folder per project under `~/Claude/Projects/`. The launcher auto-discovers whatever folders exist, so it fills with *your* work.
4. **Run `workspace`** → a tmux session with a tab per project, color-coded by state, with notifications.

Nothing here carries anyone else's projects or preferences — those are the parts you fill in.

## What's here
| File | Goes to | Purpose |
|---|---|---|
| `tmux.conf` | `~/.tmux.conf` | tmux quality-of-life (mouse, splits, status bar) |
| `claude-workspace` | `~/.local/bin/` (chmod +x) | Opens a tmux tab per project folder; auto-syncs new ones |
| `claude-tmux-flag` | `~/.local/bin/` (chmod +x) | Colors a tab by Claude's state (working / needs-input / done) |
| `statusline-command.sh` | `~/.claude/` (chmod +x) | Status line showing the active model + dir + git branch |
| `settings.hooks.json` | **merge** into `~/.claude/settings.json` | Notification + tab-color hooks, status line, model default |
| `CLAUDE.global.template.md` | adapt → `~/.claude/CLAUDE.md` | Your standing working agreement |
| `CLAUDE.project.template.md` | copy → `<project>/CLAUDE.md` | Per-project skeleton |

## Install (macOS; adapt paths for Linux)
```bash
# prerequisites: tmux, jq, and ~/.local/bin on your PATH
mkdir -p ~/.local/bin ~/.claude ~/Claude/Projects

cp tmux.conf ~/.tmux.conf
cp claude-workspace claude-tmux-flag ~/.local/bin/ && chmod +x ~/.local/bin/claude-workspace ~/.local/bin/claude-tmux-flag
cp statusline-command.sh ~/.claude/ && chmod +x ~/.claude/statusline-command.sh

# merge settings.hooks.json into ~/.claude/settings.json (keep any keys you already have)
# if you have no settings yet:  cp settings.hooks.json ~/.claude/settings.json

cp CLAUDE.global.template.md ~/.claude/CLAUDE.md   # then edit it with YOUR preferences

echo 'alias workspace="claude-workspace"' >> ~/.zshrc && source ~/.zshrc
```
Put each project in its own folder under `~/Claude/Projects/` (or set `WORKSPACE_PROJECTS_DIR`), drop a copy of `CLAUDE.project.template.md` as `CLAUDE.md` in each, and run `workspace`.

## Notes & gotchas
- **Notifications use macOS `osascript`.** On Linux, swap those for `notify-send` in `settings.hooks.json`.
- **Hooks and the `model` setting load at session START.** After changing them, restart the Claude session — running sessions keep their old config.
- **`/model` changes the GLOBAL default**, not just your session. For a durable per-project model, add a project-level `.claude/settings.json` with a `"model"` key.
- **`CLAUDE.md` is guidance, not the model switch** — that's the `model` setting / `/model`.
- **Pipe-test hooks** before trusting them, e.g. `echo '{"message":"test"}' | <the hook command>`.
- Tab colors: 🟣 working · 🔴 needs your input · 🟢 done · uncolored = idle.

## License
MIT — see [LICENSE](LICENSE).
