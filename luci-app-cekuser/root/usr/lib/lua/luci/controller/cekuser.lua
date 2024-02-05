module("luci.controller.cekuser", package.seeall)

function index()
    entry({"admin", "network", "cekuser"}, cbi("cekuser"), _("Check PPPoE Users"), 90)
end
