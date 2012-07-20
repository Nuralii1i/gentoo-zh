# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2"
inherit eutils elisp-common eutils multilib multiprocessing python toolchain-funcs

DESCRIPTION="A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input) - With Fcitx Support"
HOMEPAGE="http://code.google.com/p/mozc/"

MY_P="${P/fcitx-}"
PROTOBUF_VER="2.4.1"
GMOCK_VER="403"
MOZC_URL="http://mozc.googlecode.com/files/${MY_P}.tar.bz2"
PROTOBUF_URL="http://protobuf.googlecode.com/files/protobuf-${PROTOBUF_VER}.tar.bz2"
SRC_URI="${MOZC_URL} ${PROTOBUF_URL}"

LICENSE="Apache-2.0 BSD Boost-1.0 ipadic public-domain unicode"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="emacs scim +qt4 renderer"

RDEPEND="dev-libs/glib:2
	dev-libs/openssl
	emacs? ( virtual/emacs )
	>=app-i18n/fcitx-4.2.1
	renderer? ( x11-libs/gtk+:2 )
	scim? ( app-i18n/scim )
	qt4? (
		x11-libs/qt-gui:4
		app-i18n/zinnia
	)"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

S="${WORKDIR}/${MY_P}"

BUILDTYPE="${BUILDTYPE:-Release}"

RESTRICT="test"

SITEFILE=50${PN}-gentoo.el

pkg_setup() {
	python_set_active_version 2
}

src_unpack() {
	unpack $(basename ${MOZC_URL})

	cd "${S}"/protobuf
	unpack $(basename ${PROTOBUF_URL})
	mv protobuf-${PROTOBUF_VER} files
}

src_prepare() {
	EPATCH_OPTS="-p2" epatch "${FILESDIR}/${P}.1.patch"
}

src_configure() {
	local myconf="--channel_dev=0"
	myconf+=" --server_dir=/usr/$(get_libdir)/mozc"

	if ! use qt4 ; then
		myconf+=" --noqt"
		export GYP_DEFINES="use_libzinnia=0"
	fi

	if ! use renderer ; then
		export GYP_DEFINES="${GYP_DEFINES} enable_gtk_renderer=0"
	fi

	"$(PYTHON)" build_mozc.py gyp ${myconf} || die "gyp failed"
}

src_compile() {
	tc-export CC CXX AR AS RANLIB LD

	local my_makeopts=$(makeopts_jobs)
	# This is for a safety. -j without a number, makeopts_jobs returns 999.
	local myjobs=-j${my_makeopts/999/1}

	local mytarget="server/server.gyp:mozc_server"
	use emacs && mytarget="${mytarget} unix/emacs/emacs.gyp:mozc_emacs_helper"
	mytarget="${mytarget} unix/fcitx/fcitx.gyp:fcitx-mozc"
	use scim && \
		mytarget="${mytarget} unix/scim/scim.gyp:scim_mozc unix/scim/scim.gyp:scim_mozc_setup"
	use renderer && mytarget="${mytarget} renderer/renderer.gyp:mozc_renderer"
	if use qt4 ; then
		export QTDIR="${EPREFIX}/usr"
		mytarget="${mytarget} gui/gui.gyp:mozc_tool"
	fi

	"$(PYTHON)" build_mozc.py build_tools -c "${BUILDTYPE}" ${myjobs} || die
	"$(PYTHON)" build_mozc.py build -c "${BUILDTYPE}" ${mytarget} ${myjobs} || die

	if use emacs ; then
		elisp-compile unix/emacs/*.el || die
	fi
}

src_test() {
	"$(PYTHON)" build_mozc.py runtests -c "${BUILDTYPE}" || die
}

src_install() {
	if use emacs ; then
		dobin "out_linux/${BUILDTYPE}/mozc_emacs_helper" || die
		elisp-install ${PN} unix/emacs/*.{el,elc} || die
		elisp-site-file-install "${FILESDIR}/${SITEFILE}" ${PN} || die
	fi

	exeinto /usr/$(get_libdir)/fcitx || die
	doexe "out_linux/${BUILDTYPE}/fcitx-mozc.so" || die
	insinto /usr/share/fcitx/addon || die
	doins "unix/fcitx/fcitx-mozc.conf" || die
	insinto /usr/share/fcitx/inputmethod || die
	doins "unix/fcitx/mozc.conf" || die
	insinto /usr/share/fcitx/mozc/icon || die
	(
		cd data/images
		newins product_icon_32bpp-128.png mozc.png || die
		cd unix
		for f in ui-*
		do
			newins ${f} "mozc-${f/ui-}" || die
		done
	)

	if use scim ; then
		exeinto "$(pkg-config --variable=moduledir scim)/IMEngine/" || die
		newexe "out_linux/${BUILDTYPE}/lib.target/libscim_mozc.so" mozc.so || die
		exeinto "$(pkg-config --variable=moduledir scim)/SetupUI/" || die
		newexe "out_linux/${BUILDTYPE}/lib.target/libscim_mozc_setup.so" mozc-setup.so || die
		insinto "$(pkg-config --variable=icondir scim)" || die
		(
			cd data/images/unix
			newins ime_product_icon_opensource-32.png scim-mozc.png || die
			for f in ui-*
			do
				newins ${f} ${f/ui-/scim-mozc-} || die
			done
		)
	fi

	exeinto "/usr/$(get_libdir)/mozc" || die
	doexe "out_linux/${BUILDTYPE}/mozc_server" || die

	if use qt4 ; then
		exeinto "/usr/$(get_libdir)/mozc" || die
		doexe "out_linux/${BUILDTYPE}/mozc_tool" || die
	fi

	if use renderer ; then
		exeinto "/usr/$(get_libdir)/mozc" || die
		doexe "out_linux/${BUILDTYPE}/mozc_renderer" || die
	fi
}

pkg_postinst() {
	if use emacs ; then
		elisp-site-regen
		elog "You can use mozc-mode via LEIM (Library of Emacs Input Method)."
		elog "Write the following settings into your init file (~/.emacs.d/init.el"
		elog "or ~/.emacs) in order to use mozc-mode by default, or you can call"
		elog "\`set-input-method' and set \"japanese-mozc\" anytime you have loaded"
		elog "mozc.el"
		elog
		elog "  (require 'mozc)"
		elog "  (set-language-environment \"Japanese\")"
		elog "  (setq default-input-method \"japanese-mozc\")"
		elog
		elog "Having the above settings, just type C-\\ which is bound to"
		elog "\`toggle-input-method' by default."
	fi
}

pkg_postrm() {
	use emacs && elisp-site-regen
}
