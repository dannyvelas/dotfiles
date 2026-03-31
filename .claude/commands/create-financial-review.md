$ARGUMENTS

Create a personal finance review document for the client described above or in the recent conversation. Follow every rule below exactly. Do not deviate from the structure or style rules.

---

## Output

Write the document as a markdown file and save it. Use this frontmatter:

```
---
title: "Personal Finance Review: [period]"
date: [today's date]
publish: false
---
Tags: [[personal-finance]]
```

---

## Section order

Include all applicable sections in this exact order. Omit a section only if the data does not exist (e.g., no rental property).

1. Financial Profile
2. Profit and Loss
3. 50/30/20 Breakdown
4. Wants Breakdown (if category data is available)
5. Needs Breakdown (if category data is available)
6. Rental Property Breakdown (if applicable)
7. What Is Working
8. Recommendations
9. Deep-dive sections (if needed for complex topics referenced in Recommendations)
10. Decision analysis sections (if needed for multi-variable decisions referenced in Recommendations)

---

## Core structural rule

This is the most important rule. Every piece of content belongs in exactly one type of section:

- **Facts sections** (Financial Profile, P&L, 50/30/20, Wants/Needs Breakdown, Rental Property Breakdown): facts and neutral observations only. No judgments. No recommendations. No language implying something is good or bad.
- **What Is Working**: analysis of what is positive. No recommendations.
- **Recommendations**: analysis of what could be improved. No raw facts that belong in facts sections.
- **Deep-dive / decision sections**: extended explanation of complex topics that would bloat Recommendations if included inline. Recommendations should reference these sections with "See the [section] below for full detail."

---

## Financial Profile

Include in this order:
- Employment status, pay frequency, debt status
- HYSA or savings account balance
- Income sources table (Source | Annual)
- One sentence per income source that bypasses checking (e.g., RSUs going to brokerage, 401k pre-deductions) explaining why it does not appear in the P&L
- Expense category overview: one sentence listing what falls under Needs, one sentence listing what falls under Wants
- 401k contribution details and why contributions do not appear in P&L
- Any savings automations (amount, frequency, any exceptions)
- Investment accounts outside the 401k (balances and holdings)
- One sentence noting the existence of any LLC, side business, or rental property (details go in later sections)

---

## Profit and Loss

- Monthly table: Month | Total Income | Total Outflow | Profit or Loss | Total Needs Outflow | Disposable Income
- Disposable Income = Total Income - Total Needs Outflow (this equals wants spending plus any savings transfers that month)
- After the table: 2-3 sentences identifying outlier months and the reason for each outlier
- After that: 2-3 sentences on overall patterns (how many months ran a deficit, what drove the needs total, how to interpret the percentage vs. gross income)

---

## 50/30/20 Breakdown

The 50/30/20 rule uses after-tax income. The correct denominator is:

> cash through checking (P&L income total) + RSU net proceeds to brokerage + 401k contributions

This adds back savings that bypassed checking so all three buckets sum to 100%.

Targets: Needs 50%, Wants 30%, Savings 20%.

Show two tables:
1. Savings by vehicle (Vehicle | Annual)
2. 50/30/20 comparison (Category | Target | Actual | Amount)

No interpretation in this section — facts only.

---

## Wants Breakdown / Needs Breakdown

- Table: Category | Annual net | Monthly avg
- Annual net = total outflow minus total inflow for the category across the period
- Sort by annual net descending
- One neutral descriptive sentence after the table (e.g., which categories are largest, whether any spike in specific months)
- No recommendations, no judgments, no language implying something should change

---

## Rental Property Breakdown

- Monthly income, outflow breakdown, and net cash-flow deficit or surplus
- Bold the monthly deficit/surplus figure
- Description of any informal family arrangements: transfer amount, repayment status, remaining balance, payoff timeline at current rate
- Facts only

---

## What Is Working

Paragraph-per-point format (not bullet points). Each paragraph covers one positive observation. Consider:
- Debt situation (consumer debt, credit card payoff habits)
- Emergency fund health (months of expenses covered, whether it has ever been drawn down)
- Income diversity (number of sources, resilience to losing one)
- Savings rate (reference 50/30/20 figures — keep interpretation here, not in that section)
- Retirement savings progress (total retirement assets, age context, accessibility of Roth contributions)
- Property equity building (if applicable)
- Any other genuine positives specific to this client

---

## Recommendations

Format for each item:

> **[N] Action title.** Explanation in 1-4 sentences. For complex topics, end with: "See the [section name] section below for full detail."

Priority scoring:
- 9–10: High impact, act immediately
- 7–8: Important, act within the year
- 5–6: Moderate value, not urgent
- 3–4: Minor benefit, low urgency
- 1–2: Very minor or largely optional

Items must be listed in descending priority order. If two items share the same score, list the more actionable one first.

Do not include raw data or extended analysis inline — move that to a deep-dive section and reference it.

---

## Deep-dive and decision sections

Use these for topics that require more than 4 sentences of explanation (e.g., LLC transfer mechanics, Roth vs. brokerage tradeoffs, property purchase analysis).

Each should have a clear title (e.g., "## Transferring the Property to an LLC") and subsections as needed. Write in the same factual, analytical tone as the rest of the document.

---

## Writing style

- **Voice**: third-person throughout. No "I", "you", "we", or "your".
- **Em dashes**: do not use em dashes (—) in prose. Use a comma, semicolon, or restructure the sentence.
- **Tone**: formal, analytical. No hedging filler phrases ("it is worth noting that", "it is important to remember that").
- **Numbers**: use ~ for approximations; commas in thousands ($1,234); bold totals in tables.
- **Bullet points**: only in tables or structured lists (e.g., recommendation items). Not in narrative paragraphs.
- **Emojis**: none.

---

## Self-review before returning

After writing the document, re-read it top to bottom and verify:

1. Every section is in the correct order
2. No facts section contains analysis or recommendations
3. No analysis section contains raw facts that belong in a facts section
4. Every term, entity, or concept is introduced before its first use
5. Nothing is repeated unnecessarily across sections
6. All recommendations are ordered by priority score
7. Any complex topic referenced in Recommendations has a corresponding deep-dive section
8. The document reads as a single coherent piece from start to finish

Fix any issues found before returning.
