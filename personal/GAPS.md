# Gaps & Required Upstream Changes

The following requirements cannot be met with the existing primitives and may require upstream changes or custom development outside the current scope:

1.  **Paperclip Heartbeat Wiring**: The mechanism to wire an OpenClaw agent to a Paperclip heartbeat is not natively documented. A bridge script or webhook receiver is needed to translate Paperclip's schedules into OpenClaw agent invocations.
