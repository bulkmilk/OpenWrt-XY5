#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.11.254/g' package/base-files/files/bin/config_generate
#
sed -i "3i uci commit network\n" package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set network.lan.delegate='0'" package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set network.lan.dns='114.114.114.114'" package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set network.lan.gateway='192.168.11.254'" package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set network.lan.netmask='255.255.255.0'" package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set network.lan.ipaddr='192.168.11.254'" package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set network.wan.delegate='0'" package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set network.wan.proto='pppoe'" package/lean/default-settings/files/zzz-default-settings

sed -i "3i uci commit dhcp\n" package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set dhcp.lan.leasetime='12h'" package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set dhcp.lan.limit='50'" package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set dhcp.lan.start='101'" package/lean/default-settings/files/zzz-default-settings

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# 设置密码为空
#sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings

# 修改本地时间格式
sed -i 's/os.date()/os.date("%a %Y-%m-%d %H:%M:%S")/g' package/lean/autocore/files/*/index.htm
