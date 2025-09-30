#!/bin/bash
#
# Disable the recent files feature and clean the already existing storage.

set -e

gsettings set org.gnome.desktop.privacy remember-recent-files false
rm -f "$HOME/.local/share/recently-used.xbel"

echo "Done"
