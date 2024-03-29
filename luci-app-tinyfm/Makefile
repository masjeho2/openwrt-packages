#
# Tiny File Manager by prasathmani <https://github.com/prasathmani/tinyfilemanager>
# LuCI Tiny File Manager App by Helmi Amirudin <https://www.helmiau.com>
#
# Copyright (C) 2021 Helmi Amirudin <https://www.helmiau.com>
# This is free software, licensed under the Apache License, Version 2.0
#

include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI Tiny File Manager App
LUCI_PKGARCH:=all
LUCI_DEPENDS:=+php7 +php7-cgi +php7-mod-session +php7-mod-ctype +php7-mod-fileinfo +php7-mod-zip +php7-mod-iconv +php7-mod-mbstring +zoneinfo-asia 

PKG_NAME:=luci-app-tinyfm
PKG_VERSION:=1.2
PKG_RELEASE:=1

define Package/$(PKG_NAME)
	$(call Package/luci/webtemplate)
	TITLE:=$(LUCI_TITLE)
	DEPENDS:=$(LUCI_DEPENDS)
endef

define Package/$(PKG_NAME)/description
	This is Tiny File Manager, but for LuCI OpenWrt.
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci
	cp -pR ./luasrc/* $(1)/usr/lib/lua/luci
	$(INSTALL_DIR) $(1)/
	cp -pR ./root/* $(1)/
	chmod -R 755 /root/www/*
	chmod -R 755 /root/www/tinyfm/*
	chmod -R 755 /root/www/tinyfm/assets/*
	[ ! -d /root/www/tinyfm/rootfs ] && ln -s / /root/www/tinyfm/rootfs
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
	[ -d /tmp/luci-modulecache ] && rm -rf /tmp/luci-modulecache
	find /tmp -type f -name 'luci-indexcache.*' -exec rm -f {} \;
	chmod -R 755 /usr/lib/lua/luci/controller/*
	chmod -R 755 /usr/lib/lua/luci/view/*
	chmod -R 755 /www/*
	chmod -R 755 /www/tinyfm/*
	chmod -R 755 /www/tinyfm/assets/*
	[ ! -d /www/tinyfm/rootfs ] && ln -s / /www/tinyfm/rootfs
	# Autofix download index.php, index.html
	if ! grep -q ".php=/usr/bin/php-cgi" /etc/config/uhttpd; then
		echo -e "  helmilog : system not using php-cgi, patching php config ..."
		logger "  helmilog : system not using php-cgi, patching php config..."
		uci set uhttpd.main.ubus_prefix='/ubus'
		uci set uhttpd.main.interpreter='.php=/usr/bin/php-cgi'
		uci set uhttpd.main.index_page='cgi-bin/luci'
		uci add_list uhttpd.main.index_page='index.html'
		uci add_list uhttpd.main.index_page='index.php'
		uci commit uhttpd
		echo -e "  helmilog : patching system with php configuration done ..."
		echo -e "  helmilog : restarting some apps ..."
		logger "  helmilog : patching system with php configuration done..."
		logger "  helmilog : restarting some apps..."
		/etc/init.d/uhttpd restart
	fi
#	[ -d /usr/lib/php7 ] && [ ! -d /usr/lib/php ] && ln -sf /usr/lib/php7 /usr/lib/php
exit 0
endef

define Package/$(PKG_NAME)/postrm
#!/bin/sh
	[ -d /www/tinyfm ] && rm -rf /www/tinyfm
exit 0
endef

include $(TOPDIR)/feeds/luci/luci.mk

$(eval $(call BuildPackage,$(PKG_NAME)))
