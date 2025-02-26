#!/bin/bash
#===============================================
# Description: DIY script
# File name: diy-script.sh
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#===============================================

# 修改版本为编译日期，数字类型。
date_version=$(date +"%Y%m%d%H")
echo $date_version > version

# 为iStoreOS固件版本加上编译作者
author="空心游戏科技"
sed -i "s/DISTRIB_DESCRIPTION.*/DISTRIB_DESCRIPTION='%D %V ${date_version} by ${author}'/g" package/base-files/files/etc/openwrt_release
sed -i "s/OPENWRT_RELEASE.*/OPENWRT_RELEASE=\"%D %V ${date_version} by ${author}\"/g" package/base-files/files/usr/lib/os-release

# 拉取我的软件包仓库
sed -i '$a src-git xmpackage https://github.com/xiaomeng9597/openwrt-packages2.git;main' feeds.conf.default

# 添加 openclash 的 feed 源
echo 'src-git openclash https://github.com/vernesong/OpenClash.git' >> feeds.conf.default

# 添加 AdGuardHome 的 feed 源
echo 'src-git adguardhome https://github.com/kongfl888/luci-app-adguardhome.git' >> feeds.conf.default

# 添加 PassWall 2 的 feed 源
echo 'src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git' >> feeds.conf.default


# 添加必要的 feed 源
echo 'src-git pcre2 https://github.com/openwrt/packages.git^a1b2c3d4' >> feeds.conf.default
echo 'src-git tcping https://github.com/openwrt/packages.git^a1b2c3d4' >> feeds.conf.default
echo 'src-git geoview https://github.com/openwrt/packages.git^a1b2c3d4' >> feeds.conf.default
echo 'src-git kmod-fs-ntfs3 https://github.com/openwrt/packages.git^a1b2c3d4' >> feeds.conf.default
