# Personal Coding Agents & Overrides

> **Note**: This file governs coding agents and workflow. It is distinct from `SOUL.md` (which defines the runtime assistant identity). There is no `JULES.md`.

## Workflow
- Always produce an execution plan first.
- Wait for approval before making file changes.
- Use non-destructive methods for gathering information (read/write/copy/paste); do not extract, tear, or damage data sources.
- Never commit secrets. Use placeholders instead.
- Do not modify upstream code logic unless necessary wiring is impossible otherwise.

## Code Standards
- Package Manager: `pnpm` exclusively. No plain `npm install` at root.
- All code modifications must follow the OpenClaw pnpm-workspace monorepo conventions.
