hl.window_rule({
	-- Ignore maximize requests from all apps
	name = "supress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
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
	-- Make pavucontrol appear below the volume dock in waybar
	name = "pavucontrol-floating",
	match = { class = "org.pulseaudio.pavucontrol" },

	float = true,
	move = "2029 48",
})

hl.window_rule({
	-- Make all images opened with imv appear as floating
	name = "imv-floating",
	match = { class = "imv" },

	float = true,
})

hl.window_rule({
	-- Make all presentations generated with Manim appear as floating
	name = "manim-floating",
	match = { title = "Manim Slides" },

	float = true,
})

hl.window_rule({
	-- Discord floating as default
	name = "discord-floating",
	match = { class = "discord" },

	float = true,
	size = "1280 720",
})

hl.window_rule({
	-- Slack floating as default
	name = "slack-floating",
	match = { class = "Slack" },

	float = true,
	size = "1280 720",
})

hl.window_rule({
	-- Mail writing windows for ThunderBird appear as floating
	name = "thunderbird-writing-floating",
	match = {
		class = "org.mozilla.Thunderbird",
		title = "^Escrever",
	},

	float = true,
})

hl.window_rule({
	-- Make the hyprland share picker appear as floating
	name = "share-picker-floating",
	match = { class = "hyprland-share-picker" },

	float = true,
	size = "480 360",
})
