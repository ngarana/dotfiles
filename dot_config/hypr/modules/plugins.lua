local function configure_plugins()
	local hyprbars = hl.plugin and hl.plugin.hyprbars

	hl.config({
		plugin = {
			borders_plus_plus = {
				add_borders = 2,
				["col.border_1"] = "rgb(928374)",
				["col.border_2"] = "rgb(98971a)",
				border_size_1 = 3,
				border_size_2 = 3,
				natural_rounding = true,
			},

			hyprbars = {
				bar_color = "rgb(3c3836)",
				["col.text"] = "rgb(ebdbb2)",
				bar_height = 25,
				bar_text_size = 10,
				bar_text_font = "JetBrains Mono Nerd Font",
				bar_part_of_window = true,
				bar_precedence_over_border = true,
			},

			hyprfocus = {
				mode = "slide",
				slide_height = 8,
				fade_opacity = 0.85,
			},

			hyprexpo = {
				columns = 3,
				gaps_in = 5,
				gaps_out = 0,
				bg_col = "rgb(111111)",
				workspace_method = "center current",
				skip_empty = false,
				max_workspace = 0,
				gesture_distance = 200,
				cancel_key = "escape",
				show_cursor = 1,
				tile_rounding = 12,
				tile_rounding_power = 2.0,
				border_width = 2,
				border_color_current = "rgb(458588)",
				border_color_focus = "rgb(d79921)",
				border_color_hover = "rgb(98971a)",
				label_enable = true,
				label_text_mode = "token",
				label_token_map = "1,2,3,4,5,6,7,8,9,0",
				label_position = "center",
				label_bg_enable = true,
				label_bg_color = "rgba(00000088)",
				selection_label_enable = true,
				selection_label_token_map = "1,2,3,4,5,6,7,8,9,0",
				keynav_enable = true,
				keynav_wrap_h = true,
				keynav_wrap_v = true,
				keynav_reading_order = false,
			},
		},
	})

	if hl.plugin and hl.plugin.hyprexpo and hl.plugin.hyprexpo.gesture then
		hl.plugin.hyprexpo.gesture({
			fingers = 4,
			direction = "up",
			action = "expo",
		})
	end

	if hyprbars then
		hyprbars.add_button({
			bg_color = "rgb(cc241d)",
			fg_color = "rgb(ebdbb2)",
			size = 16,
			icon = "󰖭",
			action = [[hyprctl dispatch 'hl.dsp.window.close()']],
		})
		hyprbars.add_button({
			bg_color = "rgb(d79921)",
			fg_color = "rgb(ebdbb2)",
			size = 16,
			icon = "",
			action = [[hyprctl dispatch 'hl.dsp.window.fullscreen(1)']],
		})
		hyprbars.add_button({
			bg_color = "rgb(F7DCDE)",
			fg_color = "rgb(282828)",
			size = 16,
			icon = "󰖰",
			action = "/home/arch/.config/hypr/scripts/minimize.sh",
		})
	end
end

hl.timer(configure_plugins, { timeout = 1500, type = "oneshot" })
