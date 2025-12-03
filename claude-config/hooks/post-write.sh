#!/bin/bash
# Post-write hook - runs after Claude writes a new file

FILE_PATH="$1"

# Make shell scripts executable
if [[ "$FILE_PATH" =~ \.sh$ ]]; then
  chmod +x "$FILE_PATH"
fi

# Auto-format like post-edit
if [[ "$FILE_PATH" =~ \.(js|jsx|ts|tsx|json|css|scss|html|yaml|yml|md)$ ]]; then
  if command -v prettier >/dev/null 2>&1; then
    prettier --write "$FILE_PATH" 2>/dev/null || true
  fi
fi

if [[ "$FILE_PATH" =~ \.rb$ ]]; then
  if command -v standardrb >/dev/null 2>&1; then
    standardrb --fix "$FILE_PATH" 2>/dev/null || true
  fi
fi

if [[ "$FILE_PATH" =~ \.(ex|exs)$ ]]; then
  if [ -f "mix.exs" ]; then
    mix format "$FILE_PATH" 2>/dev/null || true
  fi
fi

exit 0
