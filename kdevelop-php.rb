require File.join(File.dirname(__FILE__), 'base_kde_formula')

class KdevelopPhp < BaseKdeFormula
  homepage 'http://kdevelop.org/'
  url 'http://download.kde.org/stable/kdevelop/4.5.1/src/kdevelop-php-1.5.1.tar.bz2'
  sha1 'c047724c255417b361d3ce1898555c2b9183f5b2'

  depends_on 'kdevelop'
  kde_build_deps
end
