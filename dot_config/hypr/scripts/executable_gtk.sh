#!/bin/bash
# Apply GTK theme on startup — called by exec-once in autostart.conf
gsettings set org.gnome.desktop.interface gtk-theme 'catppuccin-mocha-blue-standard+default'
# gsettings set org.gnome.desktop.interface icon-theme    'dreams'
gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'
# gsettings set org.gnome.desktop.interface font-name     'Product Sans 12'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
