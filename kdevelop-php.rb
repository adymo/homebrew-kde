require File.join(File.dirname(__FILE__), 'base_kde_formula')

class KdevelopPhp < BaseKdeFormula
  homepage 'http://kdevelop.org/'
  url 'http://download.kde.org/stable/kdevelop/4.7.0/src/kdevelop-php-1.7.0.tar.xz'
  sha1 'e3a41f7700af56840fd60219e083b761180b8b8c'

  depends_on 'kdevelop'
  depends_on 'kdevelop-pg-qt'
  depends_on 'kdevelop-php-docs'
  kde_build_deps
end
