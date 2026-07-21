----------------
--- MONITORS ---
----------------

hl.monitor({
	output = "HDMI-A-1",
	mode = "2560x1080@60",
	position = "auto",
	scale = "auto",
})

-------------------
--- MY PROGRAMS ---
-------------------

local terminal = "kitty"
local fileManager = "dolphin"
local browser = "zen-browser"
local menu = "walker"
local discord = "discord --enable-features=UseOzonePlatform --ozone-platofm=wayland --start-minimized"

-----------------
--- AUTOSTART ---
-----------------

hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("swaync")
	hl.exec_cmd(discord)
	hl.exec_cmd("1password --silent")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd("nm-applet --indicator")
	hl.exec_cmd("/home/henrieger/openrgb/OpenRGB-x86_64.AppImage --startminimized --profile nucleo")
	hl.exec_cmd("kdeconnect-indicator")
end)

-----------------------------
--- ENVIRONMENT VARIABLES ---
-----------------------------

-- Cursor configs
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Nvidia configuration
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

-- Electron configuration
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- Dolphin XDG menu
hl.env("XDG_MENU_PREFIX", "arch-")

-----------------------
----- PERMISSIONS -----
-----------------------

hl.config({
	ecosystem = {
		enforce_permissions = true,
	},
})

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")

---------------------
--- LOOK AND FEEL ---
---------------------

hl.config({
	general = {
		layout = "scrolling",

		gaps_in = 2,
		gaps_out = 20,
		border_size = 2,
		col = {
			active_border = {
				colors = { "rgba(4b31ddff)", "rgba(8d31ddff)", "rgba(4b31ddff)" },
				angle = 45,
			},
			inactive_border = "rgba(00000000)",
		},
		resize_on_border = false,
		allow_tearing = false,
	},

	decoration = {
		border_part_of_window = false,
		rounding = 5,
		rounding_power = 2,
		active_opacity = 1.0,
		inactive_opacity = 0.85,
		shadow = {
			enabled = true,
			range = 10,
			render_power = 2,
			color = "rgba(1a1a1ab8)",
		},
		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	cursor = {
		inactive_timeout = 5,
	},

	animations = {
		enabled = true,
	},
})

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "default", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "easeOutQuint", style = "slidevert" })
hl.animation({ leaf = "workspacesIn", enabled = false, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = false, speed = 1.94, bezier = "almostLinear", style = "fade" })

hl.config({
	master = {
		new_status = "master",
	},
})

hl.config({
	dwindle = {
		preserve_split = true,
	},
})

hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

------------
--- MISC ---
------------

hl.config({
	misc = {
		force_default_wallpaper = -1,
		disable_hyprland_logo = false,
	},
})

-------------
--- INPUT ---
-------------

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "altgr-intl",
		kb_model = "",
		kb_options = "caps:escape_shifted_capslock",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0,

		touchpad = {
			natural_scroll = true,
		},
	},
})

-------------------
--- KEYBINDINGS ---
-------------------

local mainMod = "SUPER"

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ workspace = "e-1" }))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.layout("swapcol r"))
hl.bind(mainMod .. " + period", hl.dsp.layout("colresize 0.5"))
hl.bind(mainMod .. " + comma", hl.dsp.layout("fit active"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(discord))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("obsidian"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())

hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m output -m active --clipboard-only"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("hyprshot -m window -m active --clipboard-only"))
hl.bind("CTRL + Print", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("wf-recorder -a -r 60"))
hl.bind(mainMod .. " + SHIFT + Print", hl.dsp.exec_cmd("pkill wf-recorder"))

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

------------------------------
--- WINDOWS AND WORKSPACES ---
------------------------------

hl.window_rule({
	name = "supress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
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
	name = "pavucontrol-floating",
	match = { class = "org.pulseaudio.pavucontrol" },

	float = true,
	move = "2029 48",
})

hl.window_rule({
	name = "imv-floating",
	match = { class = "imv" },

	float = true,
})

hl.window_rule({
	name = "manim-floating",
	match = { title = "Manim Slides" },

	float = true,
})

hl.window_rule({
	name = "discord-floating",
	match = { class = "discord" },

	float = true,
	size = "1280 720",
})

hl.window_rule({
	name = "slack-floating",
	match = { class = "Slack" },

	float = true,
	size = "1280 720",
})

hl.window_rule({
	name = "thunderbird-writing-floating",
	match = {
		class = "org.mozilla.Thunderbird",
		title = "^Escrever",
	},

	float = true,
})

hl.window_rule({
	name = "share-picker-floating",
	match = { class = "hyprland-share-picker" },

	float = true,
	size = "480 360",
})
