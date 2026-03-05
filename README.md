# Claude Assistant Template

A starter kit for setting up a Claude Code-powered business assistant. Clone this repo, open it in VS Code, and Claude handles the rest.

---

## What You Get

A personal workspace where Claude Code acts as your business assistant — helping with content, research, website building, strategy, and daily operations. Claude learns about your business through a structured onboarding conversation and adapts to your communication style.

---

## Prerequisites

You need three things installed:

1. **VS Code** — [Download here](https://code.visualstudio.com/)
2. **Claude Code extension** — Install from the VS Code extensions marketplace (search "Claude Code" by Anthropic)
3. **Git** — Usually pre-installed on Mac. On Windows, install [Git for Windows](https://git-scm.com/downloads/win)

### Authentication

Claude Code needs an Anthropic account. You can either:
- **Claude Pro/Max subscription** ($20+/month) — authenticate through the browser when prompted
- **API credits** (pay-as-you-go) — add credits at [console.anthropic.com](https://console.anthropic.com), then authenticate when prompted

### Windows Users

Claude Code on Windows requires **Git for Windows** (specifically git-bash). If you see an error about git-bash after installing the extension, install Git for Windows from the link above.

**If browser authentication loops without connecting:** This is a known issue on some Windows setups. Workaround: create an API key at [console.anthropic.com/settings/keys](https://console.anthropic.com/settings/keys), then set it as an environment variable:
1. Open Windows Settings → System → About → Advanced system settings → Environment Variables
2. Under "User variables," click New
3. Variable name: `ANTHROPIC_API_KEY`
4. Variable value: paste your API key
5. Click OK, then **restart VS Code completely** (close all windows first)

---

## Getting Started

### Step 1: Create your own copy

Click the green **"Use this template"** button at the top of this GitHub page, then **"Create a new repository."** Give it a name that makes sense for your business (e.g., `my-consulting`, `studio-ops`). You can make it private.

### Step 2: Clone it to your computer

Open a terminal (Mac: Terminal app; Windows: Git Bash) and run:
```
git clone https://github.com/YOUR-USERNAME/YOUR-REPO-NAME.git
```
Replace `YOUR-USERNAME` and `YOUR-REPO-NAME` with your actual values from Step 1.

### Step 3: Open in VS Code

```
code YOUR-REPO-NAME
```
Or open VS Code manually and use File → Open Folder.

### Step 4: Start Claude

Open the Claude Code panel (look for the Claude icon in the VS Code sidebar). Once authenticated, tell Claude:

> Read START_HERE.md and begin onboarding.

Claude will start a conversation to learn about you and your business. Answer naturally — there are no wrong answers.

---

## What Happens Next

Claude will:
1. **Interview you** about your business (10-15 minutes)
2. **Set up your workspace** based on your answers
3. **Ask what you want to build** — a website, a research hub, a content platform, or just a documentation workspace
4. **Start building** with your input at every step

Everything Claude creates is saved in this repository. You can always pick up where you left off in a new session.

---

## If You Have a Technical Partner

If someone else (a friend, colleague, family member) set this up for you, they're your "technical partner." Claude will ask about this during onboarding. When something goes wrong that's outside Claude's control (account issues, infrastructure problems), Claude will suggest reaching out to them instead of walking you through complex technical steps.

---

## Troubleshooting

| Problem | Solution |
|---------|----------|
| Claude says "not authorized" | Make sure you've authenticated — either through browser login or API key (see Authentication above) |
| VS Code says "git-bash required" (Windows) | Install [Git for Windows](https://git-scm.com/downloads/win), then restart VS Code |
| Browser auth loops on Windows | Use the API key workaround described in the Windows section above |
| Claude doesn't seem to know about your business | Tell Claude: "Read START_HERE.md" — it may not have loaded the context yet |
| Something broke and you're stuck | If you have a technical partner, reach out to them. Otherwise, describe what happened to Claude and ask for help |

---

## License

MIT
