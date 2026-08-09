#!/bin/bash
# Clear the persistent power menu notification, then run the given command
hyprctl notify 6 1 "rgba(00000000)" ""
exec "$@"
