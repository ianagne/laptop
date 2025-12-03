---
description: Clean build artifacts and dependencies
---

# Clean Project

This will remove build artifacts and dependency directories. Are you sure you want to proceed?

!if [ -f "package.json" ]; then rm -rf node_modules dist build .next out && echo "Cleaned: node_modules, dist, build, .next, out"; elif [ -f "mix.exs" ]; then mix clean && rm -rf _build deps && echo "Cleaned: _build, deps"; elif [ -f "Gemfile" ]; then rm -rf vendor/bundle tmp && echo "Cleaned: vendor/bundle, tmp"; fi

To reinstall dependencies, run:
- Node.js: `npm install`
- Elixir: `mix deps.get`
- Ruby: `bundle install`
