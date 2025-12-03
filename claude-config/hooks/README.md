# Claude Code Hooks

This directory contains example hooks for Claude Code. Hooks are shell scripts that run at specific points in Claude's lifecycle.

## Available Hooks

### post-edit.sh
Runs after Claude edits a file. Auto-formats based on file type:
- JavaScript/TypeScript: Prettier
- Ruby: standardrb
- Elixir: mix format

### post-write.sh
Runs after Claude writes a new file. Makes shell scripts executable and auto-formats like post-edit.

### notification.sh
Runs when Claude finishes responding. Sends a desktop notification on macOS.

## Setup

1. Make hooks executable:
```bash
chmod +x ~/.dotfiles/claude/hooks/*.sh
```

2. Hooks are referenced in `settings.json` and will be symlinked by the laptop setup script.

## Customization

Edit these hooks to match your preferences:
- Add/remove formatters
- Change notification sounds
- Add logging or custom behavior

## Hook Types Available

- `PreToolUse` - Before tool execution (can block)
- `PostToolUse` - After tool execution
- `UserPromptSubmit` - When you submit a prompt
- `Stop` - When Claude finishes
- `SessionStart`/`SessionEnd` - Session lifecycle
- `Notification` - When Claude sends notifications

See Claude Code documentation for full details.
