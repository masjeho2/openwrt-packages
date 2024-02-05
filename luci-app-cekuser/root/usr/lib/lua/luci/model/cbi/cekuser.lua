m = Map("cekuser", translate("Check PPPoE Users"))
s = m:section(NamedSection, "general", "cekuser", translate("General Settings"))

enable = s:option(Flag, "enabled", translate("Enable"))
enable.default = 0
enable.rmempty = false

return m
