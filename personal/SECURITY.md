# OpenClaw Security: Trust Model & ClawShield

The security posture of this OpenClaw instance relies on strict network proxying, rigorous local sandboxing, and zero reliance on cloud LLMs for policy enforcement.

## Trust Model

*   **Trusted**: Direct user messages, and local files explicitly pointed at by the user.
*   **Untrusted**: Everything else (web search results, external API responses, cloned repositories, scraped content).
*   **Default Action**: Untrusted input is to be summarized, never obeyed. There is a "High probability of malicious intent" policy implemented as ClawShield proxy + sandbox + allowlist + reader-agent isolation.
*   **Note**: Prompt instructions alone are *not* a security boundary.

## Primary Defense: ClawShield

ClawShield (`SleuthCo/clawshield-public`) sits in front of OpenClaw as a proxy. Every message is scanned for prompt injection, PII leaks, and secrets *before* reaching the model or leaving the network.

### Architecture (Defense-in-Depth)
1.  Go proxy
2.  iptables firewall
3.  eBPF kernel monitor
4.  YAML policy engine
5.  Audit logging
6.  Five specialized AI agents with RAG knowledge bases.

**Crucially, ClawShield's default LLM (Claude) is replaced by the local MLX server.** No cloud LLM is used for security scanning.

### Deployment

```bash
git clone https://github.com/SleuthCo/clawshield-public.git
cd clawshield-public
cp standalone/.env.template standalone/.env
```

Edit `standalone/.env` to point to the local MLX server:
```
OPENAI_BASE_URL=http://127.0.0.1:8080/v1
OPENAI_API_KEY=mlx-local
```
Edit `standalone/config/openclaw.json` to use the OpenAI-compatible provider.

Start the service:
```bash
cd standalone && docker compose up -d
# Ensure health checks and restart policies are in place (--restart unless-stopped)
```
Dashboard is available at `http://localhost:18801`.

## Native OpenClaw Defenses

Beyond ClawShield, OpenClaw's native defenses must be enabled:
*   **Sandbox**: Configured via `agents.defaults.sandbox` using the repository's backend.
*   **Group Denylist**: The following groups are explicitly denied on untrusted-input agents: `fs`, `runtime`, `web`, `browser`, `cron`, `gateway`, `node`.
*   **Safe Binaries**: `tools.exec.safeBins` is restricted to stdin-only binaries.
*   **Native prompt-injection defenses**: spoof marker neutralization, trusted system-prompt routing, and chat-template special-token stripping are active.

## Rejected Alternatives

The following security plugins were evaluated and rejected:

*   **MoltGuard**: Reported phishing payload injection into tool outputs (Issue #55152), validator bugs, cloud-backed with limited disclosure. **AVOID.**
*   **SecureClaw**: Supply-chain concerns flagged by multiple auditors (3.2/10 blocked).
*   **openclaw-shield (Knostic)**: Usable with caution (5.8/10), but explicitly states it "won't stay effective for more than mere days" without constant community updates. Not suitable for an isolated, robust setup.
*   **IronClaw**: A complete Rust rewrite of OpenClaw, not a plugin. Would replace OpenClaw entirely, which violates the scope of this project.

## Verification

To verify the security posture, run:
```bash
openclaw security audit --deep
```
A clean result indicates all expected sandbox policies, ClawShield routing, and injection filters are active and enforcing.
