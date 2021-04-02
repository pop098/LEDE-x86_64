#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: kenzo
#=================================================
#1. Modify default IP
sed -i 's/192.168.1.1/192.168.31.139/g' openwrt/package/base-files/files/bin/config_generate

#2. 自定义设置
#cp -f package/litte/default-settings package/lean/default-settings/files/zzz-default-settings
#cp -f package/litte/banner package/base-files/files/etc/banner
#cp -f package/litte/Leandiffconfig diffconfig && cp diffconfig .config && make defconfig
#./scripts/feeds update -a && ./scripts/feeds install -a && ./scripts/feeds install -a

# 修改主机名字，把OpenWrt-123修改你喜欢的就行（不能纯数字或者使用中文）
sed -i '/uci commit system/i\uci set system.@system[0].hostname='OpenWrt-123'' package/lean/default-settings/files/zzz-default-settings

# 版本号里显示一个自己的名字（281677160 build $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）
sed -i "s/OpenWrt /281677160 build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# 修改 argon 为默认主题,可根据你喜欢的修改成其他的（不选择那些会自动改变为默认主题的主题才有效果）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
