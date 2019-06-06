TERMUX_PKG_HOMEPAGE=https://github.com/termux/libandroid-support
TERMUX_PKG_DESCRIPTION="Library extending the Android C library (Bionic) for additional multibyte, locale and math support"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_VERSION=25
TERMUX_PKG_SRCURL=https://github.com/termux/libandroid-support/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=42e7b55c2e5fc91cc0447fa8bea432e7a75ec78b03469330668af17aea56f660
TERMUX_PKG_PRE_DEPENDS="dpkg (>= 1.19.4-3)"
TERMUX_PKG_BUILD_IN_SRC=yes
TERMUX_PKG_ESSENTIAL=yes

termux_step_make_install() {
	_C_FILES="src/musl-*/*.c"
	$CC $CFLAGS -std=c99 -DNULL=0 $CPPFLAGS $LDFLAGS \
		-Iinclude \
		$_C_FILES \
		-shared -fpic \
		-o $TERMUX_PREFIX/lib/libandroid-support.so
}
