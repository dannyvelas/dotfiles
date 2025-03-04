---
title: "${1:`(replace-regexp-in-string "-" " " (file-name-nondirectory (file-name-sans-extension (buffer-file-name))))`}"
date: `(format-time-string "%Y-%m-%d")`
publish: ${2:false}
---
Tags: [[$3]]

$0
