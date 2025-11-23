# Maintainer:
# Contributor: Rustmilian Rustmilian@proton.me

_pkgname="calamares"
pkgname="$_pkgname"
pkgver=3.4.2
pkgrel=1
pkgdesc="Distribution-independent installer framework"
url="https://codeberg.org/Calamares/calamares"
license=("GPL-3.0-or-later")
arch=('i686' 'x86_64')

depends=(
  'kcoreaddons'
  'kpmcore'
  'libpwquality'
  'qt6-declarative'
  'qt6-svg'
  'yaml-cpp'
)
makedepends=(
  'extra-cmake-modules'
  'ninja'
  'qt6-tools'
  'qt6-translations'
)

_pkgsrc="$_pkgname"
_pkgext="tar.gz"
source=("calamares.zip")
sha256sums=('9d59a1e630f7ee99b9668b8356f8ab0fe152092ca2d4f01e4c86d79819b414b8')

build() {
  local _skip_modules=(
    dracut
    dracutlukscfg
    dummycpp
    dummyprocess
    dummypython
    dummypythonqt
    initramfs
    initramfscfg
    interactiveterminal
    packagechooser
    packagechooserq
    services-openrc
  )

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBDIR='lib'
    -DWITH_QT6=ON
    -DINSTALL_CONFIG=ON
    -DSKIP_MODULES="${_skip_modules[*]}"
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  cd ${srcdir}/build
  DESTDIR="${pkgdir}" cmake --build . --target install
  install -Dm644 "${srcdir}/calamares.desktop" "$pkgdir/etc/xdg/autostart/calamares.desktop"
  install -Dm755 "${srcdir}/calamares_polkit" "$pkgdir/usr/bin/calamares_polkit"
  install -Dm644 "${srcdir}/49-nopasswd-calamares.rules" "$pkgdir/etc/polkit-1/rules.d/49-nopasswd-calamares.rules"
  chmod 750 "$pkgdir"/etc/polkit-1/rules.d
}
