#!/bin/bash
#
# DESCRIPTION
#       Detect all ".flac" files, convert them to mp3 preserving all the
#       embedded metadata, back up the original files to "$BACKUP_DIR"
#       (preserving the directory structure), and remove the original files.
#
#       Requires ffmpeg.
#
# EXAMPLE
#       $ ./flac-to-mp3.sh "~/Music/"
set -e

BACKUP_DIR="${BACKUP_DIR:-./_flac_backup}"
MP3_BITRATE="${MP3_BITRATE:-320k}"


cd "$1"

echo "Converting..."
find -type f -name '*.flac' \
    -exec ffmpeg -i "{}" -hide_banner -loglevel warning \
        -ab "$MP3_BITRATE" -map_metadata 0 -id3v2_version 3 "{}.mp3" \;

echo "Backing up the original files..."
mkdir "$BACKUP_DIR"
find . -type d -path "$BACKUP_DIR" -prune -o \
    -type f -name '*.flac' \
    -exec cp --parents {} "$BACKUP_DIR"/ \; \
    -exec rm -f {} \;

echo "Correcting the file names..."
find . -type f -name "*.flac.mp3" -exec bash -c 'mv "$0" "${0%.flac.mp3}.mp3"' {} \;

echo "Cleanup..."
rmdir "$BACKUP_DIR" 2>/dev/null || true  # Remove backup dir if empty

echo
echo "Done"
echo
echo "Original files are backed up to \"$(realpath $BACKUP_DIR)\""
