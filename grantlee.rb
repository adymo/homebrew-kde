require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Grantlee < BaseKdeFormula
  homepage 'http://grantlee.org/'
  version '0.3.0'
  url 'http://gitorious.org/grantlee/grantlee/archive-tarball/master'
  sha1 '19763bc1dafb8aa6843660b1dd75fcc7fa67c0f4'

  kde_build_deps
  depends_on 'qt'
end
