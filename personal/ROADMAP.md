# Predictive Extensions (Roadmap)

The following extensions are planned for future integration. Assessments are included to guide implementation without over-engineering custom solutions when existing primitives suffice.

## 1. Voice Interaction
**Assessment**: Prioritize local speech-to-text (e.g., Whisper.cpp) and text-to-speech. Must run completely on-device without cloud dependencies.

## 2. Browser Automation
**Assessment**: Evaluate Playwright or Puppeteer for local DOM inspection and interaction, heavily sandboxed.

## 3. Email/Calendar & Signal
**Assessment**: Investigate local bridges (e.g., Signal CLI) and standard IMAP/SMTP tools. Avoid SaaS wrappers if possible.

## 4. Vocabulary Learning & Document Intelligence
**Assessment**: Integrate directly into the RAG pipeline managed by ClawShield or custom local embeddings for parsing dense PDFs and extending `USER.md`.

## 5. Financial Surface & Home Automation
**Assessment**: Connect to Home Assistant (local API) and strictly read-only local financial parsers.

## 6. Multi-Agent Teams
**Assessment**: Addressed by Paperclip orchestrating the 45 agents.

## 7. Backup, Model Eval, Cost Tracking
**Assessment**: Addressed by the `memory-compress.sh` script, Paperclip's token budget tracking, and local MLX execution (zero cost).

## 8. Scheduled Proactivity
**Assessment**: A cron-driven check that runs at intervals (e.g., every morning at 8am) and uses `HEARTBEAT.md` to decide whether to initiate conversation. **Do not build a custom system** if standard Automations (cron/systemd timers triggering an OpenClaw CLI evaluation) can accomplish this.

## 9. Goal Tracking
**Assessment**: A `GOALS.md` file in the workspace that the assistant reads and references. If a goal has a deadline, the assistant can proactively check progress during heartbeats or initialization.

## 10. Content Pipeline End-to-End
**Assessment**: YouTube upload + Suno + content repurpose + Obsidian archival. Document how these connect. **Do not build a custom pipeline**; document the composition of existing CLI tools (e.g., `youtube-upload`, Obsidian markdown creation).

## 11. Agent Performance Review
**Assessment**: Paperclip tracks token budgets and audit logs. A weekly review of agent performance (which agents used the most tokens, which completed the most tasks) could be generated from Paperclip's API via a scheduled script.
