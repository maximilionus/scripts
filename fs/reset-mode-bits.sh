#!/bin/bash
#
#    Reset mode bits to default values recursively for files and directories,
#    starting with path provided as first argument.

target_dir="$1"

find "$target_dir" -type f -exec chmod 644 {} \;
find "$target_dir" -type d -exec chmod 755 {} \;

echo "Done. Check the output above for details."
