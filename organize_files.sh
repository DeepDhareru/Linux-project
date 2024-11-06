#!/bin/bash
# organize_files.sh - Organize files by extension

TARGET_DIR=${1:-.}  # Default to the current directory if no argument is given

# Check if the target directory exists
if [ ! -d "$TARGET_DIR" ]; then
  echo "Directory $TARGET_DIR does not exist."
  exit 1
fi

# Organize files by their extensions
for file in "$TARGET_DIR"/*; do
  if [ -f "$file" ]; then
    ext="${file##*.}"
    mkdir -p "$TARGET_DIR/$ext"
    mv "$file" "$TARGET_DIR/$ext/"
  fi
done

echo "Files organized by extension in $TARGET_DIR."

