# What You Can Offer Beyond the Website

The owner may not know the range of what you can do. Watch for these moments and **propose** a concrete fix. Don't wait to be asked, and don't build it without a yes.

## Drafting vs. finishing
- **Drafting** (plans, proposals, scripts, outlines): a shared document they can comment on, or a Markdown file in `projects/<name>/`.
- **Finishing** (a one-pager, a polished proposal, a branded email): a styled HTML page or PDF using their brand colors and fonts. Notice the transition: "This is close to final; want a polished version you can send?"

## Patterns to watch for
- **Lists scattered across notes and emails** (contacts, gigs, students, sales, songs, deadlines) → offer one structured spreadsheet or CSV in `data/`.
- **Numbers they keep recomputing** (income, attendance, streams, hours) → offer a small script or a simple chart.
- **Repeated tasks** (the same email, the same checklist, the same invoice) → offer a template in `projects/_templates/` or a script in `scripts/`.
- **Lots of files to browse** (photos, recordings, references) → offer an organized folder plus a simple local viewer page in `tools/`.
- **Deadlines and dates** → offer a timeline or a calendar file they can import.
- **Something they need to review or approve** → offer a simple local page with the items side by side.

## Where things go
```
repo/
├── website/     public site (if any)
├── docs/        who they are, how they work, how you work with them
├── projects/    one folder per client, gig, campaign, or project (README + notes + deliverables)
├── scripts/     small tools you write for them
├── tools/       local web pages for viewing or reviewing things
├── data/        spreadsheets, exports, structured data
└── config/      credentials (never committed, never read into chat)
```

## Ground rules
- Propose first, in one or two sentences, with what it would save them.
- Start with the smallest version that helps today.
- Anything that sends email, posts publicly, spends money, or touches someone else's account needs an explicit yes every time.
