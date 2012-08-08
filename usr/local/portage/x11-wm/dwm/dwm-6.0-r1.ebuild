# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-wm/dwm/dwm-6.0.ebuild,v 1.1 2011/12/23 01:44:46 jer Exp $

EAPI="4"

inherit toolchain-funcs savedconfig eutils

DESCRIPTION="a dynamic window manager for X11"
HOMEPAGE="http://www.suckless.org/dwm/"
SRC_URI="http://dl.suckless.org/dwm/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86 ~x86-fbsd"
IUSE="xinerama"

DEPEND="x11-libs/libX11
	xinerama? (
		x11-proto/xineramaproto
		x11-libs/libXinerama
		)"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i \
		-e "s/CFLAGS = -std=c99 -pedantic -Wall -Os/CFLAGS += -std=c99 -pedantic -Wall -g/" \
		-e "/^LDFLAGS/{s|=|+=|g;s|-s ||g}" \
		-e "s/#XINERAMALIBS =/XINERAMALIBS ?=/" \
		-e "s/#XINERAMAFLAGS =/XINERAMAFLAGS ?=/" \
		-e "s@/usr/X11R6/include@/usr/include/X11@" \
		-e "s@/usr/X11R6/lib@/usr/lib@" \
		config.mk || die "sed failed"
	
	epatch "${FILESDIR}/${PN}-6.0-bottom_padding.diff"
	epatch "${FILESDIR}/${PN}-6.0-single_window_no_border.diff"
	epatch "${FILESDIR}/${PN}-6.0-systray.diff"

	if use savedconfig; then
		restore_config config.h
	fi
}

src_compile() {
	local msg
	use savedconfig && msg=", please check the configfile"
	if use xinerama; then
		emake CC=$(tc-getCC)
	else
		emake CC=$(tc-getCC) XINERAMAFLAGS="" XINERAMALIBS=""
	fi
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install

	insinto /usr/share/${PN}
	newins config.h ${PF}.config.h

	exeinto /etc/X11/Sessions
	newexe "${FILESDIR}"/dwm-session2 dwm

	insinto /usr/share/xsessions
	doins "${FILESDIR}"/dwm.desktop

	dodoc README

	save_config config.h
}

pkg_postinst() {
	einfo "This ebuild has support for user defined configs"
	einfo "Please read this ebuild for more details and re-emerge as needed"
	einfo "if you want to add or remove functionality for ${PN}"
	if ! has_version x11-misc/dmenu; then
		elog "Installing ${PN} without x11-misc/dmenu"
		einfo "To have a menu you can install x11-misc/dmenu"
	fi
	einfo "You can custom status bar with a script in HOME/.dwm/dwmrc"
	einfo "the ouput is redirected to the standard input of dwm"
	einfo "Since dwm-5.4, status info in the bar must be set like this:"
	einfo "xsetroot -name \"\`date\` \`uptime | sed 's/.*,//'\`\""
}