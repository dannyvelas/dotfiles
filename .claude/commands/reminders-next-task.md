The user runs their macOS Reminders app like Jira: each **list** is a project, each **reminder** in it is a ticket with a priority and a note acting as the description, and each list is a long backlog of tickets.

Your goal is to surface a short, ranked list of candidate reminders (tasks) worth working on right now, sized to fit a single ~1 hour work session. Check these three lists: "Fun Coding", "Fun non-coding", "Useful coding ideas". These are the lists that the user actually treats as a backlog of personal projects, as opposed to chores/errands lists

## Background on how to query Reminders

- The `reminders` CLI (`/opt/homebrew/bin/reminders`, keith/reminders-cli) reads the macOS Reminders app. Run `reminders show-lists` first to get the exact current list names. Always resolve against `show-lists` before querying rather than guessing.
- Pull each list with `reminders show "<list name>" --format json`. Useful fields: `title`, `notes`, `priority`.
- EventKit's `priority` field maps to the exclamation-mark scheme the user thinks in:
  - `1` → `!!!` (high interest — wants to do this soon)
  - `5` → `!!` (medium interest)
  - `9` → `!` (low interest)
  - `0` → no priority set at all — this means the user probably isn't committed to doing it (candidate for eventual `#WONTDO`). Exclude these from recommendations.
- If `notes` contains `// #WONTDO`, the user has explicitly decided not to do it — it's an artifact of round-tripping through the "Good Task" app. Always exclude these, never recommend them.
- Other inline tags in notes (e.g. `// #Homelab`, `// #Doing`) are just the user's own categorization, not filtering signals — but surface them in your rationale when relevant (`#Doing` means it's an active project already underway, not a fresh start).

## Step 1 — Fetch and resolve lists

Run `reminders show-lists`, match the three list names above against the real names, then fetch each with `reminders show "<list>" --format json`.

## Step 2 — Filter

Drop any reminder where:
- `notes` contains `#WONTDO`, or
- `priority` is `0`.

## Step 3 — Estimate effort and rank

There's no time-estimate metadata on reminders, so use judgment based on the title/notes:
- Prefer tasks scopeable to the time budget — ideally 30 min–3 hrs, hard ceiling 6 hrs. Never recommend something that's really a multi-week epic as-is (e.g. "set up a k8s cluster", "make a game boy emulator", "build a laptop"). For a big idea like that, either skip it or reframe it as a small bounded *first session* (e.g. "spend an hour reading the docs and writing a plan") instead of the whole thing.
- Rank primarily by priority tier (`!!!` > `!!` > `!`); use estimated time as the tiebreaker when priority ties, favoring shorter tasks.

## Step 4 — Report

Group the output into buckets rather than one flat list, e.g.:
- **Quick wins** (~15–45 min, usually `!!!`)
- **Solid ~1hr sessions**
- **Bigger builds, if you want to actually make something** (1–3 hrs)
- Anything ambiguous (already marked `#Doing`, needs other people/equipment, etc.) — flag separately rather than mixing it in.

For each candidate, give one line: priority stars, source list, and a short reason it's scoped well for the time budget.
