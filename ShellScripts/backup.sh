#!/usr/bin/env bash
# Author: Mayank Garg
# Folder Backup

set -euo pipefail

if [[ $# -ne 1 ]]; then
    echo "Usage: ./backup.sh <folder>" >&2
    exit 1
fi

if [[ ! -d "$1" ]]; then
    echo "Error: folder does not exist: $1" >&2
    exit 1
fi

SOURCE_DIR="$(cd -- "$1" && pwd)"
SOURCE_PARENT="$(dirname -- "$SOURCE_DIR")"
SOURCE_NAME="$(basename -- "$SOURCE_DIR")"

BACKUP_DIR="$HOME/DeveloperPortfolio_Backups"
mkdir -p "$BACKUP_DIR"

TIMESTAMP="$(date +'%Y-%m-%d_%H-%M-%S')"
ARCHIVE_NAME="backup_${TIMESTAMP}.tar.gz"
ARCHIVE_PATH="$BACKUP_DIR/$ARCHIVE_NAME"

if tar -czf "$ARCHIVE_PATH" -C "$SOURCE_PARENT" "$SOURCE_NAME"; then
    SIZE="$(du -h "$ARCHIVE_PATH" | cut -f1)"
    echo "Backup created successfully."
    echo "File: $ARCHIVE_NAME"
    echo "Size: $SIZE"
    printf '%s | SUCCESS | %s | %s\n' "$TIMESTAMP" "$ARCHIVE_NAME" "$SIZE" >> "$BACKUP_DIR/backup.log"
else
    rm -f "$ARCHIVE_PATH"
    printf '%s | FAILED | %s\n' "$TIMESTAMP" "$ARCHIVE_NAME" >> "$BACKUP_DIR/backup.log"
    echo "Error: backup failed." >&2
    exit 1
fi
