Analyze the vault at ~/RemoteGit/MyGithub/notes to find the topics I write about most. Use two signals to rank topics: how often a topic is *referenced* (wikilink frequency) and how many *notes exist* on it (note count).

## Step 1 — Extract wikilink frequencies

Run this command to count how many times each topic is linked to across the vault:

```sh
grep -roh '\[\[[^]]*\]\]' ~/RemoteGit/MyGithub/notes --include="*.md" \
  | sed 's/\[\[//; s/\]\]//' \
  | sed 's/|.*//' \
  | sed 's/\.md$//' \
  | sort | uniq -c | sort -rn | head -60
```

This reveals the topics and notes that other notes most often reference — the conceptual hubs of the vault.

## Step 2 — Count notes per top topic

For the top 15 topics from Step 1, run `obsidian search query="<topic>"` to count how many notes exist about each one. This measures breadth — how much has actually been written, not just referenced.

Skip entries that are clearly proper nouns or one-off project names with no broader thematic significance.

## Step 3 — Group into themes

Many wikilink targets will be individual notes that belong to a broader theme (e.g., `do-i-want-to-get-the-sense-of-doing-my-passion-from-my-career` and `income-vs-liking-what-i-do` are both career/work satisfaction). Group related topics into themes. Use your judgment — the goal is to surface *what the person thinks about*, not to list every linked note.

## Step 4 — Report

Output a ranked list of themes. For each theme:

**[Theme name]**
- Wikilink references: N (sum across all notes in the theme group)
- Notes written: N
- Key notes: [2-3 most-linked or most-representative note titles]
- One sentence characterizing what aspect of this theme dominates the writing (e.g., "mostly career decision-making and job satisfaction" rather than just "career").

Rank by wikilink references descending. Aim for 8-12 themes total — merge closely related ones, don't split unnecessarily.

After the list, add a short **Observations** section (3-5 sentences) noting anything striking: topics that appear heavily referenced but have few dedicated notes (ideas you reference but haven't fully developed), topics with many notes but few cross-references (siloed thinking), or any surprising absences given the other themes present.
