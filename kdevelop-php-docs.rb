require File.join(File.dirname(__FILE__), 'base_kde_formula')

class KdevelopPhpDocs < BaseKdeFormula
  homepage 'http://kdevelop.org/'
  url 'http://download.kde.org/stable/kdevelop/4.7.2/src/kdevelop-php-docs-1.7.2.tar.xz'
  sha1 '989e857d40fb16cb3ac207fab73fb024a94d7554'

  depends_on 'kdevelop'
  kde_build_deps
end
