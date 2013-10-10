require File.join(File.dirname(__FILE__), 'base_kde_formula')

class KdevelopPhpDocs < BaseKdeFormula
  homepage 'http://kdevelop.org/'
  url 'http://download.kde.org/stable/kdevelop/4.5.1/src/kdevelop-php-docs-1.5.1.tar.bz2'
  sha1 '9bdb654373970f46d01359fdcae6d879c405760a'

  depends_on 'kdevplatform'
  kde_build_deps
end
