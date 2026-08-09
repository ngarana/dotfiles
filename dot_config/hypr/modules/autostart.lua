hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

	-- The bar goes first, right after the bus environment is exported (which it
	-- needs) and before everything else. These all launch at once and then
	-- compete for the same cold disk, so whatever starts first faults its
	-- libraries in first — and the bar is the one piece of this list the user is
	-- actually looking at. `hyprpm reload` in particular is slow and nothing here
	-- depends on it finishing.
	hl.exec_cmd("qypr-bar")

	--	hl.exec_cmd("noctalia")
	hl.exec_cmd("hyprpm reload")
	hl.exec_cmd("swayosd-server")
	hl.exec_cmd("systemctl --user start swaync")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("kdeconnect-cli")
	hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
	hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 24")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd("awww-daemon &")
	hl.exec_cmd("blueman-applet")
	hl.exec_cmd("nm-applet")
	hl.exec_cmd("kitty --class dropterm", { workspace = "special:dropterm silent" })
end)
