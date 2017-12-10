################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
#      Copyright (C) 2017-present Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="vfdd"
PKG_VERSION="41288df"
PKG_ARCH="arm aarch64"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/anpaza/linux_vfd"
PKG_URL="https://github.com/anpaza/linux_vfd/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="linux_vfd-$PKG_VERSION*/vfdd"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_PRIORITY="optional"
PKG_SECTION="tools"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  make \
   CROSS_COMPILE=$TARGET_PREFIX \
   LDFLAGS=-static \
   MODE=release
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/sbin
    find $PKG_BUILD/out -executable -type f -exec cp {} $INSTALL/usr/sbin \;
}
