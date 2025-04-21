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

# 修改管理地址
sed -i 's/192.168.1.1/192.168.168.254/g' package/base-files/files/bin/config_generate

# 设置密码为空
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings

# 修改本地时间格式
sed -i 's/os.date()/os.date("%a %Y-%m-%d %H:%M:%S")/g' package/lean/autocore/files/*/index.htm

# 修改默认主题
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-light/Makefile
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-nginx/Makefile
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-ssl-nginx/Makefile

#
sed -i "3i uci commit network\n" package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set network.lan.delegate='0'" package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set network.lan.dns='114.114.114.114'" package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set network.lan.gateway='192.168.168.254'" package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set network.lan.netmask='255.255.255.0'" package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set network.lan.ipaddr='192.168.168.254'" package/lean/default-settings/files/zzz-default-settings
#
sed -i "3i uci commit dhcp\n" package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set dhcp.lan.leasetime='12h'" package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set dhcp.lan.limit='100'" package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set dhcp.lan.start='101'" package/lean/default-settings/files/zzz-default-settings
