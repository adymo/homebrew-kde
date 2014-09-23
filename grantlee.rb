require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Grantlee < BaseKdeFormula
  homepage 'http://grantlee.org/'
  version '0.3.0'
  url 'http://gitorious.org/grantlee/grantlee/archive-tarball/master'
  sha1 '9f64b3d5579ae32085fa459e44581f21b08469d6'

  kde_build_deps
  depends_on 'qt' => ["with-d-bus", "with-qt3support"]
end
