# Self-Modification and Skill Creation

OpenClaw supports self-modification and the continuous creation of new skills through the following surfaces:

## Skill Workshop
The Skill Workshop is an environment for rapidly prototyping and testing new skills before they are published to the main skill registry.

## `openclaw-superpowers`
Use the `openclaw-superpowers` extension to enhance base agent capabilities (e.g. enhanced read/write permissions where authorized).

## Moltron and AceForge
These are advanced systems for generating, testing, and refining agent logic. They integrate with the `agent-builder` and `openclaw agents` CLI surfaces to allow the assistant to construct and deploy new agents dynamically based on the current context and needs.

## Agent-Builder CLI
Agents can be constructed using:
```bash
openclaw agents create --name <name> --role <role>
```
Configuration is then synced into `AGENTS.md` and the workspace definitions.
