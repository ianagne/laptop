# Claude Code Features & Recommendations

Based on your multi-language development workflow (Rails, Next.js, Elixir/Phoenix), here are recommended features and settings to enhance your Claude Code experience.

## Recommended Plugins

Claude Code supports plugins that extend functionality. Browse available plugins:

```bash
claude /plugin
```

### Suggested Plugin Categories

1. **Testing Plugins** - Enhanced test generation and running
2. **Documentation Plugins** - Auto-generate docs from code
3. **Code Review Plugins** - Automated PR review assistance
4. **Database Plugins** - Database schema management

### Installing Plugins

```bash
/plugin                           # Browse marketplace
/plugin install plugin-name       # Install specific plugin
```

Installed plugins are listed in `settings.json` and auto-load.

## Features You Should Know About

### 1. Memory System (CLAUDE.md)

**What it is**: Persistent instructions across sessions

**Already configured**:
- Global: `~/.claude/CLAUDE.md` (your preferences)
- Project: `.claude/CLAUDE.md` (per-project guidelines)

**Recommended use**:
- Global: Universal preferences, tools, environment
- Rails projects: Rails conventions, RSpec patterns, gem preferences
- Next.js projects: React patterns, TypeScript rules, testing approach
- Phoenix projects: Elixir idioms, Phoenix conventions, testing style

**Example Rails project `.claude/CLAUDE.md`**:
```markdown
# Rails Project Standards

## Conventions
- RESTful routing
- Fat models, skinny controllers
- Use service objects for complex logic
- Background jobs with Sidekiq

## Testing
- RSpec for all tests
- FactoryBot for fixtures
- 90%+ coverage required
- Run: bundle exec rspec

## Gems We Use
- Devise for authentication
- Pundit for authorization
- Paper Trail for auditing
```

### 2. Custom Slash Commands

**Already included**: 4 multi-language commands

**Recommendations for additional commands**:

**Rails-specific** (create in Rails project `.claude/commands/`):
- `/migrate` - Run pending migrations
- `/console` - Helpful Rails console snippets
- `/routes` - Show/search routes

**Next.js-specific**:
- `/dev` - Start dev server with logging
- `/build-analyze` - Build and analyze bundle
- `/storybook` - Start Storybook

**Phoenix-specific**:
- `/migrate` - Run Ecto migrations
- `/seed` - Reset and seed database
- `/routes` - Show Phoenix routes

### 3. Sub-Agents

**What they are**: Specialized AI assistants for specific tasks

**Recommended agents to create**:

#### Code Review Agent (`.claude/agents/code-review.md`)
```markdown
---
name: code-reviewer
description: Reviews code for quality, security, and best practices
model: sonnet
allowed-tools:
  - Read
  - Grep
  - Bash
---

You are an expert code reviewer. Review changes for:
- Code quality and maintainability
- Security vulnerabilities
- Performance issues
- Test coverage
- Framework best practices
```

#### Security Review Agent (`.claude/agents/security.md`)
```markdown
---
name: security-review
description: Security-focused code review
model: opus
---

Focus on security issues:
- SQL injection vulnerabilities
- XSS vulnerabilities
- Authentication/authorization issues
- Exposed secrets or API keys
- Dependency vulnerabilities
```

**Usage**:
Claude automatically delegates to these agents when appropriate, or you can invoke them explicitly.

### 4. Permissions

**Already configured**: Sensible defaults

**Consider adding**:

```json
{
  "permissions": [
    {
      "pattern": "Bash(bundle exec rspec:*)",
      "action": "allow",
      "comment": "Auto-allow RSpec"
    },
    {
      "pattern": "Bash(mix test:*)",
      "action": "allow",
      "comment": "Auto-allow Elixir tests"
    },
    {
      "pattern": "EditFile(/config/database.yml)",
      "action": "deny",
      "comment": "Protect database config"
    },
    {
      "pattern": "EditFile(/.env*)",
      "action": "deny",
      "comment": "Protect environment files"
    }
  ]
}
```

### 5. Hooks

**Already configured**: Auto-formatting and notifications

**Additional hooks to consider**:

#### Git Pre-commit Hook (`.claude/hooks/pre-git-commit.sh`)
```bash
#!/bin/bash
# Warn if committing to main/master
BRANCH=$(git branch --show-current)
if [[ "$BRANCH" == "main" || "$BRANCH" == "master" ]]; then
  exit 1  # Block the commit
fi
```

#### Logging Hook (`.claude/hooks/logger.sh`)
```bash
#!/bin/bash
# Log all prompts for tracking
echo "[$(date)] $1" >> ~/.claude-history.log
```

### 6. Output Styles

**What it is**: Customize how Claude communicates

**Available styles**:
- `default` - Standard software engineering
- `explanatory` - Educational with explanations
- `learning` - Collaborative with `TODO(human)` markers

**Switch styles**:
```bash
/output-style explanatory     # More educational
/output-style learning        # Collaborative mode
```

**Create custom styles** in `.claude/output-styles/`.

### 7. GitHub Integration

**Built-in features**:
- `/install-github-app` - Set up GitHub Actions integration
- Claude can create PRs with proper summaries
- Responds to GitHub comments on PRs

**Recommended setup**:
1. Install GitHub App: `claude /install-github-app`
2. Add `ANTHROPIC_API_KEY` to repo secrets
3. Enable for CI/CD workflows

### 8. MCP Servers

**Requested**: Excel, Postgres, GitHub, Playwright

**Additional recommended MCP servers**:

- **Filesystem** - Enhanced file operations
- **Git** - Advanced git operations
- **Memory/Notes** - Persistent notes system
- **Slack** (if you use it) - Slack integration
- **Docker** - Container management

**Installation**: See [MCP-SETUP.md](./MCP-SETUP.md)

### 9. Model Selection

**Already configured**: Sonnet (good default)

**When to switch**:
- `/model opus` - Complex refactoring, architecture decisions
- `/model haiku` - Quick tasks, simple edits
- `/model sonnet[1m]` - Very large codebases

**Per-agent models**: Configure different models for different agents in agent definitions.

### 10. Environment Variables

**Already configured**: `NODE_ENV=development`

**Consider adding**:
```json
{
  "environment": {
    "NODE_ENV": "development",
    "RAILS_ENV": "development",
    "MIX_ENV": "dev",
    "EDITOR": "nvim"
  }
}
```

## Project-Specific Configuration Recommendations

### For Each Rails Project

Create `.claude/CLAUDE.md`:
```markdown
# [Project Name] - Rails Application

## Architecture
- Rails 7.x application
- PostgreSQL database
- Sidekiq for background jobs
- Action Cable for WebSockets

## Key Conventions
[Your team's Rails conventions]

## Testing
- RSpec with FactoryBot
- Run: bundle exec rspec
- Coverage required: 90%

## Common Commands
- `rails db:migrate` - Run migrations
- `rails db:seed` - Seed database
- `rails routes | grep pattern` - Find routes
```

### For Each Next.js Project

Create `.claude/CLAUDE.md`:
```markdown
# [Project Name] - Next.js Application

## Stack
- Next.js 14 with App Router
- TypeScript strict mode
- Tailwind CSS
- React Testing Library

## Conventions
[Your React/Next.js conventions]

## Testing
- Jest + React Testing Library
- Run: npm test
- E2E: Playwright

## File Structure
- `app/` - App router pages
- `components/` - React components
- `lib/` - Utilities
```

### For Each Phoenix Project

Create `.claude/CLAUDE.md`:
```markdown
# [Project Name] - Phoenix Application

## Stack
- Phoenix 1.7
- Elixir 1.15+
- PostgreSQL
- LiveView

## Conventions
[Your Elixir/Phoenix conventions]

## Testing
- ExUnit
- Run: mix test
- Coverage: mix test --cover

## Common Tasks
- `mix ecto.migrate` - Run migrations
- `mix phx.routes` - Show routes
- `iex -S mix phx.server` - Interactive console
```

## Workflow Enhancements

### 1. Pre-commit Integration

Add `.claude/hooks/pre-commit.sh`:
```bash
#!/bin/bash
# Run before git commits
# Add linting, tests, or other checks
```

### 2. Project Templates

For new projects, create starter `.claude/` directories:
```
~/templates/
├── rails-claude/
│   └── .claude/
├── nextjs-claude/
│   └── .claude/
└── phoenix-claude/
    └── .claude/
```

Copy to new projects for instant Claude Code setup.

### 3. Team Collaboration

**Commit to git**:
- `.claude/settings.json` - Team settings
- `.claude/CLAUDE.md` - Project guidelines
- `.claude/commands/` - Shared commands
- `.claude/agents/` - Team agents

**Don't commit**:
- `.claude/settings.local.json` - Personal overrides
- `.claude/CLAUDE.local.md` - Personal notes

### 4. Continuous Improvement

**Track what works**:
- Which commands you use most
- Which hooks save time
- Permission patterns that reduce friction

**Iterate**:
- Add commands for repeated tasks
- Refine CLAUDE.md based on common corrections
- Share successful patterns across projects

## Advanced Features

### 1. Skills System

**What it is**: Reusable, autonomously-invoked capabilities

**Example skill** (`.claude/skills/write-tests.md`):
```markdown
---
name: write-tests
description: Generate comprehensive tests
allowed-tools: [Read, Edit, Bash]
---

When writing tests:
1. Identify function/feature to test
2. Generate test cases (happy path + edge cases)
3. Use project's testing framework
4. Run tests to verify
```

### 2. Programmatic Usage

**Headless mode**:
```bash
claude "Add logging to API endpoints" --model opus
```

**Pipe input**:
```bash
echo "Refactor user controller" | claude
```

**CI/CD integration**: Use in GitHub Actions for automated tasks.

### 3. Multi-line Input

For complex prompts:
- `\` + Enter - Continue on next line
- Shift+Enter or Option+Enter - Newline

## Common Pitfalls to Avoid

1. **Don't over-configure** - Start simple, add as needed
2. **Don't make hooks slow** - Keep them fast or async
3. **Don't block useful operations** - Permissions should help, not hinder
4. **Don't forget project-specific configs** - Global is just the baseline

## Getting Help

- `/help` - In-session help
- `/status` - View current configuration
- `/feedback` - Report issues or suggestions
- Documentation: https://code.claude.com/docs

## Summary

Your setup includes:
- ✅ Global settings for permissions and hooks
- ✅ Global CLAUDE.md for universal preferences
- ✅ Multi-language custom commands
- ✅ Auto-formatting hooks (Prettier, standardrb, mix format)
- ✅ Notification when Claude finishes
- ⬜ MCP servers to install (Excel, Postgres, GitHub, Playwright)
- ⬜ Project-specific .claude/ directories to create

**Next steps**:
1. Run laptop setup script
2. Make hooks executable
3. Install MCP servers
4. Create project-specific configurations
5. Iterate based on your workflow

Enjoy using Claude Code!
