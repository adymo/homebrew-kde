require 'base_kde_formula'

class Grantlee < BaseKdeFormula
  homepage 'http://grantlee.org/'
  version '0.3.0'
  url 'http://gitorious.org/grantlee/grantlee/archive-tarball/master'

  kde_build_deps
  depends_on 'qt'
end
