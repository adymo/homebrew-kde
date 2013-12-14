require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Digikam < BaseKdeFormula
  homepage 'http://www.digikam.org/'
  url 'http://download.kde.org/stable/digikam/digikam-3.5.0.tar.bz2'
  sha1 '9e44fcf219312cbcbbaee0cc9a7f460a01769224'

  depends_on 'kdelibs'
  depends_on 'kde-runtime'
  depends_on 'opencv'
  depends_on 'marble'
  depends_on 'libkexiv2'
  depends_on 'lensfun'
  depends_on 'libgphoto2'
  depends_on 'liblqr'
  depends_on 'libusb'
  depends_on 'jasper'

  kde_build_deps
end
