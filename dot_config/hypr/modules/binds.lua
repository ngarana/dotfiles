local mainMod = "SUPER"
local home = os.getenv("HOME")
local menu = "waylaunch"
-- local menu = "walker"
local swayosd_monitor =
	[[swayosd-client --monitor "$(hyprctl monitors -j | jq -r '.[] | select(.focused == true).name')" ]]
local scripts = home .. "/.config/hypr/scripts"
-- hl.bind("Print", hl.dsp.exec_cmd([[grim -g "$(slurp)" - | wl-copy]]))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

-- Minimize --
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(scripts .. "/unminimize.sh"))
-- screenshot --
-- Flameshot for the two main captures. -p needs an existing directory.
local shots = home .. "/Pictures/Screenshots"
-- Selection: interactive region select + annotation tools.
hl.bind("Print", hl.dsp.exec_cmd("flameshot gui -p " .. shots))
-- Full screen: straight to clipboard and saved to disk.
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("flameshot full -c -p " .. shots))
-- Still on grimblast: frozen-area snip and single-monitor capture.
hl.bind(mainMod .. " + SHIFT + Print", hl.dsp.exec_cmd(scripts .. "/screenshot.sh sf"))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(scripts .. "/screenshot.sh m"))

local function hyprexpo_call(method, ...)
	local hyprexpo = hl.plugin and hl.plugin.hyprexpo
	if hyprexpo and hyprexpo[method] then
		hyprexpo[method](...)
	end
end

hl.bind(mainMod .. " + G", function()
	hyprexpo_call("expo", "toggle")
end)

hl.bind(mainMod .. " + Super_L", function()
	hyprexpo_call("expo", "toggle")
end, { release = true })

hl.bind(mainMod .. " + Super_R", function()
	hyprexpo_call("expo", "toggle")
end, { release = true })

hl.define_submap("hyprexpo", function()
	hl.bind("left", function()
		hyprexpo_call("kb_focus", "left")
	end)
	hl.bind("right", function()
		hyprexpo_call("kb_focus", "right")
	end)
	hl.bind("up", function()
		hyprexpo_call("kb_focus", "up")
	end)
	hl.bind("down", function()
		hyprexpo_call("kb_focus", "down")
	end)
	hl.bind("h", function()
		hyprexpo_call("kb_focus", "left")
	end)
	hl.bind("l", function()
		hyprexpo_call("kb_focus", "right")
	end)
	hl.bind("k", function()
		hyprexpo_call("kb_focus", "up")
	end)
	hl.bind("j", function()
		hyprexpo_call("kb_focus", "down")
	end)
	hl.bind("return", function()
		hyprexpo_call("kb_confirm")
	end)
	hl.bind("escape", function()
		hyprexpo_call("expo", "cancel")
	end)
	hl.bind("1", function()
		hyprexpo_call("kb_selecti", 1)
	end)
	hl.bind("2", function()
		hyprexpo_call("kb_selecti", 2)
	end)
	hl.bind("3", function()
		hyprexpo_call("kb_selecti", 3)
	end)
	hl.bind("4", function()
		hyprexpo_call("kb_selecti", 4)
	end)
	hl.bind("5", function()
		hyprexpo_call("kb_selecti", 5)
	end)
	hl.bind("6", function()
		hyprexpo_call("kb_selecti", 6)
	end)
	hl.bind("7", function()
		hyprexpo_call("kb_selecti", 7)
	end)
	hl.bind("8", function()
		hyprexpo_call("kb_selecti", 8)
	end)
	hl.bind("9", function()
		hyprexpo_call("kb_selecti", 9)
	end)
	-- hl.bind("0", function()
	-- 	hyprexpo_call("kb_selecti", 10)
	-- end)
end)
hl.bind("ALT + Tab", hl.dsp.exec_cmd("waylaunch --switcher"))
hl.bind("ALT + SHIFT + Tab", hl.dsp.exec_cmd("waylaunch --switcher --reverse"))

hl.bind(mainMod .. " + Tab", hl.dsp.workspace.toggle_special("dropterm"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("~/.config/qypr/lock.sh"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.center())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen(0))
hl.bind(mainMod .. " + CTRL + F", hl.dsp.window.fullscreen_state({ internal = 0, client = 2 }))

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Workspaces 1-9 on their matching number keys. No modulo here: the upstream
-- example uses `i % 10` only so workspace 10 lands on key 0.
for i = 1, 9 do
	hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end
-- hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))
-- hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("waylaunch --power"))

hl.define_submap("power", function()
	hl.bind("e", hl.dsp.exit(), { ignore_mods = true })
	hl.bind("l", hl.dsp.exec_cmd("~/.config/qypr/lock.sh"), { ignore_mods = true })
	hl.bind("s", hl.dsp.exec_cmd("systemctl suspend"), { ignore_mods = true })
	hl.bind("p", hl.dsp.exec_cmd("systemctl poweroff"), { ignore_mods = true })
	hl.bind("h", hl.dsp.exec_cmd("systemctl hibernate"), { ignore_mods = true })
	hl.bind("r", hl.dsp.exec_cmd("systemctl reboot"), { ignore_mods = true })
	hl.bind("escape", hl.dsp.submap("reset"), { ignore_mods = true })
	hl.bind("catchall", hl.dsp.submap("reset"), { ignore_mods = true })
end)

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd(swayosd_monitor .. "--output-volume 5"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd(swayosd_monitor .. "--output-volume -5"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd(swayosd_monitor .. "--output-volume mute-toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd(swayosd_monitor .. "--brightness +5"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd(swayosd_monitor .. "--brightness -5"),
	{ locked = true, repeating = true }
)
-- =========================================================================
-- Lid Switch
-- =========================================================================
hl.bind("switch:off:Lid Switch", function()
	hl.timer(function()
		hl.dispatch(hl.dsp.exec_cmd("hyprctl dispatch dpms on eDP-1"))
	end, { timeout = 500, type = "oneshot" })
end, { locked = true })
hl.bind("switch:on:Lid Switch", function()
	hl.timer(function()
		hl.dispatch(hl.dsp.exec_cmd("hyprctl dispatch dpms off eDP-1"))
	end, { locked = true })
end, { locked = true })
