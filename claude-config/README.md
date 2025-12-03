# Claude Code Configuration

This directory contains template configuration files for Claude Code that will be symlinked to your home directory by the laptop setup script.

## Directory Structure

```
claude-config/
├── README.md                  # This file
├── settings.json              # Global Claude Code settings
├── CLAUDE.md                  # Global memory/preferences
├── MCP-SETUP.md              # MCP server installation guide
├── commands/                  # Custom slash commands
│   ├── test-watch.md
│   ├── deps-check.md
│   ├── project-info.md
│   └── clean.md
└── hooks/                     # Automation hooks
    ├── README.md
    ├── post-edit.sh
    ├── post-write.sh
    └── notification.sh
```

## Installation

The laptop setup script (`./laptop`) automatically:

1. Creates `~/.claude/` directory
2. Symlinks `settings.json` → `~/.claude/settings.json`
3. Symlinks `CLAUDE.md` → `~/.claude/CLAUDE.md`
4. Symlinks `commands/` → `~/.claude/commands/`
5. Symlinks `hooks/` → `~/.claude/hooks/`

This keeps your Claude Code configuration in your dotfiles for version control.

## Setup Steps

### 1. Install Claude Code

```bash
brew install --cask claude-code
```

### 2. Run Laptop Setup Script

```bash
cd ~/Projects/laptop
./laptop
```

This will symlink all Claude Code configuration from dotfiles.

### 3. Make Hooks Executable

```bash
chmod +x ~/.dotfiles/claude/hooks/*.sh
```

### 4. Install MCP Servers

See [MCP-SETUP.md](./MCP-SETUP.md) for detailed instructions:

```bash
claude /mcp
# Search for: excel, postgres, github, playwright
```

### 5. Customize for Your Workflow

Edit files in this directory and they'll be reflected in `~/.claude/` via symlinks.

## What's Included

### Global Settings (`settings.json`)

- **Model**: Sonnet by default
- **Permissions**:
  - Auto-allow: npm test/lint commands
  - Ask: git commits/pushes
  - Deny: rm, sudo commands
- **Hooks**: Auto-formatting, notifications
- **Environment**: NODE_ENV=development

### Global Memory (`CLAUDE.md`)

- General coding principles
- Your development environment (asdf, Neovim, zsh)
- Project types you work on
- Security reminders

### Custom Commands

- `/test-watch` - Run tests in watch mode (detects framework)
- `/deps-check` - Check for outdated dependencies
- `/project-info` - Show project details and common commands
- `/clean` - Clean build artifacts and dependencies

### Hooks

- **post-edit.sh** - Auto-format after edits (Prettier, standardrb, mix format)
- **post-write.sh** - Auto-format new files, make scripts executable
- **notification.sh** - Desktop notification when Claude finishes

## Project-Specific Configuration

For each project, you can create:

```
your-project/
└── .claude/
    ├── settings.json        # Project team settings (committed)
    ├── settings.local.json  # Personal overrides (gitignored)
    ├── CLAUDE.md           # Project-specific guidelines
    ├── commands/           # Project commands
    └── hooks/              # Project-specific hooks
```

Project settings override global settings.

## Customization

### Adding Custom Commands

Create a new markdown file in `commands/`:

```markdown
---
description: Your command description
---

# Command Title

!your shell command here

Explanatory text that Claude will output.
```

### Modifying Hooks

Edit hook scripts in `hooks/`:
- Add formatters for other languages
- Change notification sounds
- Add custom logging

### Adjusting Permissions

Edit `settings.json` to:
- Auto-allow more commands
- Block specific operations
- Add new permission patterns

## Using Claude Code

### Start Session
```bash
cd your-project
claude
```

### Common Commands
- `/model` - Switch AI model
- `/mcp` - Manage MCP servers
- `/permissions` - Review permissions
- `/status` - View configuration
- `/help` - Get help

### Custom Commands
- `/test-watch` - Run tests in watch mode
- `/deps-check` - Check outdated dependencies
- `/project-info` - Show project details
- `/clean` - Clean build artifacts

## Features to Consider

### Shared Prompts
Create reusable prompts in `.claude/prompts/` for common tasks.

### Sub-agents
Define specialized agents in `.claude/agents/` for specific roles:
- Code review agent
- Security review agent
- Documentation agent

### Skills
Create reusable capabilities in `.claude/skills/` that Claude invokes automatically.

### Output Styles
Customize how Claude communicates in `.claude/output-styles/`.

### Plugins
Browse and install community plugins:
```bash
claude /plugin
```

## Troubleshooting

### Hooks Not Running
```bash
# Make hooks executable
chmod +x ~/.claude/hooks/*.sh

# Test hook manually
~/.claude/hooks/post-edit.sh /path/to/file.rb
```

### Symlinks Not Created
```bash
# Re-run laptop script
./laptop

# Or create manually
ln -s ~/.dotfiles/claude/settings.json ~/.claude/settings.json
```

### MCP Servers Not Working
```bash
# Check MCP configuration
claude /mcp

# Review logs in Claude Code
```

## Resources

- **Claude Code Docs**: https://code.claude.com/docs
- **MCP Servers**: https://github.com/modelcontextprotocol/servers
- **Community Plugins**: Use `/plugin` command
- **Your Setup**: [MCP-SETUP.md](./MCP-SETUP.md)

## Maintenance

### Updating Configuration

Since files are symlinked from dotfiles:

1. Edit files in `~/Projects/laptop/claude-config/`
2. Changes immediately reflect in `~/.claude/`
3. Commit changes to version control
4. Pull on other machines and re-run `./laptop`

### Backing Up

Your configuration is backed up in:
- This Git repository
- Your dotfiles repository (if separate)
- Automatically synced across machines

## Next Steps

1. ✅ Run laptop setup script
2. ✅ Make hooks executable
3. ⬜ Install MCP servers (see MCP-SETUP.md)
4. ⬜ Test custom commands
5. ⬜ Customize for your workflow
6. ⬜ Create project-specific .claude/ configs for your projects
