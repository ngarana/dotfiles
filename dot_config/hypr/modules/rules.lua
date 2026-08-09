hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})
hl.window_rule({
	name = "kitty",
	match = { class = "^kitty$" },
	float = true,
	size = "1200 700",
	center = true,
	rounding = 8,
	opacity = "0.9 0.9",
})
hl.window_rule({
	name = "nm-connection-editor",
	match = { class = "^(nm-connection-editor)$" },
	float = true,
	size = "500 600",
	center = true,
})
hl.window_rule({
	name = "blueman-manager",
	match = { class = "^(blueman-manager)$" },
	float = true,
	size = "500 500",
	center = true,
})

hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },
	move = "20 monitor_h-120",
	float = true,
})

hl.window_rule({
	name = "dropterm",
	match = { class = "^(dropterm)$" },
	float = true,
	size = "monitor_w monitor_h*0.4",
	move = "0 0",
	animation = "slide",
})

hl.window_rule({
	name = "fix-dropterm-spawn",
	match = { workspace = "name:special:dropterm", class = "negative:dropterm" },
	workspace = "+0",
})

hl.window_rule({ name = "xdg-desktop", match = { class = "xdg-desktop-portal-gtk" }, float = true, center = true })
hl.window_rule({ name = "Gtk-look", match = { class = "nwg-look" }, float = true, center = true })
hl.window_rule({ name = "Antigravity", match = { class = "[Aa]ntigravity" }, float = true, center = true })
hl.window_rule({
	name = "spotify-float",
	match = { class = "^[Ss]potify$" },
	float = true,
	size = "1000 600",
	center = true,
})

hl.window_rule({
	name = "kde-connect",
	match = { class = "org.kde.kdeconnect.app" },
	float = true,
	size = "647 539",
	move = "100%-w-20 100%-h-20",
})

hl.window_rule({
	name = "picture-in-picture",
	match = { title = "Picture(-| )in(-| )[Pp]icture" },
	float = true,
	pin = true,
	size = "947 539",
	move = "100%-w-20 100%-h-20",
})

hl.window_rule({
	name = "WhatsApp",
	match = { title = "WhatsApp Web" },
	float = true,
	size = "947 760",
	move = "100%-w-20 100%-h-20",
})

hl.window_rule({
	name = "vscode-open-folder",
	match = { class = "codium-insiders", title = "Open Folder" },
	float = true,
	center = true,
})
hl.window_rule({
	name = "codium-insiders-manager",
	match = { class = "^(codium-insiders)$", title = "^(Manager)$" },
	float = true,
})

hl.window_rule({
	name = "pcmanfm-dialogs",
	match = { class = "pcmanfm", title = "^(Removable medium is inserted)$" },
	float = true,
	pin = true,
	size = "monitor_w*0.3443 monitor_h*0.2242",
	move = "100%-w-20 100%-h-20",
})

hl.window_rule({
	name = "pcmanfm-moving-files",
	match = { class = "pcmanfm", title = "^(Moving files)$" },
	float = true,
	center = true,
	size = "677 269",
})

hl.window_rule({
	name = "generic-dialogs",
	match = {
		title = "(Confirm|Moving)?(Select|Open)( a)? (File|Folder)(s)?|File (Operation|Upload)( Progress)?|Save As|Library",
	},
	float = true,
	center = true,
})

hl.window_rule({
	name = "floating-apps",
	match = { class = "(org.qbittorrent.qBittorrent|org.gnome.eog|org.gnome.Nautilus|mpv)" },
	float = true,
	size = "monitor_w*0.55 monitor_h*0.4",
	center = true,
})

hl.window_rule({
	name = "pcmanfm",
	match = { class = "pcmanfm", title = "negative:^(Confirm)$" },
	float = true,
	size = "(monitor_w*.45) (monitor_h*.65)",
})

hl.window_rule({
	name = "pcmanfm",
	match = { class = "pcmanfm", title = "negative:^(Removable medium is inserted)$" },
	float = true,
	size = "(monitor_w*.45) (monitor_h*.65)",
})
hl.window_rule({
	name = "pavucontrol",
	match = { class = "^(pavucontrol)$" },
	float = true,
	size = "(monitor_w*.45) (monitor_h*.45)",
	center = true,
})
hl.window_rule({
	name = "pulse-pavucontrol",
	match = { class = "^(org.pulseaudio.pavucontrol)$" },
	float = true,
	size = "(monitor_w*.45) (monitor_h*.45)",
	center = true,
})
-- Flameshot cannot work out Wayland output layouts on its own, so its capture
-- overlay has to be pinned over the full screen with no decoration or animation.
-- Sized off monitor_w/h rather than hardcoded px so it survives a resolution change.
-- Drop no_initial_focus if Esc / tool shortcuts stop responding in the overlay.
hl.window_rule({
	name = "flameshot-overlay",
	match = { class = "flameshot" },
	float = true,
	pin = true,
	move = "0 0",
	size = "monitor_w monitor_h",
	rounding = 0,
	border_size = 0,
	no_anim = true,
	no_initial_focus = true,
})
hl.window_rule({
	name = "smart-gaps-tiled",
	match = { float = false, workspace = "w[tv1]" },
	border_size = 0,
	rounding = 0,
})
hl.window_rule({
	name = "smart-gaps-fullscreen",
	match = { float = false, workspace = "f[1]" },
	border_size = 0,
	rounding = 0,
})
hl.window_rule({ name = "no-shadow-tiled", match = { float = false }, no_shadow = true })
