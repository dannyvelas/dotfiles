$ARGUMENTS

After completing the above task, commit the changes using a conventional commit message. The message should:
- Start with the appropriate type prefix (feat, fix, docs, refactor, chore, etc.)
- Include a concise subject line under 72 characters
- Include a short body if the change warrants explanation beyond the subject line
- End with a Co-Authored-By line: Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>

Stage only the files that were modified as part of the task, then commit using this exact shell pattern:

```sh
MSG=$(cat <<'EOF'
<subject line>

<body>

Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>
EOF
)
git commit <files> -m "$(echo "$MSG" | sed 's/[[:space:]]*$//')"
```

The `sed` strips trailing whitespace from each line, preventing blank lines that contain only spaces from ending up in the commit message.
