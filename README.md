# Claude Assistant Template

A ready-made workspace where Claude Code works as your assistant for your business, studio, or creative practice: website, content, research, organizing, and day-to-day operations. Claude learns about you through a short onboarding conversation and adapts to how technical you are.

Setup takes about 20 minutes, once per computer.

**New here? Use the step-by-step guide instead: [beatkitchen.github.io/claude-assistant-template](https://beatkitchen.github.io/claude-assistant-template/)**. It has buttons for each step and fills in the commands for you.

---

## What you need

1. **A GitHub account** (free). This is where your work gets backed up. Already have one? Skip ahead.
   - Go to [github.com/signup](https://github.com/signup), enter your email, make a password, and pick a username (you'll type it later, so keep it simple).
   - GitHub emails you a code. Enter it to verify your email.
   - If it asks about plans, choose **Free**. Skip the questions about teams and features.
   - GitHub will ask you to turn on two-factor sign-in. Do it: an authenticator app, a passkey, or text messages all work. Keep the recovery codes somewhere safe.
2. **A Claude account** with a Pro or Max plan, or API credits from [console.anthropic.com](https://console.anthropic.com).
3. **VS Code**: [code.visualstudio.com](https://code.visualstudio.com/). After installing, open it, press `Cmd+Shift+P` (Windows: `Ctrl+Shift+P`), type **Shell Command: Install 'code' command in PATH**, and press Enter (Mac only).
4. **The Claude Code extension** for VS Code: in VS Code, open Extensions, search **Claude Code** (by Anthropic), install.
5. **Git and the GitHub CLI**
   - **Mac:** open Terminal and run `xcode-select --install` (for git), then install [Homebrew](https://brew.sh) and run `brew install gh`.
   - **Windows:** install [Git for Windows](https://git-scm.com/downloads/win) (Claude Code needs it), then run `winget install GitHub.cli` in PowerShell. Use **Git Bash** for the commands below.

---

## Setup (once)

**1. Make your own copy.** Sign in to GitHub, come back to this page, then click the green **Use this template** button → **Create a new repository**. Give it a short name (e.g. `my-studio`) and set it to **Private**.

**2. Sign in and download it.** In Terminal (Windows: Git Bash):
```
gh auth login
cd ~/Documents
gh repo clone YOUR-GITHUB-NAME/YOUR-REPO-NAME
cd YOUR-REPO-NAME
```
For `gh auth login`, choose GitHub.com → HTTPS → Yes → Login with a web browser.

**3. Run the setup script.**
```
bash scripts/setup.sh
```
It turns on the safety checks, connects the GitHub backup, adds a shortcut to your Desktop, and (if you say yes) installs a small guard that catches the most common mistake: opening Claude in the wrong folder.

**4. Start.** Double-click the **workspace shortcut on your Desktop**. VS Code opens your workspace. Click the Claude icon (top right of the editor or the sidebar), sign in if asked, and type:

> Read START_HERE.md and begin onboarding.

Claude interviews you (10–15 minutes), sets the workspace up around your answers, and asks what you want to build first.

---

## Every time after that

Open the **Desktop shortcut**, click the Claude icon, and say what you want to work on. That's it. Claude checks for unsaved work and syncs at the start of every session on its own.

- **Always open the workspace, not plain VS Code.** If Claude starts outside your workspace it can't see your files or instructions, and nothing gets backed up.
- **Claude saves your work as it goes, and asks before backing it up online.** When a permission box about `git push` appears, that's the backup: click Yes.
- **End of a session:** say "save and back up."

---

## What's in here

| File | What it is |
|---|---|
| `START_HERE.md` | Claude's instructions: how sessions start and end, safety rules, onboarding |
| `CLAUDE.md` | A short pointer Claude reads automatically |
| `docs/BUSINESS_CONTEXT.md` | Who you are and what you do, filled in during onboarding |
| `docs/WORKING_WITH_OWNER.md` | How Claude talks to you (created during onboarding, matched to your comfort with tech) |
| `docs/AI_PROSE_STYLE.md` | Keeps anything Claude drafts for you from sounding like AI |
| `docs/CAPABILITIES.md` | Things Claude can offer beyond a website |
| `projects/` | One folder per project, client, or gig |
| `config/` | Passwords and keys. Never uploaded to GitHub; Claude is told never to read them, and the common ways of reading them are blocked |
| `.claude/settings.json` | Lets Claude do safe things without asking, blocks the destructive commands and the common ways of reading `config/`, runs the start-of-session check |
| `scripts/setup.sh` | The one-time setup above. Safe to run again |

---

## If you have a tech partner

If someone set this up for you, they're your tech partner. Claude asks about this during onboarding. When something is outside Claude's reach (accounts, sign-ins, a backup that stopped working), Claude will suggest you check with them rather than walking you through it.

---

## Troubleshooting

| Problem | Fix |
|---|---|
| Claude says it's in the **wrong folder**, or doesn't know who you are | Close that window and open the Desktop shortcut. |
| Claude says it **can't reach GitHub** | Run `bash scripts/setup.sh` again in your folder to sign in again. |
| Claude says "not authorized" | Sign in to Claude (browser login), or set an API key (below). |
| "git-bash required" (Windows) | Install [Git for Windows](https://git-scm.com/downloads/win), restart VS Code. |
| Browser sign-in loops (Windows) | Create a key at [console.anthropic.com/settings/keys](https://console.anthropic.com/settings/keys). Windows Settings → System → About → Advanced system settings → Environment Variables → New user variable `ANTHROPIC_API_KEY` = your key. Fully quit and reopen VS Code. |
| Stuck | Describe what happened to Claude, or ask your tech partner. |

---

## License

MIT
