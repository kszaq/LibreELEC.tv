# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team CoreELEC (https://coreelec.org)
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.org)

PKG_NAME="media_tree_aml"
PKG_VERSION="bbd47b0a4e654b4702260b7c57caab25ee42fdf1"
PKG_SHA256="043dd59ca0e7eb936a9c2a73239cc26e7b265ecb56708f029886caabd6c44b32"

PKG_LICENSE="GPL"
PKG_SITE="https://github.com/CoreELEC"
PKG_URL="https://github.com/CoreELEC/media_tree_aml/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_LONGDESC="Source of Linux Kernel amlogic drivers to build with media_build."
PKG_TOOLCHAIN="manual"
PKG_IS_KERNEL_PKG="yes"

unpack() {
  mkdir -p $PKG_BUILD/
  tar -xf $SOURCES/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz -C $PKG_BUILD/../
}

make_target() {
  kernel_make -C $(kernel_path) M=$PKG_BUILD/drivers/media/platform/meson/dvb CONFIG_MESON_DVB=m
}

makeinstall_target() {
  mkdir -p $INSTALL/$(get_full_module_dir)/$PKG_NAME
  cp $PKG_BUILD/drivers/media/platform/meson/dvb/*.ko $INSTALL/$(get_full_module_dir)/$PKG_NAME/
}
