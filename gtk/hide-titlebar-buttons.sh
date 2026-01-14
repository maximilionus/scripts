#!/usr/bin/env bash

set -e

gsettings set org.gnome.desktop.wm.preferences button-layout ':'
echo "Complete. All control buttons on the title bar should be hidden now."
