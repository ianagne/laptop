# MCP Server Setup Guide

MCP (Model Context Protocol) servers extend Claude Code with additional capabilities. This guide covers setting up the MCP servers you requested.

## Installing MCP Servers

### Important Notes

1. **MCP servers are installed interactively** using `claude /mcp` command
2. **Package names vary** - check https://github.com/modelcontextprotocol/servers for exact names
3. **Configuration is stored** in `~/.claude/settings.json` after approval

### Requested MCP Servers

#### 1. Excel MCP Server

Search for Excel/spreadsheet MCP servers in the community:
```bash
claude /mcp
# Then search for "excel" or "spreadsheet"
```

**Alternative**: Check https://github.com/modelcontextprotocol/servers for available Excel integrations.

#### 2. Postgres MCP Server

Search for PostgreSQL MCP servers:
```bash
claude /mcp
# Then search for "postgres" or "postgresql"
```

**Common pattern**: May be named like `@modelcontextprotocol/server-postgres` or similar.

#### 3. GitHub MCP Server

Search for GitHub integration:
```bash
claude /mcp
# Then search for "github"
```

**Note**: Claude Code has built-in GitHub integration via `gh` CLI. The MCP server may provide additional features.

#### 4. Playwright MCP Server

Search for Playwright/browser automation:
```bash
claude /mcp
# Then search for "playwright" or "browser"
```

## Installation Process

1. **Start Claude Code**:
   ```bash
   claude
   ```

2. **Open MCP menu**:
   ```
   /mcp
   ```

3. **Search for each server** by name

4. **Review and approve** each server's permissions

5. **Configuration is saved** to `~/.claude/settings.json`

## Manual MCP Configuration

If you know the exact package names, you can manually add them to `~/.claude/settings.json`:

```json
{
  "mcp-servers": {
    "excel": {
      "command": "npx",
      "args": ["-y", "package-name-here"]
    },
    "postgres": {
      "command": "npx",
      "args": ["-y", "postgres-mcp-server"]
    },
    "github": {
      "command": "npx",
      "args": ["-y", "github-mcp-server"]
    },
    "playwright": {
      "command": "npx",
      "args": ["-y", "playwright-mcp-server"]
    }
  }
}
```

**Important**: Replace `package-name-here` with actual package names from the MCP registry.

## Finding MCP Servers

### Official MCP Registry
https://github.com/modelcontextprotocol/servers

### Search Pattern
Most MCP servers follow naming patterns:
- `@modelcontextprotocol/server-*`
- `*-mcp-server`
- `mcp-server-*`

### Community Servers
Check npm and GitHub for community-maintained servers.

## Verifying Installation

After installing MCP servers, verify they're configured:

```bash
claude /mcp
```

This will show all installed and available MCP servers.

## Troubleshooting

### Server Not Starting
- Check that the package name is correct
- Ensure Node.js/npm is installed
- Review logs in Claude Code

### Permission Issues
- Review server permissions in `/mcp` menu
- Approve or deny based on what the server needs access to

### Conflicts
- Some servers may conflict with built-in features
- Disable servers via `/mcp` if needed

## Recommended Next Steps

1. Install Claude Code: `brew install --cask claude-code`
2. Run the laptop setup script to configure dotfiles
3. Start Claude Code: `claude`
4. Use `/mcp` to install the servers you need
5. Test each server to ensure it works with your workflow

## Additional Resources

- MCP Documentation: https://modelcontextprotocol.io
- Claude Code Docs: https://code.claude.com/docs
- MCP Servers Repository: https://github.com/modelcontextprotocol/servers
