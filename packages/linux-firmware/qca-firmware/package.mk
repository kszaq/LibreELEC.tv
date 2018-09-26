# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="qca-firmware"
PKG_VERSION="39d025c6d52085c529568c4e110ca6d0b290fef6"
PKG_SHA256="7af9e815f0cc5136819c9f7e02c548ea736d34c9a67ca065e5a693f4fdadb312"
PKG_ARCH="arm aarch64"
PKG_LICENSE="Qualcom"
PKG_SITE="https://github.com/boundarydevices/qca-firmware"
PKG_URL="https://github.com/chewitt/qca-firmware/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="linux-firmware"
PKG_SHORTDESC="qca9377 bluetooth firmware"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p $INSTALL/$(get_full_firmware_dir)
    cp -aR qca $INSTALL/$(get_full_firmware_dir)
    cp -aR ath10k $INSTALL/$(get_full_firmware_dir)
}
