#!/bin/bash

set -e

STORAGE="~/storage"
EXTERNAL_PRIVATE="$STORAGE/external-1"
EXTERNAL_ROOT="$STORAGE/external-1-root"

if [[ ! -d $STORAGE ]]; then
    echo "Storage directory non-existent. Run 'termux-storage-setup' first."
    exit 1
fi

ln -s $(readlink -f "$EXTERNAL_PRIVATE" | cut -d/ -f-3) "$EXTERNAL_ROOT"
echo "External storage is successfully symlinked to '$EXTERNAL_ROOT'."
