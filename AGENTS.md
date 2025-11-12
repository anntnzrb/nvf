# AGENTS.md

This file provides guidance to AI Agentswhen working with code in this repository.

## Project Overview

This is a personalized Neovim configuration built declaratively with Nix using the [nvf framework](https://github.com/NotAShelf/nvf). It's a "nixified" Neovim setup with no raw Lua/VimScript, providing a reproducible development environment across machines.

## Commands

```bash
nix run .# -- # try without install
nix build .# # build
nix fmt # fmt
```

## Module System

The configuration uses **auto-discovery** via `modules/flake/default.nix`:
- Recursively scans `modules/nixvim/` for `.nix` files
- Automatically imports all modules (except those in `ignoredModules`)
- Uses `flake-parts` for modular flake composition

## Research Tools

For Neovim/Nixvim queries, always use a single `Task` tool call with all 3 searches:
```
Task(subagent_type="general-purpose", description="...", prompt="ask_question(repoName='neovim/neovim', question='...') -> ask_question(repoName='NotAShelf/nvf', question='...') -> get_code_context_exa(query='...')")
```

## Development Philosophy

- Avoid raw Lua/VimScript in favor of nixification
- Use nvf modules for all configuration
- Maintain modularity through separate .nix files
- Ensure reproducibility through Nix
