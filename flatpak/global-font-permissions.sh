#!/usr/bin/env bash

set -e
flatpak override --user --filesystem=xdg-config/fontconfig:ro
echo "Done. Restart any already running flatpak app."
