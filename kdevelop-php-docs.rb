require File.join(File.dirname(__FILE__), 'base_kde_formula')

class KdevelopPhpDocs < BaseKdeFormula
  homepage 'http://kdevelop.org/'
  url 'http://download.kde.org/stable/kdevelop/4.6.0/src/kdevelop-php-docs-1.6.0.tar.xz'
  sha1 '98d7efe6f983c4b439c6cbdc40d427e14954298f'

  depends_on 'kdevelop'
  kde_build_deps
end
