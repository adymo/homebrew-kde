require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Kdepimlibs < BaseKdeFormula
  homepage 'http://www.kde.org/'
  url 'http://download.kde.org/stable/4.11.4/src/kdepimlibs-4.11.4.tar.xz'
  sha1 '267b5adad467b76563df0dc8a43fdbc39d85ece5'

  depends_on 'kdelibs'
  depends_on 'gpgme'
  depends_on 'akonadi'
  depends_on 'libical'
  kde_build_deps
end
