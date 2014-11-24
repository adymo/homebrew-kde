require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Grantlee < BaseKdeFormula
  homepage 'http://grantlee.org/'
  version '0.5.1'
  url 'https://gitorious.org/grantlee/grantlee/archive/v0.5.1.tar.gz'
  sha1 '0c89a65397e1e8402e12f586ca5f63309b5e041c'
  head 'https://gitorious.org/grantlee/grantlee.git'

  kde_build_deps
  depends_on 'qt' => ["with-d-bus", "with-qt3support"]
end
