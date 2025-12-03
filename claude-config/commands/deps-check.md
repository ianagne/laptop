---
description: Check for outdated dependencies
---

# Check for Outdated Dependencies

Let me check which dependencies are outdated:

!if [ -f "package.json" ]; then npm outdated; elif [ -f "mix.exs" ]; then mix hex.outdated; elif [ -f "Gemfile" ]; then bundle outdated; fi

Above are the outdated dependencies. Would you like me to help update any of them?
