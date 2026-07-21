hl.config({
	ecosystem = {
		enforce_permissions = true,
	},
})

-- -- grim screencopy
-- hl.permission({
--  binary = "/usr/(bin|local/bin)/grim",
--  type = "screencopy",
--  mode = "allow"
-- })

-- xdg-portal screencopy
hl.permission({
	binary = "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland",
	type = "screencopy",
	mode = "allow",
})
