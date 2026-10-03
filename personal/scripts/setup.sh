#!/bin/bash
# OpenClaw Personalization Automator
# Prints copy commands. Writes NO secrets.

echo "--- Bootstrapping OpenClaw Personal Instance ---"

echo "1. Creating configuration directory..."
echo "mkdir -p ~/.openclaw"
echo "cp personal/config/openclaw.example.json5 ~/.openclaw/openclaw.json"

echo "2. Creating workspace directory..."
echo "mkdir -p ~/.openclaw/workspace"
echo "cp personal/templates/SOUL.md ~/.openclaw/workspace/SOUL.md"
echo "cp personal/templates/USER.md ~/.openclaw/workspace/USER.md"

echo "3. Please manually edit ~/.openclaw/openclaw.json to verify settings."
echo "4. Please manually edit ~/.openclaw/workspace/SOUL.md to fill in placeholders."

echo "--- Setup commands generated. Run them manually to apply. ---"
