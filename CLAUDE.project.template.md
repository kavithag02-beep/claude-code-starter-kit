# <Project name>

<One or two lines: what this project is and its goal.>

## How to work here
- <Stack, do's and don'ts, tone; anything Claude should always/never do.>

## Conventions
- <Project-specific rules Claude should follow: terminology, naming, output format.>

## Status
<Current state. If mid-task, point to a handoff note (e.g. `ideas/notes.md`) so a fresh session resumes cleanly instead of re-deriving context.>

## Tech
<Stack + setup steps, once chosen.>

---
<!-- EXAMPLE — delete everything below when you start your own. Shows the kinds of
     conventions worth capturing. It's a fictional project; no real data. -->

# Recipe Finder (web app)

Suggests recipes from ingredients a user already has. Goal: fast, friendly, mobile-first.

## How to work here
- Stack: React + Vite + TypeScript, Tailwind. No new dependencies without asking.
- Keep components small and typed; colocate tests next to components.
- Don't touch `src/legacy/` — it's being deprecated.

## Conventions
- Say "recipe," never "dish." User-facing copy is friendly and second-person.
- API responses are camelCase; DB columns are snake_case — map at the boundary.
- Errors surface as toasts, never blocking modals.

## Status
MVP shipped. Adding dietary filters — design + open questions in `ideas/dietary-filters.md`. Resume there.

## Tech
`npm install` → `npm run dev` (localhost:5173). Tests: `npm test`.
