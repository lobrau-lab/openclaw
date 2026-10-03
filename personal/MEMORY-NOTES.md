# OpenClaw Memory Architecture Notes

## Layering

1.  **Compaction:** Process of rewriting active history to maintain stable conversation context within the model's context window. This happens at runtime to prevent excessive token usage and maintain bounded state.
2.  **Archival:** Long-term storage of past interactions and states to disk. We use Brotli compression for this layer to minimize disk footprint. **Brotli does not reduce token usage.**

## Memory-Core
The memory-core manages these operations. When compacting, the system preserves existing skill, tool, and memory refresh contracts without rewriting essential history unpredictably.
