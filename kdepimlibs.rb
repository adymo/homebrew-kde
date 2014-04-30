require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Kdepimlibs < BaseKdeFormula
  homepage 'http://www.kde.org/'
  url 'http://download.kde.org/stable/4.13.0/src/kdepimlibs-4.13.0.tar.xz'
  sha1 '8cedbc430262928d3d802224453650557701ba0d'

  depends_on 'kdelibs'
  depends_on 'gpgme'
  depends_on 'akonadi'
  depends_on 'libical'
  kde_build_deps
end
