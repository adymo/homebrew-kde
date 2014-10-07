require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Grantlee < BaseKdeFormula
  homepage 'http://grantlee.org/'
  version '0.5.1'
  url 'https://gitorious.org/grantlee/grantlee/archive/v0.5.1.tar.gz'
  sha1 '4b7e16e1db9e8bc88af1283e0d5d4129c224edc2'

  kde_build_deps
  depends_on 'qt' => ["with-d-bus", "with-qt3support"]
end
