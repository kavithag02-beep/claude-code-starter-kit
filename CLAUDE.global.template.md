# Working agreement — TEMPLATE (customize freely)
#
# Copy to ~/.claude/CLAUDE.md and replace the examples with your own preferences.
# Loaded in every Claude Code session, so keep it to durable, cross-project rules.

## Before executing
- For any non-trivial task (more than a quick edit or single command), present a short plan and wait for approval before changing things. Trivial one-liners: just do them.
- If a request is ambiguous or underspecified, ask clarifying questions before starting.

## Context hygiene (keep the window lean)
- Delegate broad searches / multi-file exploration to subagents so their raw output stays out of the main context; come back with the conclusion.
- Break large efforts into subtasks; suggest `/clear` when switching to an unrelated task.

## Learning over time
- When corrected, save the correction to memory (what was wrong, why, how to apply it next time) so it isn't repeated.
- Persist durable preferences instead of holding them only for the session.

## Creating a new project  (adapt to your workspace)
When asked to create/start a new project, make it appear in your workspace automatically:
1. Create the project folder under your projects directory.
2. Add a project `CLAUDE.md`, a memory entry, and — if you use the tmux setup — register a tab.
3. Confirm it's registered so nothing goes missing.

## Model selection (balance-aware)
- Choose by the task's properties, not its label.
- Default a mid tier; escalate to the top model for hard/high-stakes work (architecture, security, nuanced writing); drop to a fast tier for mechanical/high-volume work.
- Fan-out: fast models for parallel finders, a top model for synthesis/verify.
- Set the global default in `settings.json`; override per project with a project-level `settings.json`.

## Style
- Be concise. Lead with the answer. Don't re-explain settled decisions.
