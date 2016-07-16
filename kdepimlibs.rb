require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Kdepimlibs < BaseKdeFormula
  homepage 'http://www.kde.org/'
  url 'http://download.kde.org/stable/4.14.3/src/kdepimlibs-4.14.3.tar.xz'
  sha1 'bbfff3ea5775bfb0f1692828c679e549deaf4fb3'

  depends_on 'kdelibs'
  depends_on 'gpgme'
  depends_on 'akonadi'
  depends_on 'libical'
  kde_build_deps
  
  def extra_cmake_args
    %W[-DLDAP_INCLUDE_DIR=/usr/include/]
  end

end
