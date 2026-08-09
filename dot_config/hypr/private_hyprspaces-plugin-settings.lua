-- hyprspaces-managed settings
-- Hyprland Lua config format; booleans use Lua true/false syntax.

hl.config({
    plugin = {
        hyprspaces = {
            -- paired_offset * monitor_count must fit Hyprland numeric workspaces: 1..2147483647.
            -- With persistent_workspaces enabled, the product must also be <= 100000.
            paired_offset = 10,

            -- Ordered preferred monitor list. Soft by default: active listed outputs define slots,
            -- missing outputs warn, and hyprspaces falls back when none are active.
            -- monitors = "DP-1,DP-2",
            -- monitors_strict = false,

            -- keep_focused = true,
            -- enable_wrapping = true,
            -- follow_moved_window = false,
            -- persistent_workspaces = false,
            -- workspace_names = "1:Web,2:Dev,3:Chat",
        },
    },
})
