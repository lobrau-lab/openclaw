# Spotify Integration (`spotify_player`)

`spotify_player` is the primary Spotify integration. It is an open-source Rust TUI with full feature parity, no browser cookie dependency, and fewer reported issues than `spogo`.

## Setup

1.  **Install `spotify_player`**:
    *   Via Homebrew: `brew install spotify_player`
    *   Via Cargo: `cargo install spotify_player`
2.  **Requirements**: `spotify_player` requires Spotify Premium.
3.  **Authentication**: Run `spotify_player` for the first time and authenticate via the TUI.

## Usage

*   **TUI Controls**: Play, pause, next, previous, seek, volume, shuffle, repeat.
*   **Search**: Press `/` in the TUI to search, or use the CLI interface if available.
*   **Programmatic Control**: `spotify_player` may primarily function as a TUI. If it does not expose a robust CLI mode or IPC interface for programmatic control from OpenClaw, it is essentially a separate control surface.

## Research (Read-Only)

For non-playback catalog research:
```bash
openclaw skills install @crawlora-org/music-podcast-research
```
*   **Covers**: Spotify (tracks, albums, artists, playlists, profiles), Podcasts, Apple Podcasts, Discogs, and SoundCloud.
*   **Requires**: `CRAWLORA_API_KEY` (free tier).

## Fallback: `spogo` (WARNING)

If `spotify_player` cannot be controlled programmatically and deep integration is strictly required, `spogo` may be used as a fallback, but subject to severe security warnings:

1.  **Cookie Import Risk**: `spogo` defaults to browser cookie import (`spogo auth import --browser chrome`), which accesses sensitive browser cookies. **This is a security tradeoff.** Do NOT run cookie import automatically. Require explicit user action. Prefer the OAuth path (`spogo auth oauth login --client-id ...`) instead.
2.  **Known Bugs**:
    *   `spogo play [track]` may fail to change tracks (Issue #12).
    *   Resume functionality via `spogo play` may return `403 Forbidden`.
3.  **Skill Override**: If `@polyskill/openclaw.spotify-player` is installed, override its `SKILL.md` to prefer `spotify_player` and absolutely disable automatic cookie import.
