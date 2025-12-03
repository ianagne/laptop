---
description: Run tests in watch mode
---

# Run Tests in Watch Mode

Determine the test framework and run in watch mode:

!if [ -f "package.json" ]; then npm run test:watch || npm test -- --watch; elif [ -f "mix.exs" ]; then mix test.watch; elif [ -f "Gemfile" ]; then bundle exec guard || bundle exec rspec --watch; fi

Tests are now running in watch mode. They will re-run automatically when files change.
