hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = 1,
})
-- Hisense TV on HDMI: duplicate (mirror) the built-in panel instead of
-- extending. Content is scaled to the TV's resolution.
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "preferred",
    position = "auto",
    scale    = 1,
    mirror   = "eDP-1",
})
-- Built-in laptop panel. Must match a real output name (hyprctl monitors),
-- otherwise these rules silently never apply.
local primary = "eDP-1"

-- Home workspaces 1-9 on the primary output. Deliberately NOT persistent: the
-- status bar should only show workspaces that actually have windows.
for i = 1, 9 do
    hl.workspace_rule({ workspace = tostring(i), monitor = primary })
end