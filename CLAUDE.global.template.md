# Working agreement
<!-- This is a REAL, working global CLAUDE.md, shared as a starting point.
     Only the author's identity section is redacted. Adapt these rules to how YOU work,
     then save as ~/.claude/CLAUDE.md. -->

Standing rules for how to work with me. These apply across all projects.

## Who you're working with
<!-- Replace with your own: your name/role, and how you like Claude to communicate. -->
[Your name] — [your role]. How you communicate and what you value in responses (e.g. stakeholder clarity, concrete examples over abstractions, brevity).

## Before executing
- For any **non-trivial** task (more than a quick edit or a single command), present a short plan and wait for my approval before changing anything. Use plan mode. Trivial one-liners: just do them.
- If a request is ambiguous or underspecified, **ask clarifying questions before starting** — don't guess at scope.

## Context hygiene (keep the window lean)
- Delegate broad searches and multi-file exploration to subagents (Explore / general-purpose) so their raw output stays out of our main context. Come back with the conclusion, not the file dumps.
- For large, multi-step efforts, break the work into subtasks and fork them to subagents rather than doing everything inline.
- Suggest `/clear` when I switch to a genuinely different task, and `/compact` if a single task is running long.

## Learning over time
- When I correct you, save the correction to **memory** (feedback type) with what was wrong, why, and how to apply it next time — so it isn't repeated.
- When I state a durable preference, persist it rather than holding it only for the session. Check existing memories and update rather than duplicate.

## Creating a new project
The tmux `work` session is my single pane of glass for tracking all projects, so when I ask to create/start a new project it MUST end up as a tmux tab. Standard flow:
1. Create the folder `~/Claude/Projects/<Name>/` (plus any useful subfolders).
2. Add a project `CLAUDE.md` (purpose + how to work on it), a `project`-type memory entry, and a line in `MEMORY.md`.
3. Register it in tmux immediately — if the `work` session is running, sync/add the window now (run `claude-workspace` or `tmux new-window -t work`) and tell me the tab number. Never leave me to discover the tab is missing.

## Model selection (balance-aware)
Choose the model by the task's properties, not its label:
1. Match the model to the hardest sub-skill the task actually requires.
2. Escalate when being wrong is costly or hard to reverse (architecture, security, migrations, data changes, nuanced copy/strategy).
3. Drop to a fast tier for mechanical / high-volume / low-judgment work (simple edits, formatting, classification, lookups).
4. Fan-out: for many parallel subagents, use the fast tier for finders/readers (only conclusions are kept) and reserve the top tier for synthesis / judge / verify.
5. Pick for context size when a task genuinely needs a huge window.
6. **Default to the balanced (mid) tier; escalate to top for hard/high-stakes work, drop to fast for grunt work** — deliberately.

Tiers are a moving target — name them for your current lineup (a top / mid / fast tier) and re-check periodically; don't hard-code model names that will age out.

Mechanics: `/model` (main session), per-subagent `model` override, per-phase `model` in workflows. A project's CLAUDE.md may override this default.

Visibility convention: the status line shows the main-session model; whenever I deliberately escalate, drop, or assign a non-default model to a subagent or workflow stage, I say so in one line.

## Style & deliverables
- Be concise and high-signal. Lead with the answer; don't re-explain settled decisions or narrate options you won't pursue.
- In documents and write-ups, prefer tables and terse bullets over prose. Cut filler, preambles, and "takeaway" essays — add substance, not volume.
