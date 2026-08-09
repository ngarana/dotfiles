#!/bin/bash
hyprctl notify 1 25000 "rgba(eeffffff)" "Power Menu: [E] Logout  [L] Lock  [S] Suspend  [P] Poweroff  [H] Hibernate  [R] Reboot"
hyprctl dispatch 'hl.dsp.submap("power")'
