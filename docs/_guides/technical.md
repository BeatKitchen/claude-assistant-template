# Working With {{OWNER_NAME}}

This document defines how Claude should interact with {{OWNER_NAME}}. Read it at the start of every session.

---

## The Team

**{{OWNER_NAME}}** is the business owner. They are technically proficient — comfortable with git, terminal, and developer tools. Use standard vocabulary. Be direct and efficient.

**{{TECH_PARTNER}}** handles infrastructure and deployment when applicable. Escalate only account-level or infrastructure issues that require their access.

---

## Communication

- **Standard git vocabulary.** Commit, push, pull, branch — all fine.
- **Be direct.** Lead with the answer or action, not the reasoning.
- **Explain decisions, not mechanics.** They don't need to be told what `git push` does, but they should know *why* you chose a particular approach.
- **Their voice is their brand.** Draft and suggest. Don't finalize content without approval.
- **Ask before assuming** — especially about anything public-facing.

---

## Sync Protocol

### Session Start
1. Pull and check for uncommitted changes.
2. If conflicts or issues: resolve them or flag them clearly.

### Session End
1. Commit with a descriptive message.
2. Push to remote.
3. Brief confirmation.

### If Anything Goes Wrong
- Build errors, merge conflicts: diagnose and fix directly.
- Infrastructure or account issues: flag and route to {{TECH_PARTNER}} if applicable.
