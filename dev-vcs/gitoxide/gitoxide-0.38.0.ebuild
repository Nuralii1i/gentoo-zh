# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.13.2

EAPI=8

CRATES="
	addr2line@0.22.0
	adler2@2.0.0
	adler@1.0.2
	ahash@0.8.11
	aho-corasick@1.1.3
	allocator-api2@0.2.18
	anes@0.1.6
	ansiterm@0.12.2
	anstream@0.6.15
	anstyle-parse@0.2.5
	anstyle-query@1.1.1
	anstyle-wincon@3.0.4
	anstyle@1.0.8
	anyhow@1.0.86
	arbitrary@1.3.2
	arc-swap@1.7.1
	arrayvec@0.7.6
	assert_matches@1.5.0
	async-attributes@1.1.2
	async-channel@1.9.0
	async-channel@2.3.1
	async-executor@1.13.0
	async-global-executor@2.4.1
	async-io@1.13.0
	async-io@2.3.4
	async-lock@2.8.0
	async-lock@3.4.0
	async-net@2.0.0
	async-std@1.12.0
	async-task@4.7.1
	async-trait@0.1.83
	atomic-waker@1.1.2
	autocfg@1.3.0
	backtrace@0.3.73
	base64@0.22.1
	bitflags@1.3.2
	bitflags@2.6.0
	block-buffer@0.10.4
	blocking@1.6.1
	bstr@1.10.0
	bumpalo@3.16.0
	byteorder@1.5.0
	bytes@1.7.1
	bytesize@1.3.0
	cap@0.1.2
	cassowary@0.3.0
	cast@0.3.0
	castaway@0.2.3
	cc@1.1.13
	cfg-if@1.0.0
	ciborium-io@0.2.2
	ciborium-ll@0.2.2
	ciborium@0.2.2
	clap@4.5.16
	clap_builder@4.5.15
	clap_complete@4.5.23
	clap_derive@4.5.13
	clap_lex@0.7.2
	clru@0.6.2
	cmake@0.1.51
	colorchoice@1.0.2
	compact_str@0.7.1
	concurrent-queue@2.5.0
	conpty@0.5.1
	console@0.15.8
	core-foundation-sys@0.8.7
	core-foundation@0.9.4
	cpufeatures@0.2.13
	crc-catalog@2.4.0
	crc32fast@1.4.2
	crc@3.2.1
	criterion-plot@0.5.0
	criterion@0.5.1
	crossbeam-channel@0.5.13
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-queue@0.3.11
	crossbeam-utils@0.8.20
	crossbeam@0.8.4
	crossterm@0.27.0
	crossterm_winapi@0.9.1
	crosstermion@0.14.0
	crunchy@0.2.2
	crypto-common@0.1.6
	curl-sys@0.4.74+curl-8.9.0
	curl@0.4.46
	dashmap@6.0.1
	defer@0.2.1
	deranged@0.3.11
	derive_arbitrary@1.3.2
	diff@0.1.13
	digest@0.10.7
	displaydoc@0.2.5
	document-features@0.2.10
	dunce@1.0.5
	either@1.13.0
	encode_unicode@0.3.6
	encoding_rs@0.8.34
	env_logger@0.10.2
	equivalent@1.0.1
	errno@0.3.9
	event-listener-strategy@0.5.2
	event-listener@2.5.3
	event-listener@5.3.1
	expectrl@0.7.1
	fallible-iterator@0.3.0
	fallible-streaming-iterator@0.1.9
	faster-hex@0.9.0
	fastrand@1.9.0
	fastrand@2.1.0
	filetime@0.2.24
	flate2@1.0.33
	fnv@1.0.7
	foreign-types-shared@0.1.1
	foreign-types@0.3.2
	form_urlencoded@1.2.1
	fs-err@2.11.0
	fs_extra@1.3.0
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-executor@0.3.30
	futures-io@0.3.30
	futures-lite@1.13.0
	futures-lite@2.3.0
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	futures@0.3.30
	generic-array@0.14.7
	getrandom@0.2.15
	gimli@0.29.0
	gix-actor@0.31.5
	gix-attributes@0.22.5
	gix-bitmap@0.2.11
	gix-chunk@0.4.8
	gix-commitgraph@0.24.3
	gix-date@0.8.7
	gix-discover@0.32.0
	gix-features@0.38.2
	gix-fs@0.11.3
	gix-glob@0.16.5
	gix-hash@0.14.2
	gix-hashtable@0.5.2
	gix-ignore@0.11.4
	gix-index@0.33.1
	gix-lock@14.0.0
	gix-object@0.42.3
	gix-path@0.10.11
	gix-quote@0.4.12
	gix-ref@0.44.1
	gix-revwalk@0.13.2
	gix-sec@0.10.8
	gix-tempfile@14.0.2
	gix-trace@0.1.10
	gix-traverse@0.39.2
	gix-utils@0.1.12
	gix-validate@0.8.5
	gix-worktree@0.34.1
	glob@0.3.1
	gloo-timers@0.2.6
	h2@0.4.6
	half@2.4.1
	hashbrown@0.14.5
	hashlink@0.9.1
	heck@0.5.0
	hermit-abi@0.3.9
	hermit-abi@0.4.0
	home@0.5.9
	http-body-util@0.1.2
	http-body@1.0.1
	http@1.1.0
	httparse@1.9.4
	human_format@1.1.0
	humantime@2.1.0
	hyper-rustls@0.27.2
	hyper-tls@0.6.0
	hyper-util@0.1.7
	hyper@1.4.1
	idna@0.5.0
	imara-diff@0.1.7
	indexmap@2.4.0
	insta@1.40.0
	instant@0.1.13
	io-close@0.3.7
	io-lifetimes@1.0.11
	ipnet@2.9.0
	is-docker@0.2.0
	is-terminal@0.4.13
	is-wsl@0.4.0
	is_ci@1.2.0
	is_terminal_polyfill@1.70.1
	itertools@0.10.5
	itertools@0.12.1
	itertools@0.13.0
	itoa@1.0.11
	jiff-tzdb-platform@0.1.0
	jiff-tzdb@0.1.0
	jiff@0.1.8
	js-sys@0.3.70
	jwalk@0.8.1
	known-folders@1.2.0
	kstring@2.0.2
	kv-log-macro@1.0.7
	layout-rs@0.1.2
	lazy_static@1.5.0
	libc@0.2.158
	libredox@0.1.3
	libsqlite3-sys@0.30.1
	libz-ng-sys@1.1.16
	libz-sys@1.1.20
	linked-hash-map@0.5.6
	linux-raw-sys@0.3.8
	linux-raw-sys@0.4.14
	litrs@0.4.1
	lock_api@0.4.12
	lockfree-object-pool@0.1.6
	log@0.4.22
	lru@0.12.4
	lzma-sys@0.1.20
	maplit@1.0.2
	maybe-async@0.2.10
	memchr@2.7.4
	memmap2@0.9.4
	memoffset@0.7.1
	mime@0.3.17
	miniz_oxide@0.7.4
	miniz_oxide@0.8.0
	mio@0.8.11
	mio@1.0.2
	native-tls@0.2.12
	nix@0.26.4
	ntapi@0.4.1
	nu-ansi-term@0.46.0
	num-conv@0.1.0
	num-traits@0.2.19
	num_threads@0.1.7
	object@0.36.3
	once_cell@1.19.0
	oorandom@11.1.4
	open@5.3.0
	openssl-macros@0.1.1
	openssl-probe@0.1.5
	openssl-sys@0.9.103
	openssl@0.10.66
	overload@0.1.1
	parking@2.2.0
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	paste@1.0.15
	pathdiff@0.2.1
	percent-encoding@2.3.1
	pin-project-internal@1.1.5
	pin-project-lite@0.2.14
	pin-project@1.1.5
	pin-utils@0.1.0
	piper@0.2.4
	pkg-config@0.3.30
	plotters-backend@0.3.6
	plotters-svg@0.3.6
	plotters@0.3.6
	polling@2.8.0
	polling@3.7.3
	portable-atomic@1.7.0
	powerfmt@0.2.0
	ppv-lite86@0.2.20
	pretty_assertions@1.4.0
	proc-macro2@1.0.86
	prodash@28.0.0
	prodash@29.0.0
	ptyprocess@0.4.1
	quinn-proto@0.11.8
	quinn-udp@0.5.4
	quinn@0.11.3
	quote@1.0.37
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	ratatui@0.26.3
	rayon-core@1.12.1
	rayon@1.10.0
	redox_syscall@0.5.3
	regex-automata@0.4.7
	regex-syntax@0.8.4
	regex@1.10.6
	reqwest@0.12.7
	ring@0.17.8
	rusqlite@0.32.1
	rustc-demangle@0.1.24
	rustc-hash@2.0.0
	rustix@0.37.27
	rustix@0.38.34
	rustls-ffi@0.13.0
	rustls-pemfile@2.1.3
	rustls-pki-types@1.8.0
	rustls-webpki@0.102.6
	rustls@0.23.12
	rustversion@1.0.17
	ryu@1.0.18
	same-file@1.0.6
	scc@2.1.16
	schannel@0.1.23
	scopeguard@1.2.0
	sdd@3.0.2
	security-framework-sys@2.11.1
	security-framework@2.11.1
	serde@1.0.208
	serde_derive@1.0.208
	serde_json@1.0.125
	serde_spanned@0.6.7
	serde_urlencoded@0.7.1
	serial_test@3.1.1
	serial_test_derive@3.1.1
	sha1-asm@0.5.3
	sha1@0.10.6
	sha1_smol@1.0.1
	sharded-slab@0.1.7
	shell-words@1.1.0
	shlex@1.3.0
	signal-hook-mio@0.2.4
	signal-hook-registry@1.4.2
	signal-hook@0.3.17
	simd-adler32@0.3.7
	similar@2.6.0
	slab@0.4.9
	smallvec@1.13.2
	socket2@0.4.10
	socket2@0.5.7
	spin@0.9.8
	stability@0.2.1
	static_assertions@1.1.0
	strsim@0.11.1
	strum@0.26.3
	strum_macros@0.26.4
	subtle@2.6.1
	symlink@0.1.0
	syn@1.0.109
	syn@2.0.75
	sync_wrapper@1.0.1
	sysinfo@0.31.2
	system-configuration-sys@0.6.0
	system-configuration@0.6.1
	tar@0.4.41
	tempfile@3.12.0
	termcolor@1.4.1
	terminal_size@0.3.0
	termtree@0.5.1
	thiserror-impl@1.0.63
	thiserror@1.0.63
	thread_local@1.1.8
	time-core@0.1.2
	time-macros@0.2.18
	time@0.3.36
	tinytemplate@1.2.1
	tinyvec@1.8.0
	tinyvec_macros@0.1.1
	tokio-native-tls@0.3.1
	tokio-rustls@0.26.0
	tokio-util@0.7.11
	tokio@1.39.3
	toml@0.8.19
	toml_datetime@0.6.8
	toml_edit@0.22.20
	tower-layer@0.3.3
	tower-service@0.3.3
	tower@0.4.13
	tracing-attributes@0.1.27
	tracing-core@0.1.32
	tracing-forest@0.1.6
	tracing-log@0.2.0
	tracing-subscriber@0.3.18
	tracing@0.1.40
	try-lock@0.2.5
	trybuild@1.0.99
	tui-react@0.23.2
	typenum@1.17.0
	uluru@3.1.0
	unicode-bidi@0.3.15
	unicode-bom@2.0.3
	unicode-ident@1.0.12
	unicode-normalization@0.1.23
	unicode-segmentation@1.11.0
	unicode-truncate@1.1.0
	unicode-width@0.1.13
	untrusted@0.9.0
	url@2.5.2
	utf8parse@0.2.2
	valuable@0.1.0
	value-bag@1.9.0
	vcpkg@0.2.15
	version_check@0.9.5
	waker-fn@1.2.0
	walkdir@2.5.0
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.93
	wasm-bindgen-futures@0.4.43
	wasm-bindgen-macro-support@0.2.93
	wasm-bindgen-macro@0.2.93
	wasm-bindgen-shared@0.2.93
	wasm-bindgen@0.2.93
	web-sys@0.3.70
	webpki-roots@0.26.3
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.9
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.57.0
	windows-core@0.58.0
	windows-implement@0.57.0
	windows-implement@0.58.0
	windows-interface@0.57.0
	windows-interface@0.58.0
	windows-registry@0.2.0
	windows-result@0.1.2
	windows-result@0.2.0
	windows-strings@0.1.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-targets@0.42.2
	windows-targets@0.48.5
	windows-targets@0.52.6
	windows@0.44.0
	windows@0.57.0
	windows@0.58.0
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.6
	winnow@0.6.18
	winreg@0.52.0
	xattr@1.3.1
	xz2@0.1.7
	yansi@0.5.1
	zerocopy-derive@0.7.35
	zerocopy@0.7.35
	zeroize@1.8.1
	zip@2.2.0
	zopfli@0.8.1
"

inherit cargo

DESCRIPTION="A command-line application for interacting with git repositories"
HOMEPAGE="https://github.com/GitoxideLabs/gitoxide"
SRC_URI="
	https://github.com/GitoxideLabs/gitoxide/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="|| ( Apache-2.0 MIT )"
# Dependent crate licenses
LICENSE+=" Apache-2.0 BSD Boost-1.0 ISC MIT MPL-2.0 Unicode-DFS-2016"
SLOT="0"
KEYWORDS="~amd64"
