require File.join(File.dirname(__FILE__), 'base_kde_formula')

class KdevelopPhpDocs < BaseKdeFormula
  homepage 'http://kdevelop.org/'
  url 'http://download.kde.org/stable/kdevelop/4.7.0/src/kdevelop-php-docs-1.7.0.tar.xz'
  sha1 '487b60f591929e7a8292ef8f1c555a0243f1176a'

  depends_on 'kdevelop'
  kde_build_deps
end
