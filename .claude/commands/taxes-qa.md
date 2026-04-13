doc: /Users/dannyvelasquez/RemoteGit/MyGithub/notes/taxes.md
context: A personal tax reference built iteratively during a filing session. The goal is that next year, the user can read it instead of asking the same questions again. Write for a reader who already understands personal finance basics.

$ARGUMENTS

Answer the question above. Then update the document at the path specified above to include the new information.

Rules for updating the document:
- Read the current document before editing so you have the full picture.
- Integrate the new Q&A into the best-fitting section. If no section fits, create one.
- Refactor section titles, order, and grouping as needed so the document reads as a coherent reference — not a log of questions in the order they were asked.
- Do not use em dashes, line breaks for stylistic effect, or emojis in prose. These are AI writing tells.
- Keep entries concise and direct. Write for a reader who already understands personal finance basics.
- The document should always look as if it is complete and ready to be read — treat every update as if it might be the last one.

After updating the document, commit the changes using a conventional commit message. The message should:
- Start with the appropriate type prefix (feat, fix, docs, refactor, chore, etc.)
- Include a concise subject line under 72 characters
- Include a short body if the change warrants explanation beyond the subject line
- End with a Co-Authored-By line: Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>

Stage only the files that were modified as part of the task, then commit using this exact shell pattern:

```sh
git commit "<subject line>

<body>

Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>" <files> -m
```
