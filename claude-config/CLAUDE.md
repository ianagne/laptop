# Personal Development Preferences

## General Principles

- Prefer simplicity over complexity
- Write clear, self-documenting code
- Avoid premature optimization
- Keep functions small and focused
- Include tests for new features and bug fixes

## My Development Environment

### Version Management
- Using `asdf` for language version management
- Check `.tool-versions` file in each project root

### Editor
- Primary editor: Neovim
- Configuration in `~/.config/nvim/`

### Shell
- Using `zsh` with dotfiles from `~/.dotfiles/`

## Project Types

I work on multiple types of projects:
- Ruby/Rails applications
- Next.js/React applications
- Elixir/Phoenix applications

Check each project's `.claude/CLAUDE.md` for framework-specific conventions and guidelines.

## Development Workflow

- Always run tests before committing
- Write descriptive commit messages
- Review diffs carefully before pushing
- Document non-obvious decisions in code comments
- Follow existing patterns and conventions in each project

## Security

- Never commit sensitive data (API keys, passwords, tokens, etc.)
- Use environment variables for configuration
- Review dependencies for known vulnerabilities
- Keep dependencies reasonably up to date
