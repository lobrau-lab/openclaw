# Paperclip Orchestration

If OpenClaw is an employee, Paperclip is the company.

Paperclip orchestrates a team of agents. It provides org charts, heartbeat scheduling, monthly token budgets with hard-stop enforcement, board approval for hires and strategy changes, and full audit logs.

## Deployment Mode
For this personal instance, we use **`local_trusted`** mode (localhost-only, no login required, fastest startup). Paperclip must NOT be exposed to the internet.

## Setup

1. **Install and Onboard**:
   ```bash
   npx paperclipai onboard --yes
   ```
   This creates:
   * `~/.paperclip/instances/default/config.json`
   * `~/.paperclip/instances/default/db` (embedded PostgreSQL)
   * `~/.paperclip/instances/default/data/storage`
   Server runs at `http://localhost:3100`.

2. **Start**:
   ```bash
   paperclipai run
   ```
   (Diagnose issues with `paperclipai doctor`)

## OpenClaw ↔ Paperclip Integration

OpenClaw agents can be "hired" into a Paperclip org chart if they can receive a heartbeat. Paperclip's budget enforcement and board-approval gates act as the primary safety mechanism for autonomous operation.

**Note:** The exact mechanism for wiring an OpenClaw agent to a Paperclip heartbeat is not explicitly documented in the core OpenClaw repo. This is recorded in `GAPS.md` and may require a custom script or webhook endpoint bridging OpenClaw's local runtime to Paperclip's scheduling system.
