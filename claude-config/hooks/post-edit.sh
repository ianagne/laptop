#!/bin/bash
# Post-edit hook - runs after Claude edits a file
# Auto-formats files based on project type

FILE_PATH="$1"

# JavaScript/TypeScript - try Prettier if available
if [[ "$FILE_PATH" =~ \.(js|jsx|ts|tsx|json|css|scss|html|yaml|yml|md)$ ]]; then
  if command -v prettier >/dev/null 2>&1; then
    prettier --write "$FILE_PATH" 2>/dev/null || true
  fi
fi

# Ruby - try standardrb if available
if [[ "$FILE_PATH" =~ \.rb$ ]]; then
  if command -v standardrb >/dev/null 2>&1; then
    standardrb --fix "$FILE_PATH" 2>/dev/null || true
  fi
fi

# Elixir - try mix format if in Elixir project
if [[ "$FILE_PATH" =~ \.(ex|exs)$ ]]; then
  if [ -f "mix.exs" ]; then
    mix format "$FILE_PATH" 2>/dev/null || true
  fi
fi

exit 0
