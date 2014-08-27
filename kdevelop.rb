require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Kdevelop < BaseKdeFormula
  homepage 'http://kdevelop.org/'
  url 'http://download.kde.org/stable/kdevelop/4.7.0/src/kdevelop-4.7.0.tar.xz'
  sha1 '6c4becf482956334975886963ba0acf158f2aa15'
  depends_on 'kdevplatform'
  depends_on 'kde-runtime'
  kde_build_deps
end
