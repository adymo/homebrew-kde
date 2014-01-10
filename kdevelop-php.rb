require File.join(File.dirname(__FILE__), 'base_kde_formula')

class KdevelopPhp < BaseKdeFormula
  homepage 'http://kdevelop.org/'
  url 'http://download.kde.org/stable/kdevelop/4.6.0/src/kdevelop-php-1.6.0.tar.xz'
  sha1 '705b1f36a6fbbac207e8ca78619827206b75b48e'

  depends_on 'kdevelop'
  depends_on 'kdevelop-pg-qt'
  depends_on 'kdevelop-php-docs'
  kde_build_deps
end
