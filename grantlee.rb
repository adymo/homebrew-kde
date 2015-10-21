require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Grantlee < BaseKdeFormula
  homepage 'http://grantlee.org/'
  version '0.5.1'
  url 'http://www.grantlee.org/downloads/grantlee-0.5.1.tar.gz'
  sha1 'fe7111bcf25d1e3ead8e48f0f1aea91df944e58d'
  head 'https://gitorious.org/grantlee/grantlee.git'

  kde_build_deps
  depends_on 'qt' => ["with-d-bus", "with-qt3support"]
end
