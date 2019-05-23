# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="zlib"
PKG_VERSION="4230228b86594f9e3561e444421c4df95f3638c7"
PKG_SHA256="14f9430514d99a6b6857accd439abb3425a230beab89fed85cc378bf0a19e533"
PKG_LICENSE="OSS"
PKG_SITE="http://www.zlib.net"
PKG_URL="https://github.com/zlib-ng/zlib-ng/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="cmake:host"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A general purpose (ZIP) data compression library."
PKG_TOOLCHAIN="cmake-make"

PKG_CMAKE_OPTS_HOST="-DZLIB_COMPAT=ON"
PKG_CMAKE_OPTS_TARGET="-DZLIB_COMPAT=ON"
