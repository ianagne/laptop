#!/bin/bash
# Stop hook - runs when Claude finishes responding
# Sends a desktop notification on macOS

osascript -e 'display notification "Claude has finished responding" with title "Claude Code" sound name "Glass"' 2>/dev/null || true

exit 0
