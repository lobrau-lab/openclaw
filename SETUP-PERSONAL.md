# OpenClaw Personal Setup Guide

This guide details how to bootstrap the personalized OpenClaw instance.

## 1. ClawShield Proxy (Security Layer)
ClawShield runs as a Docker container enforcing network and prompt policies.

```bash
git clone https://github.com/SleuthCo/clawshield-public.git
cd clawshield-public
cp standalone/.env.template standalone/.env
# Edit standalone/.env to point to your local MLX server
docker compose up -d
```
*Health Check*: Ensure ClawShield restarts automatically (`--restart unless-stopped` in docker-compose.yml).

## 2. Configuration & Identities
Copy the custom configuration files to the required paths.

```bash
# 1. Main configuration (Strictly validated JSON5)
mkdir -p ~/.openclaw
cp personal/config/openclaw.example.json5 ~/.openclaw/openclaw.json

# 2. Runtime Identities
mkdir -p ~/.openclaw/workspace
cp personal/templates/SOUL.md ~/.openclaw/workspace/SOUL.md
cp personal/templates/USER.md ~/.openclaw/workspace/USER.md
```

## 3. Paperclip Orchestration
Set up the Paperclip instance for agent orchestration.

```bash
npx paperclipai onboard --yes
paperclipai run
```
*Verification*: `paperclipai doctor`

## 4. Spotify Integration
Install `spotify_player`.

```bash
cargo install spotify_player
```
Authenticate via the TUI on first run.

## 5. Self-Healing & Watchdog
Run the watchdog script to ensure OpenClaw runs 24/7.
```bash
openclaw doctor --fix
```
For Mac M-series (if applicable in the future), ensure `sysctl iogpu.wired_limit_mb` is configured for maximum memory residency.
