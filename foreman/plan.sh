# Template plan.sh
pkg_origin=paulczar
pkg_name=foreman
pkg_version=0.82.0
pkg_maintainer="Paul Czarkowski <username.taken@gmail.com>"
pkg_license=('MIT')
pkg_source=
pkg_filename=nosuchfile.tar.gz
pkg_shasum=
pkg_deps=(core/glibc core/ruby)
pkg_build_deps=(core/ruby)
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)
pkg_bin_dirs=(bin vendor/bundle/bin)

do_install() {
  export GEM_HOME=$pkg_prefix
  export GEM_PATH=$pkg_prefix
  gem install foreman -v ${pkg_version} --no-ri --no-rdoc
}
 
do_download() {
  return 0
}

do_verify() {
  return 0
}

do_unpack() {
  return 0
}

do_prepare() {
  return 0
}

do_build() {
  return 0
}
