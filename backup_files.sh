#!/bin/bash
# backup_files.sh - Backup files in a directory

SOURCE_DIR=${1:-.}  # Default to current directory if no argument is given
BACKUP_DIR=${2:-./backups}  # Default backup directory

# Create the backup directory if it does not exist
mkdir -p "$BACKUP_DIR"

# Timestamped backup filename
BACKUP_FILE="$BACKUP_DIR/backup_$(date +%Y%m%d_%H%M%S).tar.gz"

# Create the backup
tar -czf "$BACKUP_FILE" -C "$SOURCE_DIR" .

echo "Backup created at $BACKUP_FILE."

