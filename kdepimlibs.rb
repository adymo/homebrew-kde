require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Kdepimlibs < BaseKdeFormula
  homepage 'http://www.kde.org/'
  url 'http://download.kde.org/stable/4.14.0/src/kdepimlibs-4.14.0.tar.xz'
  sha1 'ac6dfd4086b4728e815bec93ce2519c343babf8b'

  depends_on 'kdelibs'
  depends_on 'gpgme'
  depends_on 'akonadi'
  depends_on 'libical'
  kde_build_deps
  
  def extra_cmake_args
    "-DLDAP_INCLUDE_DIR=/usr/include/"
  end

end
