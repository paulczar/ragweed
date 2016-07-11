# Template plan.sh
pkg_origin=paulczar
pkg_name=ragweed-nodejs
pkg_version=27b3edb7e03bf821f808bfd5e7bb780d2304a264
pkg_maintainer="Paul Czarkowski <username.taken@gmail.com>"
pkg_license=('Apache 2.0')
pkg_source=https://github.com/deis/example-nodejs-express/archive/${pkg_version}.tar.gz
pkg_shasum=8a22d0a5caa7f9ea169502c58e8a530c1210c752eaa153eb370d426b8695eae9
pkg_filename=example-nodejs-express-${pkg_version}.tar.gz
pkg_dirname=example-nodejs-express-${pkg_version}
pkg_deps=(core/node)
pkg_build_deps=(core/node)

pkg_bin_dirs=(bin)
pkg_expose=(5000)

do_prepare() {
  return 0
}

do_build() {
  npm install
  return 0
}

do_install() {
  cp -R . $pkg_prefix/
  return 0
}

