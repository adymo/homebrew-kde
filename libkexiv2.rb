require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Libkexiv2 < BaseKdeFormula
  homepage 'http://www.kde.org/'
  url 'http://download.kde.org/stable/4.11.4/src/libkexiv2-4.11.4.tar.xz'
  sha1 'f08478920598f07dc585013f5d6f0ffb46b5757c'

  depends_on 'exiv2'
  kde_build_deps
end
