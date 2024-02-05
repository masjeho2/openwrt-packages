include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-cekuser
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-cekuser
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=LuCI app to check active PPPoE users
  PKGARCH:=all
endef

define Build/Compile
endef

define Package/luci-app-cekuser/install
  $(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
  $(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi
  $(INSTALL_DIR) $(1)/etc/config
  $(INSTALL_DATA) ./root/usr/lib/lua/luci/controller/cekuser.lua $(1)/usr/lib/lua/luci/controller/cekuser.lua
  $(INSTALL_DATA) ./root/usr/lib/lua/luci/model/cbi/cekuser.lua $(1)/usr/lib/lua/luci/model/cbi/cekuser.lua
  $(INSTALL_CONF) ./root/etc/config/cekuser $(1)/etc/config/cekuser
endef

$(eval $(call BuildPackage,luci-app-cekuser))
