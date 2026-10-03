#!/bin/bash
# Memory Compactor using Brotli compression
# Intended for reducing the disk footprint of archival memory, not token usage.

MEMORY_DIR="$HOME/.openclaw/workspace/memory"
ARCHIVE_DIR="$HOME/.openclaw/workspace/memory-archive"
DATE_SUFFIX=$(date +%Y%m%d%H%M)

mkdir -p "$ARCHIVE_DIR"

if [ ! -d "$MEMORY_DIR" ]; then
    echo "Memory directory not found: $MEMORY_DIR"
    # return instead of exit to not kill sourced shell if sourced, or just echo and stop
    # but bash script standard is exit. Let's just use return 1 or kill. We can just echo.
    echo "Aborting due to missing directory."
else
    echo "Compressing $MEMORY_DIR to $ARCHIVE_DIR/memory-$DATE_SUFFIX.tar.br..."
    tar -cf - "$MEMORY_DIR" | brotli -q 9 - > "$ARCHIVE_DIR/memory-$DATE_SUFFIX.tar.br"

    echo "Verifying round-trip..."
    TEST_DIR=$(mktemp -d)
    brotli -d -c "$ARCHIVE_DIR/memory-$DATE_SUFFIX.tar.br" | tar -xf - -C "$TEST_DIR"

    if [ $? -eq 0 ]; then
        echo "Round-trip verification successful."
        rm -rf "$TEST_DIR"
    else
        echo "Verification failed!"
        rm -rf "$TEST_DIR"
    fi

    echo "Done."
fi
