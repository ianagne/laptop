---
description: Show project information and common commands
---

# Project Information

## Project Configuration

!if [ -f "package.json" ]; then echo "=== package.json ==="; cat package.json; elif [ -f "mix.exs" ]; then echo "=== mix.exs ==="; cat mix.exs; elif [ -f "Gemfile" ]; then echo "=== Gemfile ==="; cat Gemfile; fi

## Available Scripts/Tasks

!if [ -f "package.json" ]; then npm run; elif [ -f "mix.exs" ]; then mix help; elif [ -f "Gemfile" ]; then bundle exec rake -T; fi

## Project Documentation

@./README.md

## Recent Changes

!git log --oneline -10

## Current Branch Status

!git status
