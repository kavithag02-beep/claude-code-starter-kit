# Claude Code — Multi-Project Workflow Playbook

*How to set up Claude Code as a persistent teammate across many projects — one that remembers your preferences, stays on task, and shows you exactly where to focus. Copy what's useful. The [`README.md`](README.md) has the install; this is the why/how.*

## The mental model
Run **one tmux session as your single pane of glass**: one tab per project, a Claude Code session in each, working in parallel. Then layer on four things — **persistent instructions**, **lean context**, **at-a-glance status**, and **notifications** — so you can start work, walk away, and know exactly where to jump back in.

## 1. Make it remember you (stop repeating yourself)
- **Global `~/.claude/CLAUDE.md`** — standing rules loaded in *every* session (how you like Claude to work). Write your preferences once.
- **Per-project `CLAUDE.md`** — that project's context and conventions; auto-loads when you work there.
- **Memory** — facts Claude *learns over time*. Rule of thumb: **CLAUDE.md = rules you state; memory = lessons it accumulates.** Correct it once, tell it to remember — it sticks.

## 2. Keep context lean (why it drifts, and the fix)
- **Delegate search/exploration to subagents** — they read in their own context and return just the conclusion, keeping your main thread clean.
- **Fork big efforts into subtasks** instead of doing everything inline.
- **Use `/clear` between unrelated tasks**; aim for one task per session.

## 3. tmux = single pane of glass
- One session, **one tab per project.** A launcher opens a tab per project folder and **auto-syncs new projects.**
- **One tab = one task.** Run a Claude session per project; switch with a keystroke.
- **Detach and walk away** (`Ctrl-b d`): long tasks keep running; reattach later, right where you left them.

## 4. See where to focus — color-code your tabs
Wire Claude Code's **hooks** to recolor each tab by session state:

| Tab color | Meaning |
|---|---|
| 🟣 Purple | Working — actively on your task |
| 🔴 Red | Paused — needs your input |
| 🟢 Green | Finished — ready for you |
| (uncolored) | Idle |

## 5. Notifications (so you don't babysit)
- Hooks fire a **desktop notification** when Claude needs input or finishes.
- Optional: **mobile push + Remote Control** to get pinged on your phone and continue a session from it.

## 6. Right model for the task (balance-aware)
- **Default a mid tier; escalate to the top model for hard/high-stakes work; drop to a fast tier for mechanical work.** For fan-out, use fast models for the "finders," a top model for the synthesizer.
- Set the **global default** in `settings.json`; override per project with a project-level `settings.json`.
- Add a **status line** that always shows the active model.

## 7. A repeatable project setup
Every new project gets the same treatment, together, every time: a **folder**, a **project `CLAUDE.md`** (purpose · how to work · status), a **memory entry**, and a **tmux tab**. Keep an in-progress **handoff note** in the project and point the CLAUDE.md "status" at it so a fresh session resumes seamlessly.

## Lessons & gotchas
- **Config loads at session *start*.** Change hooks or the model setting, then **restart** the session — running sessions keep old config. (The #1 "looks broken but isn't.")
- **`/model` changes the *global* default, not just your session.** Pin per-project models with a project-level `settings.json`.
- **`CLAUDE.md` is guidance, not the model switch** — that's the `model` setting / `/model`.
- **Delegate heavy reading to a subagent** — return the conclusion, not the contents. The single biggest anti-drift move.
- **Iterate your signals from real use.** Few, distinct signals beat many similar ones.
- **Verify automations, don't trust them.** Pipe-test hooks; confirm a generated artifact actually rendered.
- **Be honest about tool limits** — propose an alternative instead of a fragile hack.
- **Leave a handoff note before switching context** so the next session resumes instead of re-deriving.
- **Terminal tabs ≠ tmux windows** — start tmux first, *then* the project tabs appear.

## Quick-start checklist
1. Write your standing preferences into `~/.claude/CLAUDE.md`.
2. Keep projects under one parent folder; add a launcher that opens a tmux tab per project (auto-syncing new ones).
3. Add `settings.json` hooks for notifications + tab color-coding; pipe-test them.
4. Set a balance-aware default model + a model status line; pin per-project models via project `settings.json`.
5. Adopt the per-project convention (CLAUDE.md + memory + tab) for every new project.
6. Let memory accumulate — correct Claude once, and it remembers.

## The setup in practice (a high-level portrait)
What a lived-in setup looks like — the shape, not the contents. One tmux session, a handful of projects, all on the same scaffold. Projects fall into a few shapes; the system serves each with no bespoke work:

| Archetype | What it needs | How the setup serves it |
|---|---|---|
| Product / craft work (copy, UX) | Precise, repeatable iteration | Per-project `CLAUDE.md` holds terminology & conventions |
| Strategy & writing | Deep reasoning | Pinned to a top-tier model via project `settings.json` |
| Research & analysis | Breadth, external sources | Subagent fan-out; connectors for source material |
| Personal / fun builds | Fast experimentation | `ideas/` handoff notes; phased builds |
| Learning experiments | Deliberate skill-building | Scoped so each phase exercises one new technique |

Every project is identical underneath: **folder + project `CLAUDE.md` + memory entry + tmux tab** (plus an `ideas/` handoff note when mid-thought). The leverage is the uniformity — nothing to re-learn when you switch, and any thread is glanceable and resumable.
