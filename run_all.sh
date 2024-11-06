#!/bin/bash
# run_all.sh - Run all scripts in the library

# Directory where scripts are stored
SCRIPT_DIR="./scripts"

# Run organize_files.sh
"$SCRIPT_DIR/organize_files.sh" "$1"

# Run backup_files.sh
"$SCRIPT_DIR/backup_files.sh" "$1" "$2"

# Run system_monitor.sh in the background (optional)
"$SCRIPT_DIR/system_monitor.sh" "${3:-5}" &

echo "All scripts are running. System monitoring is in the background."

