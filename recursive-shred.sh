#!/bin/bash
set -e

directory="$1"

if [[ ! -d "$directory" ]]; then
    echo "Not a directory: $directory"
    exit 1
fi

if [[ "$directory" == "/" ]]; then
    echo "Refusing to shred /"
    exit 1
fi

# Shred the files
find "$directory" -type f -print | xargs shred -zun 5

# Remove the remaining empty directories
rm -rf "$directory"
