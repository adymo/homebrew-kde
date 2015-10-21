require File.join(File.dirname(__FILE__), 'base_kde_formula')

class KdevelopPhp < BaseKdeFormula
  homepage 'http://kdevelop.org/'
  url 'http://download.kde.org/stable/kdevelop/4.7.2/src/kdevelop-php-1.7.2.tar.xz'
  sha1 'efdc58214b8c1eb32b4bbd827dc6d6e942355c9c'

  depends_on 'kdevelop'
  depends_on 'kdevelop-pg-qt'
  depends_on 'kdevelop-php-docs'
  kde_build_deps
end
