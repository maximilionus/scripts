#!/bin/bash

set -e

STORAGE="$HOME/storage"
EXTERNAL_NAME="external-1"
EXTERNAL_PRIVATE="$STORAGE/$EXTERNAL_NAME"
EXTERNAL_SHARED="$STORAGE/shared-$EXTERNAL_NAME"

if [[ ! -d $STORAGE ]]; then
    echo "Storage directory non-existent. Run 'termux-setup-storage' first."
    exit 1
fi

ln -s $(readlink -f "$EXTERNAL_PRIVATE" | cut -d/ -f-3) "$EXTERNAL_SHARED"
echo "External storage is successfully symlinked to '$EXTERNAL_SHARED'."
