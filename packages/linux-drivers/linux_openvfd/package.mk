# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018 Arthur Liberman (arthur_liberman (at) hotmail.com)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="linux_openvfd"
PKG_VERSION="f150d14ffb3b0e47f939b9bc081f398fb852b0eb"
PKG_SHA256="6cf681feedb764bdd6796e3d8c8cb700e73a0444815b96ea529ef6922f1707e7"
PKG_ARCH="arm aarch64"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/arthur-liberman/linux_openvfd"
PKG_URL="https://github.com/LibreELEC/linux_openvfd/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_SECTION="driver"
PKG_LONGDESC="openvfd: An open source Linux driver for VFD displays"
PKG_TOOLCHAIN="manual"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  make ARCH=$TARGET_KERNEL_ARCH \
       CROSS_COMPILE=$TARGET_KERNEL_PREFIX \
       -C "$(kernel_path)" M="$PKG_BUILD/driver"
  make OpenVFDService
}

makeinstall_target() {
  mkdir -p $INSTALL/$(get_full_module_dir)/$PKG_NAME
    find $PKG_BUILD/ -name \*.ko -not -path '*/\.*' -exec cp {} $INSTALL/$(get_full_module_dir)/$PKG_NAME \;

  mkdir -p $INSTALL/usr/bin
    cp -P $PKG_DIR/scripts/openvfd-config $INSTALL/usr/bin
    cp -P $PKG_DIR/scripts/openvfd $INSTALL/usr/bin

  mkdir -p $INSTALL/usr/sbin
    cp -P OpenVFDService $INSTALL/usr/sbin

  mkdir -p $INSTALL/usr/openvfd
    cp -P $PKG_BUILD/conf/* $INSTALL/usr/openvfd
}

post_install() {
  enable_service openvfd-config.service
  enable_service openvfd.service
}
