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
echo 'src-git xmpackage https://github.com/xiaomeng9597/openwrt-packages2.git;main' >> feeds.conf.default

# openclash插件
echo 'src-git openclash https://github.com/vernesong/OpenClash.git' >> feeds.conf.default

# passwall2插件
echo 'src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git' >> feeds.conf.default


# 更新 feeds
./scripts/feeds update packages

# 安装 luci-i18n-passwall2-zh-cn
./scripts/feeds install luci-i18n-passwall2-zh-cn