require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Digikam < BaseKdeFormula
  homepage 'http://www.digikam.org/'
  url 'http://download.kde.org/stable/digikam/digikam-3.5.0.tar.bz2'
  sha1 '9e44fcf219312cbcbbaee0cc9a7f460a01769224'

  # Ref: https://trac.macports.org/browser/trunk/dports/kde/digikam/Portfile
  # Digikam and kipi-plugins dependencies
  depends_on 'kdelibs'
  depends_on 'kdepimlibs'
  depends_on 'qt'
  depends_on 'libtiff'
  #depends_on 'libjpg'
  depends_on 'libpng'
  depends_on 'opencv'
  depends_on 'marble'

  # kipi-plugins dependencies
  #depends_on 'expat'
  depends_on 'gdk-pixbuf'
  #depends_on 'libgpod'
  depends_on 'libxml2'
  depends_on 'libxslt'
  depends_on 'qca'
  depends_on 'qjson'
  depends_on 'imagemagick'
  depends_on 'eigen'

  # Digikam dependencies
  #depends_on 'boost'
  #depends_on 'gettext'
  depends_on 'glib'
  depends_on 'lensfun'
  depends_on 'libgphoto2'
  depends_on 'liblqr'
  depends_on 'libusb'
  depends_on 'jasper'
  depends_on 'shared-desktop-ontologies'
  depends_on 'libraw'
  depends_on 'sane-backends'

  # If building with external KDEGraphics libs
  #depends_on 'libkdcraw'
  #depends_on 'libkexiv2'
  #depends_on 'libkipi'
  #depends_on 'libksane'

  # Runtime dependencies
  depends_on 'kde-runtime'
  depends_on 'oxygen-icons'

  def patches
    # Build fails with 'Unknown CMake command "FLEX_TARGET".'
    # Suspect missing 'hugin' package. Disable panorama plugin for now:
    {:p0 => 'https://gist.github.com/tlvince/8004513/raw/b61f7213d56058e7d97f00c0bfbf9701eea03aac/disable-panorama.diff'}
  end

  def extra_cmake_args
    [
      '-DDIGIKAMSC_USE_PRIVATE_KDEGRAPHICS=on',
      '-DDIGIKAMSC_COMPILE_DOC=off'
    ]
  end

  kde_build_deps
end
