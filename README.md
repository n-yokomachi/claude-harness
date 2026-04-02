# claude-craft
A symlink-based harness that extends Claude Code with custom skills, dotfiles, and terminal environment.

<img width="960" height="492" alt="スクリーンショット 2026-03-30 14 27 13" src="https://github.com/user-attachments/assets/3a3c9bc5-3480-49ba-9875-db97ae4ed0a6" />


## Quick Start

```bash
git clone https://github.com/n-yokomachi/claude-craft.git && cd claude-craft

/harness-init     # Deploy Claude Code config
/terminal-init    # Set up terminal environment
```

## Structure

```
dotfiles/
├── CLAUDE.md               # Global instructions
├── settings.json           # Claude Code settings
├── statusline-command.sh   # Status line (TokyoNight)
├── ghostty/config          # Ghostty
├── tmux.conf               # tmux
├── yazi/yazi.toml          # yazi
└── lazygit/config.yml      # lazygit

skills/
├── briefing/               # Morning briefing (calendar, email, weather)
├── calendar/               # Google Calendar
└── email-check/            # Gmail
```

All files are symlinked — `git pull` updates everything.
