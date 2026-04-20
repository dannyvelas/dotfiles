$ARGUMENTS

The input above is a topic to trace through the vault at ~/RemoteGit/MyGithub/notes.

Your goal is to build a picture of how this idea has evolved: when it first appeared, where it lives now, and what it connects to.

## Step 1 — Find all mentions

Run `obsidian search:context query="<topic>"` to find every note that mentions the topic. Also try close variants (singular/plural, abbreviations) if the first search returns few results.

List the matching files.

## Step 2 — Date each note from frontmatter

For each file found in Step 1, read its frontmatter and extract the `date` field. Sort the results chronologically — this gives you the timeline of when each note entered the vault.

If a file has no `date` field (rare; mostly scratch files in `temporary/`), skip it for timeline purposes unless it seems central to the topic.

## Step 3 — Map connections

For each note identified in Steps 1 and 2, run:
- `obsidian backlinks file=<name>` — what links to it
- `obsidian links file=<name>` — what it links out to
- `obsidian tags file=<name>` — what tags it carries

## Step 4 — Read key notes

Read the notes most central to the topic (highest backlink count or earliest appearance) to understand the substance, not just the structure.

## Step 5 — Synthesize and report

Write a report with these sections:

**Origin** — When the topic first appeared in the vault and in what context. Quote the earliest relevant line if illuminating.

**Evolution** — How the idea developed over time. Note any shifts in framing, scope, or detail across different notes and dates.

**Current state** — Which notes are the primary home for this topic today, and what the most recent thinking says.

**Connection map** — What the topic links to (outgoing) and what links back to it (incoming). Highlight any clusters or surprising connections.

Keep the report direct and specific. No filler. Reference note titles and dates as anchors so the output is navigable.
