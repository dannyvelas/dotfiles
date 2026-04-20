$ARGUMENTS

The input above is a topic. Search the vault at ~/RemoteGit/MyGithub/notes for notes related to it, then identify thoughts or conclusions that appear multiple times — possibly in different words, months or years apart — without the notes explicitly acknowledging each other.

## Step 1 — Gather candidates

Run `obsidian search:context query="<topic>"` to find notes that mention the topic. Try 2-3 close variants (synonyms, related phrasings) to avoid missing notes that use different vocabulary.

List all candidate files with their `date` frontmatter fields.

## Step 2 — Read and extract core claims

Read each candidate note. For each one, extract:
- The **central claim or conclusion** — the one-sentence distillation of what the note is ultimately arguing or asserting. Not the topic, not the supporting reasoning, but the bottom-line point.
- A **representative quote** — the sentence or two in the note that most directly states that claim.

If a note contains multiple distinct claims, extract one per claim.

## Step 3 — Group by semantic similarity

Group the extracted claims by meaning, not by wording. Two claims belong in the same group if a reader would say "these are the same point" even if the phrasing is entirely different.

Do not group claims that are merely related or on the same topic. Only group claims that are making the *same assertion*.

Assign each group a short neutral label (e.g., "passion-as-job kills the passion").

## Step 4 — Filter for recurrence

Keep only groups with two or more claims. Discard singletons.

For each surviving group, sort its entries chronologically by the note's `date` field.

## Step 5 — Report

For each recurring thought, write a block like this:

---

**[Group label]**

Appeared [N] times across [date range].

| Date | Note | Quote |
|------|------|-------|
| YYYY-MM-DD | note-title.md | "..." |
| YYYY-MM-DD | note-title.md | "..." |

*[One sentence observing the pattern — e.g., how the framing shifted across appearances, or that the wording changed while the conclusion stayed identical.]*

---

After all groups, add a short closing section:

**What this suggests** — a brief synthesis of which thoughts seem most "sticky" (recurring most often or across the widest time range), and whether any of them have evolved in substance or only in expression.

## Style rules

- Quotes must be verbatim from the notes. Do not paraphrase.
- The group label should describe the *claim*, not the topic. "Passion-as-job kills the passion" is a claim. "Job passion" is a topic.
- If two notes acknowledge each other via wikilinks, note that in the observation line — it means the recurrence was conscious, not déjà vu.
- No filler. No "it is interesting to note that." Be direct.
