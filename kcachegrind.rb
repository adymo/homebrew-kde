require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Kactivities < BaseKdeFormula
  homepage 'http://www.kde.org/'
  url 'http://download.kde.org/stable/4.14.0/src/kcachegrind-4.14.0.tar.xz'
  sha1 '403f10048445b9348a985504ac5e80d70d563244'

  depends_on 'kdelibs'
  kde_build_deps
end
